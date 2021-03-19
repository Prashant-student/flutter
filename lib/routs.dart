import 'package:flutter/widgets.dart';
import 'package:kjsieit_flutter/choice_class.dart';
import 'package:kjsieit_flutter/Detail/detail.dart';
import 'package:kjsieit_flutter/text_upload.dart';
import 'package:kjsieit_flutter/upload_image.dart';
import 'package:kjsieit_flutter/upload_video.dart';
import 'choice.dart';
import 'home.dart';
import 'main.dart';
import 'sign_in_screen.dart';

//We use name route
// All our routes will be available here

final Map<String, WidgetBuilder> routes = {
  SignInScreen.routeName: (context) => SignInScreen(),
  Choice.routeName: (context) => Choice(),
  AuthenticationWrapper.routeName: (context) => AuthenticationWrapper(),
  ChoiceClass.routeName: (context) => ChoiceClass(),
  Home.routeName: (context) => Home(),
  Detail.routeName: (context) => Detail(),
  UploadImage.routeName: (context) => UploadImage(),
  UploadVideo.routeName: (context) => UploadVideo(),
  TextUpload.routeName: (context) => TextUpload(),
};
