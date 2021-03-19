import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'authentication_service.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text("Sigin"),
          onPressed: () {
            context.read<AuthenticationService>().loginUserWithGoogle(context);
          },
        ),
      ),
    );
  }
}
