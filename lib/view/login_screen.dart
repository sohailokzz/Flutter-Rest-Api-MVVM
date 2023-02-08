import 'package:flutter/material.dart';
import 'package:rest_api_mvvp/resources/components/round_button.dart';

import '../utils/utilis.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ValueNotifier<bool> obsecurePassword = ValueNotifier<bool>(true);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              focusNode: emailFocus,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Email',
                labelText: 'Email',
                prefixIcon: Icon(
                  Icons.email_sharp,
                ),
              ),
              onFieldSubmitted: (value) {
                Utlis.fieldFocusNode(
                  context,
                  emailFocus,
                  passwordFocus,
                );
              },
            ),
            ValueListenableBuilder(
              valueListenable: obsecurePassword,
              builder: (context, value, child) {
                return TextFormField(
                  controller: _passwordController,
                  obscureText: obsecurePassword.value,
                  obscuringCharacter: "*",
                  focusNode: passwordFocus,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    labelText: 'Password',
                    prefixIcon: const Icon(
                      Icons.lock,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        obsecurePassword.value = !obsecurePassword.value;
                      },
                      icon: Icon(
                        obsecurePassword.value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility,
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: height * .1,
            ),
            RoundButton(
              title: 'Login',
              onPress: () {
                if (_emailController.text.isEmpty) {
                  Utlis.flushBarShowMessage('Please Enter Email', context);
                } else if (_passwordController.text.isEmpty) {
                  Utlis.flushBarShowMessage('Please Enter Password', context);
                } else if (_passwordController.text.length < 6) {
                  Utlis.flushBarShowMessage('Please Enter 6 Digit', context);
                } else {
                  print('Api hit');
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
