//init add_service_provider_to_firebase branch
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/common/class/firebase_storage_services.dart';
import 'package:kamn/core/common/class/firestore_services.dart';
import 'package:kamn/core/const/firebase_collections.dart';
import 'package:kamn/core/utils/try_and_catch.dart';
import 'package:kamn/features/sports/data/models/playground_model.dart';
import 'package:kamn/features/sports_service_providers/data/model/playground_request_model.dart';
import 'package:path/path.dart';

abstract class ServiceProvidersRemoteDataSource {
  Future<PlaygroundRequestModel> addServiceToFirestore(
      PlaygroundRequestModel playground);
  Future<List<String>> addImagesToStorage(List<File> images);
  Future<bool> deleteImagesFromStorage(List<String> images);
  Future<List<Map<String, dynamic>>> getPlaygroundsByOwnerId(String ownerId);
  Future<List<Map<String, dynamic>>> getPlaygroundsReservationDetailsById(
      String playgroundId);
  Future<List<Map<String, dynamic>>> getPlaygroundsRequests();
  Future<void> addWithTransactionToFirebase(PlaygroundModel playgroundModel);
  Future<void> updateState(String playgroundId, Map<String, dynamic> data);
  Future<void> changeReservationState(
      String reservationId, Map<String, dynamic> data);
}

@Injectable(as: ServiceProvidersRemoteDataSource)
class ServiceProvidersRemoteDataSourceImpl
    implements ServiceProvidersRemoteDataSource {
  FirestoreService firestoreServices;
  FirebaseStorageServices storageServies;
  ServiceProvidersRemoteDataSourceImpl(
      {required this.firestoreServices, required this.storageServies});

  @override
  Future<PlaygroundRequestModel> addServiceToFirestore(
      PlaygroundRequestModel playground) async {
    return executeTryAndCatchForDataLayer(() async {
      var collRef = firestoreServices.firestore
          .collection(FirebaseCollections.playgroundsRequests);
      var docRef = collRef.doc();
      playground.playgroundId = docRef.id;
      playground.state = 'pending';
      await docRef.set(playground.toMap());
      return playground;
    });
  }

  @override
  Future<List<String>> addImagesToStorage(List<File> images) async {
    List<String> imagesUrl = [];

    return executeTryAndCatchForDataLayer(() async {
      for (var image in images) {
        Reference firebaseStorageRef =
            storageServies.storage.ref().child(basename(image.path));

        UploadTask uploadTask = firebaseStorageRef.putFile(image);

        TaskSnapshot taskSnapshot = await uploadTask;

        String downloadUrl = await taskSnapshot.ref.getDownloadURL();
        imagesUrl.add(downloadUrl);
      }
      return imagesUrl;
    });
  }

  @override
  Future<bool> deleteImagesFromStorage(List<String> images) async {
    return executeTryAndCatchForDataLayer(() async {
      for (var image in images) {
        Reference firebaseStorageRef = storageServies.storage.refFromURL(image);

        await firebaseStorageRef.delete();
      }
      return true;
    });
  }

  @override
  Future<List<Map<String, dynamic>>> getPlaygroundsRequests() {
    return executeTryAndCatchForDataLayer(() async {
      var querySnapshot = await firestoreServices
          .getData(FirebaseCollections.playgroundsRequests);
      return querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    });
  }

  @override
  Future<List<Map<String, dynamic>>> getPlaygroundsByOwnerId(String ownerId) {
    return executeTryAndCatchForDataLayer(() async {
      var querySnapshot = await FirebaseFirestore.instance
          .collection(FirebaseCollections.playgroundsRequests)
          .where('ownerId', isEqualTo: ownerId)
          .get();
      return querySnapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  @override
  Future<void> addWithTransactionToFirebase(PlaygroundModel playgroundModel) {
    return executeTryAndCatchForDataLayer(() async {
      await firestoreServices.firestore.runTransaction((transaction) async {
        var deletedDocRef = firestoreServices.firestore
            .collection(FirebaseCollections.playgroundsRequests)
            .doc(playgroundModel.playgroundId);
        var addedDocRef = firestoreServices.firestore
            .collection(FirebaseCollections.playgrounds)
            .doc();
        playgroundModel.playgroundId = addedDocRef.id;
        transaction.delete(deletedDocRef);
        transaction.set(addedDocRef, playgroundModel.toMap());
      });
    });
  }

  @override
  Future<void> updateState(String playgroundId, Map<String, dynamic> data) {
    return executeTryAndCatchForDataLayer(() async {
      return await firestoreServices.updateData(
          FirebaseCollections.playgroundsRequests, playgroundId, data);
    });
  }

  @override
  Future<List<Map<String, dynamic>>> getPlaygroundsReservationDetailsById(
      String playgroundId) {
    return executeTryAndCatchForDataLayer(() async {
      var querySnapshot = await FirebaseFirestore.instance
          .collection(FirebaseCollections.reservations)
          .where('ground.playgroundId', isEqualTo: playgroundId)
          .get();
      return querySnapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  @override
  Future<void> changeReservationState(
      String reservationId, Map<String, dynamic> data) {
    return executeTryAndCatchForDataLayer(() async {
      return await firestoreServices.updateData(
          FirebaseCollections.reservation, reservationId, data);
    });
  }
}
