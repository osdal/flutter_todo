import 'package:flutter/material.dart';
import '/pages/log_in.dart';
import '/pages/sign_up.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: Text('Список дел'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Main Screen',
                style: TextStyle(color: Colors.white),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, SignUpScreen.id);
                      },
                      child: Text('Регистрация')),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(fixedSize: Size(120, 30)),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, LogInScreen.id);
                      },
                      child: Text('Вход')),
                ],
              ),
            ],
          ),
        ));
  }
}
