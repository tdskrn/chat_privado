import 'dart:convert';

import 'package:chat_privado/global/environment.dart';
import 'package:chat_privado/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../models/login_body.dart';

class AuthService with ChangeNotifier {
  late Usuario usuario;
  bool _autenticando = false;

  final _storage = const FlutterSecureStorage();

  bool get autenticando => _autenticando;

  set autenticando(bool valor) {
    _autenticando = valor;
    notifyListeners();
  }

  static Future<String?> getToken() async {
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');
    return token;
  }

  static Future<void> deleteToken() async {
    const storage = FlutterSecureStorage();
    await storage.delete(key: 'token');
  }

  Future<bool> login(String email, String password) async {
    autenticando = true;
    final data = {
      'email': email,
      'password': password,
    };

    final url = Uri.parse('${Enviroment.apiUrl}/login');

    final response = await http.post(url,
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});
    autenticando = false;
    if (response.statusCode == 200) {
      final loginBody = loginBodyFromJson(response.body);
      usuario = loginBody.usuario;

      await _guardarToken(loginBody.token);

      debugPrint(loginBody.token);
      return true;
    } else {
      return false;
    }
  }

  Future register(String nombre, String email, String password) async {
    autenticando = true;
    final data = {
      'nombre': nombre,
      'email': email,
      'password': password,
    };

    final url = Uri.parse('${Enviroment.apiUrl}/login/new');

    final response = await http.post(url,
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});
    autenticando = false;

    if (response.statusCode == 200) {
      final loginBody = loginBodyFromJson(response.body);

      usuario = loginBody.usuario;
      await _guardarToken(loginBody.token);

      return true;
    } else {
      final responseBody = jsonDecode(response.body);
      return responseBody['msg'];
    }
  }

  Future<bool> isLoggedIn() async {
    final token = await _storage.read(key: 'token');
    if (token != null) {
      final url = Uri.parse('${Enviroment.apiUrl}/login/renew');

      try {
        final response = await http.get(url,
            headers: {'Content-Type': 'application/json', 'x-token': token});

        if (response.statusCode == 200) {
          final loginBody = loginBodyFromJson(response.body);

          usuario = loginBody.usuario;
          await _guardarToken(loginBody.token);

          return true;
        } else {
          logout();
          return false;
        }
      } catch (err) {
        return false;
      }
    }
    return false;
  }

  Future _guardarToken(String token) async {
    return await _storage.write(key: 'token', value: token);
  }

  Future logout() async {
    await _storage.delete(key: 'token');
  }
}
