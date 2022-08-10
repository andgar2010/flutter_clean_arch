// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import '../../core/utils/type.dart';

List<User> welcomeFromJson(String str) {
  return List<User>.from(json.decode(str).map((x) => User.fromJson(x)));
}

String welcomeToJson(List<User> data) {
  return json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}

class User {
  User({
    required this.firstname,
    required this.lastname,
    required this.gender,
  });

  factory User.fromJson(Json json) {
    return User(
      firstname: json["firstname"],
      lastname: json["lastname"],
      gender: json["gender"],
    );
  }

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  final String firstname;
  final String gender;
  final String lastname;

  User copyWith({
    String? firstname,
    String? lastname,
    String? gender,
  }) {
    return User(
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      gender: gender ?? this.gender,
    );
  }

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() {
    return {
      "firstname": firstname,
      "lastname": lastname,
      "gender": gender,
    };
  }

  @override
  String toString() {
    return 'User($firstname $lastname $gender)';
  }
}
