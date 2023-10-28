import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final bool isLogin;
  final String firstLegend;
  final String secondaryLegend;
  const Labels(
      {super.key,
      required this.isLogin,
      required this.firstLegend,
      required this.secondaryLegend});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          firstLegend,
          style: const TextStyle(
              color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w300),
        ),
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(
                  context, isLogin ? 'register' : 'login');
            },
            child: Text(
              secondaryLegend,
              style: TextStyle(
                  color: Colors.blue[400],
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            )),
      ],
    );
  }
}
