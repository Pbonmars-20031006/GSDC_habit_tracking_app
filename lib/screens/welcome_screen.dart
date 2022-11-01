//@dart=2.9
import 'package:flutter/material.dart';
import '../widgets/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF292C33),
      appBar: AppBar(
        backgroundColor: Color(0xFF396AFC),
      ),
      body: Container(
        child: Align(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(20, 100, 0, 0),
                width: double.infinity,
                child: Center(
                  child: Text(
                    'Lets get Started!!',
                    style: TextStyle(
                        fontSize: 40,
                        letterSpacing: 0.5,
                        fontFamily: 'PlayfairDisplay',
                        color: Colors.white),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 100,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      RoundedButton(
                        colour: Colors.black,
                        title: 'Log In',
                        onPressed: () {
                          Navigator.pushNamed(context, 'login_screen');
                        },
                      ),
                      RoundedButton(
                          colour: Colors.black,
                          title: 'Register',
                          onPressed: () {
                            Navigator.pushNamed(context, 'registration_screen');
                          }),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
