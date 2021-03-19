import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kjsieit_flutter/routs.dart';
import 'package:provider/provider.dart';
import 'authentication_service.dart';
import 'choice.dart';
import 'sign_in_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          initialData: null,
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
        ),
      ],
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'KJSIEIT',
          // initialRoute: AuthenticationWrapper.routeName,
          routes: routes,
          home: AuthenticationWrapper(),
          // theme: theme(),
        );
      },
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  static String routeName = "/AuthWrapper";
  AuthenticationWrapper({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return Choice();
    }
    return SignInScreen();
  }
}
