import 'dart:ffi';

import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  static const id = 'sign_up';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  String _email = '';
  String _username = '';
  String _password = '';

  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _usernameFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.lightGreenAccent,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  child: Text(
                    'Страница регистрации',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),

                SizedBox(height: 15), //email
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      labelText: 'Введите свою почту'),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_usernameFocusNode);
                  },
                  onSaved: (value) {
                    _email = value!.trim();
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Пожалуйста введите свою почту';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 15),
                //username
                TextFormField(
                  focusNode: _usernameFocusNode,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      labelText: 'Введите свой ник'),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_passwordFocusNode);
                  },
                  onSaved: (value) {
                    _username = value!.trim();
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Пожалуйста введите свой ник';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 15),
                //password
                TextFormField(
                  focusNode: _passwordFocusNode,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      labelText: 'Введите свой пароль'),
                  obscureText: true,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    //  TODO: - Submit Form
                  },
                  onSaved: (value) {
                    _password = value!.trim();
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Пожалуйста введите свой пароль';
                    }
                    if (value.length < 5) {
                      return 'Пароль должен сожержать более 5 символов';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 15),
                TextButton(
                    onPressed: () {
                      //  TODO: - Submit Form
                    },
                    child: Text('Регистрация')),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
