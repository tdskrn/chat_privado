import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      margin: const EdgeInsets.only(top: 50),
      width: 170,
      child: const Column(
        children: <Widget>[
          Image(
            image: AssetImage('assets/tag-logo.png'),
          ),
          Text(
            'Messenger',
            style: TextStyle(fontSize: 30),
          )
        ],
      ),
    ));
  }
}
