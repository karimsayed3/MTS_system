import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper
{
  static  SharedPreferences? _sharedPreferences;


  static init()
  async{
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putdata({
    required String key,
    required bool value,
  })
  async{
    return await _sharedPreferences!.setBool(key, value);
  }

  static dynamic getdata({
    required String key,
  })
  {
    return _sharedPreferences!.get(key);
  }

  static Future<bool> saveData(
      {
        required String key, required dynamic value,
      })async
  {
    if(value is String) return await _sharedPreferences!.setString(key, value);
    if(value is int) return await _sharedPreferences!.setInt(key, value);
    if(value is bool) return await _sharedPreferences!.setBool(key, value);

    return await _sharedPreferences!.setDouble(key, value);

  }

  static Future<bool> removeData(
      {
        required String key,
      }
      )async{
    return await _sharedPreferences!.remove(key);
  }

}