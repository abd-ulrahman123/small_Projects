// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:gallary/mainpage.dart';
import 'package:gallary/signingin.dart';
import 'package:gallary/thememode.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => ModeTheme(),
    ),
    ChangeNotifierProvider(create: (context) => Signin())
  ], child: MainApp()));
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final modeThemeprovider = Provider.of<ModeTheme>(context);
    var themeData = modeThemeprovider.them
        ? ThemeData.dark(useMaterial3: true)
        : ThemeData.light(useMaterial3: true);
    return MaterialApp(
        theme: themeData, debugShowCheckedModeBanner: false, home: Main());
  }
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController user = TextEditingController();
    TextEditingController pass = TextEditingController();
    final modeThemeprovider = Provider.of<ModeTheme>(context);
    final signInprovider = Provider.of<Signin>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('SIGN IN'),
        actions: [
          ToggleButtons(isSelected: [
            modeThemeprovider.them
          ], children: [
            IconButton(
                onPressed: () {
                  modeThemeprovider.changetheme();
                },
                icon: modeThemeprovider.them
                    ? Icon(
                        Icons.sunny,
                        size: 36,
                      )
                    : Icon(
                        Icons.mode_night_outlined,
                        size: 36,
                      ))
          ])
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome!',
                style: TextStyle(fontSize: 24.0),
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: user,
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
              ),
              SizedBox(height: 10.0),
              TextField(
                controller: pass,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
              signInprovider.isSigned
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Forgot Password ?",
                            style: TextStyle( 
                              color: const Color.fromARGB(255, 20, 69, 109),
                              decoration: TextDecoration.underline,
                            ))
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "username or password incorrect Try again",
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                        //SizedBox(
                        //width: 40,
                        //),
                        Text(
                          "Forgot Password?",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 20, 69, 109),
                              decoration: TextDecoration.underline),
                        )
                      ],
                    ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: Text('Sign in with Google'),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                  ),
                  SizedBox(width: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      (user.text == 'happy' && pass.text == 'happy')
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()))
                          : signInprovider.notSigned();
                    },
                    child: Text('Sign in'),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Text(
                'Developed by Abuda',
                style: TextStyle(fontSize: 16.0, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
