import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'welcome_screen.dart';

class spalsh_screen extends StatefulWidget {
  const spalsh_screen({super.key});

  @override
  State<spalsh_screen> createState() => _spalsh_screenState();
}

class _spalsh_screenState extends State<spalsh_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF292C33),
      body: Container(
        child: Align(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(20, 100, 0, 0),
                width: double.infinity,
                child: Text(
                  'Welcome :)',
                  style: TextStyle(
                      fontSize: 40,
                      letterSpacing: 0.5,
                      fontFamily: 'PlayfairDisplay',
                      color: Colors.white),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                width: double.infinity,
                child: Text(
                  'Hey There !',
                  style: TextStyle(
                      fontSize: 40,
                      letterSpacing: 0.5,
                      fontFamily: 'PlayfairDisplay',
                      color: Colors.white),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 40, 0, 0),
                width: double.infinity,
                child: Text(
                  'We at healthify care about you and want to provide you with an emerging solution to track all yout habits.',
                  style: TextStyle(
                      fontSize: 30,
                      letterSpacing: 0.5,
                      fontFamily: 'PlayfairDisplay',
                      color: Colors.white),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 100, 20, 0),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WelcomeScreen()),
                        );
                      },
                      child: Center(
                        child: Text(
                          'Hop On',
                          style: TextStyle(
                            fontSize: 20,
                            letterSpacing: 0.5,
                            fontFamily: 'PlayfairDisplay',
                            color: Colors.black,
                          ),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(primary: Colors.purple),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
