import 'package:flutter/material.dart';

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

  final FocusNode _passwordFocusNode = FocusNode();

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
                    child: Text('Вход')),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
