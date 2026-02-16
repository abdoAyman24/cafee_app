import 'dart:convert';

import 'package:caffee/Core/service/shared_preferences.dart';
import 'package:caffee/Feature/Auth/data/model/user_model.dart';
import 'package:caffee/Feature/Auth/domain/entity/user_entity.dart';
import 'package:caffee/constance.dart';

UserEntity getUser() {
  var jsonData = SharedPreferencesSingleton.getUser(KUserData);
  var userEntitt = UserModel.fromJson(jsonDecode(jsonData)).toUSerEntity();
  return userEntitt;
}
