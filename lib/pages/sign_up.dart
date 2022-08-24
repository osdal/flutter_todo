import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_cubit.dart';

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
  void dispose() {
    _passwordFocusNode.dispose();
    _usernameFocusNode.dispose();
    super.dispose();
  }

  void _submit(BuildContext context) {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) {
      //invalid
      return;
    }

    _formKey.currentState!.save();

    context
        .read<AuthCubit>()
        .sighnUp(email: _email, username: _username, password: _password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.lightGreenAccent,
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (prevState, currState) {
          if (currState is AuthSighnedUp) {
            //TODO:~Navigation to list of posts
            Navigator.of(context).pushReplacementNamed(SignUpScreen.id);
          }
          if (currState is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              duration: Duration(seconds: 2),
              content: Text(currState.message),
            ));
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return SafeArea(
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
                        _submit(context);
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
                          _submit(context);
                        },
                        child: Text('Регистрация')),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(SignUpScreen.id);
                        },
                        child: Text('Отмена'))
                  ]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
