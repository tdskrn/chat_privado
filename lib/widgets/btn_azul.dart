import 'package:flutter/material.dart';

class BtnBlueButton extends StatelessWidget {
  final String description;
  final VoidCallback onPressed;
  const BtnBlueButton(
      {super.key, required this.description, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
        shape: MaterialStatePropertyAll(
          StadiumBorder(
            side: BorderSide(width: 0.6),
          ),
        ),
      ),
      onPressed: onPressed,
      child: SizedBox(
        height: 55,
        width: double.infinity,
        child: Center(
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
