import 'package:flutter/material.dart';
import 'package:srdrbk/core/base_functions/base_functions.dart';

class SignatureWidget extends StatelessWidget {
  const SignatureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        BaseFunctions.isDarkMode(context)
            ? "assets/images/signature_white.png"
            : "assets/images/signature_black.png",
      ),
    );
  }
}
