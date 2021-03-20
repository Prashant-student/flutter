import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kjsieit_flutter/routs.dart';
import 'package:kjsieit_flutter/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'authentication_service.dart';
import 'choice.dart';
import 'sign_in_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
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
        ChangeNotifierProvider(create: (context) => ThemeNotifier()),
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
        final themeProvider = Provider.of<ThemeNotifier>(context);

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'KJSIEIT',
          // initialRoute: AuthenticationWrapper.routeName,
          routes: routes,
          home: AuthenticationWrapper(),
          // theme: themeProvider.darkTheme ? dark : light,
          themeMode: themeProvider.darkTheme ? ThemeMode.dark : ThemeMode.light,
          darkTheme: ThemeData.dark(),
          // theme: MyThemes.lightTheme,
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
