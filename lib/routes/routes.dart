import 'package:chat_privado/pages/pages.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext context)> appRoutes = {
  "chat": (_) => const ChatPage(),
  "loading": (_) => const LoadingPage(),
  "login": (_) => const LoginPage(),
  "register": (_) => const RegisterPage(),
  "users": (_) => const UsuariosPage(),
};
