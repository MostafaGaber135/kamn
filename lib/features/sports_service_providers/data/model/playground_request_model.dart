import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class PlaygroundRequestModel {
  String? playgroundId;
  String? name;
  String? phone;
  double? longitude;
  double? latitude;
  String? ownerId; //get from user credential
  String? address;
  String? status; // need to handel
  double? rating; //calcolute from developer
  double? price; // need to handel  /*
  String? description; // need to handel /*
  List<String>? groundImages;
  List<String>? ownershipImages;
  int? size;
  AvailableTime? availableTime;
  num? period;
  String? govenrate;
  String? state;
  String? comment;
  String? type;
  PlaygroundRequestModel({
    this.playgroundId,
    this.name,
    this.phone,
    this.longitude,
    this.latitude,
    this.ownerId,
    this.address,
    this.status,
    this.rating,
    this.price,
    this.description,
    this.groundImages,
    this.ownershipImages,
    this.size,
    this.availableTime,
    this.period,
    this.govenrate,
    this.state,
    this.comment,
    this.type,
  });

  PlaygroundRequestModel copyWith({
    ValueGetter<String?>? playgroundId,
    ValueGetter<String?>? name,
    ValueGetter<String?>? phone,
    ValueGetter<double?>? longitude,
    ValueGetter<double?>? latitude,
    ValueGetter<String?>? ownerId,
    ValueGetter<String?>? address,
    ValueGetter<String?>? status,
    ValueGetter<double?>? rating,
    ValueGetter<double?>? price,
    ValueGetter<String?>? description,
    ValueGetter<List<String>?>? groundImages,
    ValueGetter<List<String>?>? ownershipImages,
    ValueGetter<int?>? size,
    ValueGetter<AvailableTime?>? availableTime,
    ValueGetter<num?>? period,
    ValueGetter<String?>? govenrate,
    ValueGetter<String?>? state,
    ValueGetter<String?>? comment,
    ValueGetter<String?>? type,
  }) {
    return PlaygroundRequestModel(
      playgroundId: playgroundId != null ? playgroundId() : this.playgroundId,
      name: name != null ? name() : this.name,
      phone: phone != null ? phone() : this.phone,
      longitude: longitude != null ? longitude() : this.longitude,
      latitude: latitude != null ? latitude() : this.latitude,
      ownerId: ownerId != null ? ownerId() : this.ownerId,
      address: address != null ? address() : this.address,
      status: status != null ? status() : this.status,
      rating: rating != null ? rating() : this.rating,
      price: price != null ? price() : this.price,
      description: description != null ? description() : this.description,
      groundImages: groundImages != null ? groundImages() : this.groundImages,
      ownershipImages:
          ownershipImages != null ? ownershipImages() : this.ownershipImages,
      size: size != null ? size() : this.size,
      availableTime:
          availableTime != null ? availableTime() : this.availableTime,
      period: period != null ? period() : this.period,
      govenrate: govenrate != null ? govenrate() : this.govenrate,
      state: state != null ? state() : this.state,
      comment: comment != null ? comment() : this.comment,
      type: type != null ? type() : this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'playgroundId': playgroundId,
      'name': name,
      'phone': phone,
      'longitude': longitude,
      'latitude': latitude,
      'ownerId': ownerId,
      'address': address,
      'status': status,
      'rating': rating,
      'price': price,
      'description': description,
      'groundImages': groundImages,
      'ownershipImages': ownershipImages,
      'size': size,
      'available_time': availableTime?.toMap(),
      'period': period,
      'govenrate': govenrate,
      'state': state,
      'comment': comment,
      'type': type,
    };
  }

  factory PlaygroundRequestModel.fromMap(Map<String, dynamic> map) {
    return PlaygroundRequestModel(
      playgroundId: map['playgroundId'],
      name: map['name'],
      phone: map['phone'],
      longitude: map['longitude']?.toDouble(),
      latitude: map['latitude']?.toDouble(),
      ownerId: map['ownerId'],
      address: map['address'],
      status: map['status'],
      rating: map['rating']?.toDouble(),
      price: map['price']?.toDouble(),
      description: map['description'],
      groundImages: List<String>.from(map['groundImages']),
      ownershipImages: List<String>.from(map['ownershipImages']),
      size: map['size']?.toInt(),
      availableTime: map['available_time'] != null
          ? AvailableTime.fromMap(map['available_time'])
          : null,
      period: map['period'],
      govenrate: map['govenrate'],
      state: map['state'],
      comment: map['comment'],
      type: map['type'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PlaygroundRequestModel.fromJson(String source) =>
      PlaygroundRequestModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PlaygroundRequestModel(playgroundId: $playgroundId, name: $name, phone: $phone, longitude: $longitude, latitude: $latitude, ownerId: $ownerId, address: $address, status: $status, rating: $rating, price: $price, description: $description, groundImages: $groundImages, ownershipImages: $ownershipImages, size: $size, availableTime: $availableTime, peroid: $period, govenrate: $govenrate, state: $state, comment: $comment, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PlaygroundRequestModel &&
        other.playgroundId == playgroundId &&
        other.name == name &&
        other.phone == phone &&
        other.longitude == longitude &&
        other.latitude == latitude &&
        other.ownerId == ownerId &&
        other.address == address &&
        other.status == status &&
        other.rating == rating &&
        other.price == price &&
        other.description == description &&
        listEquals(other.groundImages, groundImages) &&
        listEquals(other.ownershipImages, ownershipImages) &&
        other.size == size &&
        other.availableTime == availableTime &&
        other.period == period &&
        other.govenrate == govenrate &&
        other.state == state &&
        other.comment == comment &&
        other.type == type;
  }

  @override
  int get hashCode {
    return playgroundId.hashCode ^
        name.hashCode ^
        phone.hashCode ^
        longitude.hashCode ^
        latitude.hashCode ^
        ownerId.hashCode ^
        address.hashCode ^
        status.hashCode ^
        rating.hashCode ^
        price.hashCode ^
        description.hashCode ^
        groundImages.hashCode ^
        ownershipImages.hashCode ^
        size.hashCode ^
        availableTime.hashCode ^
        period.hashCode ^
        govenrate.hashCode ^
        state.hashCode ^
        comment.hashCode ^
        type.hashCode;
  }
}

class AvailableTime {
  Map<String, List<DateTime>>? data;
  AvailableTime({
    this.data,
  });

  AvailableTime copyWith({
    ValueGetter<Map<String, List<DateTime>>?>? data,
  }) {
    return AvailableTime(
      data: data != null ? data() : this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return data!.map(
      (key, dateTimeList) => MapEntry(
        key,
        dateTimeList
            .map((dateTime) => dateTime.millisecondsSinceEpoch)
            .toList(),
      ),
    );
  }

  factory AvailableTime.fromMap(Map<String, dynamic> map) {
    return AvailableTime(
        data: map.map(
      (key, list) => MapEntry(
        key,
        (list as List<dynamic>)
            .map((millis) => DateTime.fromMillisecondsSinceEpoch(millis as int))
            .toList(),
      ),
    ));
  }

  String toJson() => json.encode(toMap());

  factory AvailableTime.fromJson(String source) =>
      AvailableTime.fromMap(json.decode(source));

  @override
  String toString() => 'AvailableTime(data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AvailableTime && mapEquals(other.data, data);
  }

  @override
  int get hashCode => data.hashCode;
}
