import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/bloc/auth_cubit.dart';
import 'firebase_options.dart';

import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/main_screen.dart';
import 'pages/log_in.dart';
import 'pages/sign_up.dart';

import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(BlocProvider<AuthCubit>(
    create: (context) => AuthCubit(),
    child: MaterialApp(
      theme: ThemeData(
          // primaryColor: Colors.red,
          ),
      initialRoute: '/',
      routes: {
        // '/auth': (context) => Auth(),
        '/': (context) => MainScreen(),
        '/todo': (context) => Home(),
        SignUpScreen.id: (context) => SignUpScreen(),
        LogInScreen.id: (context) => LogInScreen(),
      },
    ),
  ));
}
