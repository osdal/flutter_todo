import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/bloc/auth_cubit.dart';
import 'package:todolist/pages/sign_up.dart';

class LogInScreen extends StatefulWidget {
  static const String id = 'log_in_screen';
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';

  late final FocusNode _passwordFocusNode;
  @override
  void initState() {
    super.initState();

    _passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _submit(BuildContext context) {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) {
      //invalid
      return;
    }

    _formKey.currentState!.save();

    context.read<AuthCubit>().sighnIn(email: _email, password: _password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.lightGreenAccent,
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (prevState, currentState) {
          if (currentState is AuthSighnedIn) {
            //TODO:~Navigation to list of posts
          }
          if (currentState is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              duration: Duration(seconds: 2),
              content: Text(currentState.message),
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
                        'Страница входа',
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
                        FocusScope.of(context).requestFocus(_passwordFocusNode);
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
                        child: Text('Вход')),
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
