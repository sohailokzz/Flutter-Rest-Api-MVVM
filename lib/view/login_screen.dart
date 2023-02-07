import 'package:flutter/material.dart';
import 'package:rest_api_mvvp/utils/utilis.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            Utlis.flushBarShowMessage(
              'Flus Bar message',
              context,
            );
          },
          child: const Text('Click Me'),
        ),
      ),
    );
  }
}
