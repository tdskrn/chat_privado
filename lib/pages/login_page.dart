// ignore_for_file: use_build_context_synchronously

import 'package:chat_privado/helpers/mostrar_alerta.dart';
import 'package:chat_privado/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Logo(),
                _Form(),
                Labels(
                  isLogin: true,
                  firstLegend: 'Ainda não tem uma conta?',
                  secondaryLegend: 'Crie uma agora',
                ),
                Text(
                  'Termos e condições de uso',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  const _Form();

  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: <Widget>[
          CustomInput(
            icon: Icons.mail,
            isPassword: false,
            keyboardType: TextInputType.emailAddress,
            placeholder: 'Email',
            textEditingController: emailController,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomInput(
            icon: Icons.password,
            isPassword: true,
            keyboardType: TextInputType.text,
            placeholder: 'Password',
            textEditingController: passwordController,
          ),
          const SizedBox(
            height: 20,
          ),
          BtnBlueButton(
            description: "LOGIN",
            onPressed: authService.autenticando
                ? () => {}
                : () async {
                    FocusScope.of(context).unfocus();
                    final loginOk = await authService.login(
                        emailController.text.trim(),
                        passwordController.text.trim());
                    if (loginOk) {
                      // Navigar a outra tela
                      Navigator.pushReplacementNamed(context, 'users');
                    } else {
                      // Mostrar alerta
                      mostrarAlerta(context, 'Login incorreto',
                          'Revise suas credenciais');
                    }
                  },
          )
        ],
      ),
    );
  }
}
