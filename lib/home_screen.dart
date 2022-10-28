//@dart=2.9
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'rounded_button.dart';

User loggedinUser;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

int element = 0;

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;

  // void initState() {
  //   super.initState();
  //   getCurrentUser();
  // }

  // //using this function you can use the credentials of the user
  // void getCurrentUser() async {
  //   try {
  //     final user = await _auth.currentUser;
  //     if (user != null) {
  //       loggedinUser = user;
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       leading: null,
  //       actions: <Widget>[
  //         IconButton(
  //             icon: Icon(Icons.close),
  //             onPressed: () {
  //               _auth.signOut();
  //               Navigator.pop(context);

  //               //Implement logout functionality
  //             }),
  //       ],
  //       title: Text('Home Page'),
  //       backgroundColor: Colors.lightBlueAccent,
  //     ),
  //     body: Center(
  //       child: Text(
  //         "Welcome User",
  //         style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
  //       ),
  //     ),
  //   );
  // }
  // List<CustomCard> customcardlist = [];
  // List<int> counterslist = [];
  // addWidget() {
  //   customcardlist.add(CustomCard());
  // }
  int cardcount = 0;
  List<int> counterList = [0];
  List<int> cardlist = [0];
  List<TextEditingController> _widgetname =
      List.generate(74, (index) => TextEditingController());

  void currentcounter() {
    setState(() {
      counterList[cardcount]++;
      element = counterList[cardcount];
    });
  }

  @override
  Widget build(BuildContext context) {
    //   Widget dynamicTextFieldnew = new Flexible(
    //     flex: 2,
    //     child: new ListView.builder(
    //       itemCount: customcardlist.length,
    //       itemBuilder: (_, index) => customcardlist[index],
    //     ),
    //   );

    //   Widget result = new Flexible(
    //     flex: 1,
    //     child: new CustomCard(
    //     ),
    //   );
    return Scaffold(
      drawer: Drawer(
        child: ListView(),
      ),
      backgroundColor: Color(0xFF292C33),
      appBar: AppBar(
        title: Text(
          'Healthify Me',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.purple,
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.purple,
          child: Icon(Icons.add),
          tooltip: 'Add new cards :)',
          onPressed: () {
            cardcount += 1;
            cardlist.add(cardcount);
            setState(() {});
          }),
      body: Padding(
          padding: EdgeInsets.only(top: 38.0, right: 10, left: 10),
          child: ListView.builder(
              itemCount: cardlist.length,
              itemBuilder: (content, index) {
                return Container(
                  height: 170,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    shadowColor: Colors.purple,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF292C33),
                            Colors.purple,
                            Color(0xFF292C33),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _widgetname[index],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Text(
                              'Number of times you have logged in $counterList',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          RoundedButton(
                              colour: Colors.black,
                              title: 'Count Up !',
                              onPressed: currentcounter),
                        ],
                      ),
                    ),
                    elevation: 8,
                  ),
                );
              })),
    );
  }
}
