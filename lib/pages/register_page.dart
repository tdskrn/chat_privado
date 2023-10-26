import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Logo(),
                _Form(),
                Labels(
                  isLogin: false,
                  firstLegend: 'Ja tem uma conta?',
                  secondaryLegend: 'Faça login clicando aqui!',
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
            description: "Registre-se",
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
