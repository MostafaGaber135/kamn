import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common/entities/user_model.dart';

class SharedPrefHelper {
  // private constructor as I don't want to allow creating an instance of this class itself.
  SharedPrefHelper._();

  /// Removes a value from SharedPreferences with given [key].

  static removeData(String key) async {
    debugPrint('SharedPrefHelper : data with key : $key has been removed');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(key);
  }

  /// Removes all keys and values in the SharedPreferences
  static clearAllData() async {
    debugPrint('SharedPrefHelper : all data has been cleared');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }

  /// Saves a [value] with a [key] in the SharedPreferences.
  static setData(String key, value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    debugPrint("SharedPrefHelper : setData with key : $key and value : $value");
    switch (value.runtimeType) {
      case String:
        await sharedPreferences.setString(key, value);
        break;
      case int:
        await sharedPreferences.setInt(key, value);
        break;
      case bool:
        await sharedPreferences.setBool(key, value);
        break;
      case double:
        await sharedPreferences.setDouble(key, value);
        break;
      default:
        return null;
    }
  }

  /// Gets a bool value from SharedPreferences with given [key].
  static getBool(String key) async {
    debugPrint('SharedPrefHelper : getBool with key : $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(key) ?? false;
  }

  /// Gets a double value from SharedPreferences with given [key].
  static getDouble(String key) async {
    debugPrint('SharedPrefHelper : getDouble with key : $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getDouble(key) ?? 0.0;
  }

  /// Gets an int value from SharedPreferences with given [key].
  static getInt(String key) async {
    debugPrint('SharedPrefHelper : getInt with key : $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(key) ?? 0;
  }

  /// Gets an String value from SharedPreferences with given [key].
  static getString(String key) async {
    debugPrint('SharedPrefHelper : getString with key : $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key) ?? '';
  }

  static getListString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? attendanceJson = prefs.getStringList(key);

    return attendanceJson;
  }

  /// Saves a [value] with a [key] in the FlutterSecureStorage.
  static setSecuredListString(String key, List<String> value) async {
    const flutterSecureStorage = FlutterSecureStorage();
    String encodedData = jsonEncode(value); // Convert list to JSON string
    await flutterSecureStorage.write(key: key, value: encodedData);
  }

  // /// Gets an String value from FlutterSecureStorage with given [key].
  static getSecuredListString(String key) async {
    const flutterSecureStorage = FlutterSecureStorage();
    String? encodedData = await flutterSecureStorage.read(key: key);
    List<String> decodedData = List<String>.from(jsonDecode(encodedData));
    return decodedData;
  }

  /// Removes all keys and values in the FlutterSecureStorage
  static clearAllSecuredData() async {
    const flutterSecureStorage = FlutterSecureStorage();

    debugPrint('FlutterSecureStorage : all data has been cleared');
    await flutterSecureStorage.deleteAll();
  }

  static Future<void> storeUserData(UserModel user) async {
    const flutterSecureStorage = FlutterSecureStorage();
    await flutterSecureStorage.write(key: 'userData', value: user.toJson());
  }

  static Future<UserModel?> getUserData() async {
    const flutterSecureStorage = FlutterSecureStorage();

    String? jsonString = await flutterSecureStorage.read(key: 'userData');

    return UserModel.fromJson(jsonString);
    }

  static Future<void> deleteUserData() async {
    const flutterSecureStorage = FlutterSecureStorage();
    await flutterSecureStorage.delete(key: 'userData');
  }

  // secure photos
}
