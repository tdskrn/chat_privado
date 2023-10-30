// To parse this JSON data, do
//
//     final loginBody = loginBodyFromJson(jsonString);

import 'dart:convert';

import 'package:chat_privado/models/usuario.dart';

LoginBody loginBodyFromJson(String str) => LoginBody.fromJson(json.decode(str));

String loginBodyToJson(LoginBody data) => json.encode(data.toJson());

class LoginBody {
  final bool ok;
  final Usuario usuario;
  final String token;

  LoginBody({
    required this.ok,
    required this.usuario,
    required this.token,
  });

  factory LoginBody.fromJson(Map<String, dynamic> json) => LoginBody(
        ok: json["ok"],
        usuario: Usuario.fromJson(json["usuario"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "usuario": usuario.toJson(),
        "token": token,
      };
}
