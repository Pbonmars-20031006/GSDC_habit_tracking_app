//@dart=2.9
import 'dart:core';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_auth/screens/statistics_screen.dart';
import 'package:flutter_auth/widgets/CustomCard.dart';
import 'package:flutter_auth/hive_models/carddetails.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../widgets/rounded_button.dart';
import 'package:hive/hive.dart';
import '../hive_models/boxes.dart';
import 'timer.dart';
import 'statistics_screen.dart';

User loggedinUser;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

int element = 0;

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;

  final List<cardetails> carddetails = [];

  @override
  void dispose() {
    Hive.box('carddetails').close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        centerTitle: true,
        backgroundColor: Color(0xFF396AFC),
      ),
      body: ValueListenableBuilder<Box<cardetails>>(
        valueListenable: Boxes.getCardetails().listenable(),
        builder: (context, box, _) {
          final cards = box.values.toList().cast<cardetails>();

          return buildContent(cards);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF396AFC),
        child: Icon(Icons.add),
        onPressed: () => showDialog(
          context: context,
          builder: (context) => CustomCard(
            onClickedDone: addTransaction,
          ),
        ),
        tooltip: 'Click to add a habit',
      ),
    );
  }

  Widget buildContent(List<cardetails> carddetails) {
    return Container(
        child: ListView.builder(
      padding: EdgeInsets.all(8),
      itemCount: carddetails.length,
      itemBuilder: (BuildContext context, int index) {
        final cardAt = carddetails[index];

        return buildTransaction(context, cardAt);
      },
    ));
  }

  Widget buildTransaction(
    BuildContext context,
    cardetails cardAt,
  ) {
    return Card(
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          //borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              Color(0xFF396AFC),
              Color(0XFF6188FF),
              Color(0xFF86A4FF),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ExpansionTile(
          tilePadding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          title: Container(
            child: Text(
              cardAt.widget_name,
              maxLines: 2,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white),
            ),
          ),
          children: [
            Text(
              'Your Current Count is ${cardAt.count}',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white),
            ),
            buildButtons(context, cardAt),
          ],
        ),
      ),
    );
  }

  Widget buildButtons(BuildContext context, cardetails cardAt) {
    return Row(
      children: [
        Expanded(
          child: TextButton.icon(
            label: Text(
              '',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            icon: Icon(
              Icons.edit,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CustomCard(
                  carddetails: cardAt,
                  onClickedDone: (name, amount) =>
                      editTransaction(cardAt, name, amount),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: TextButton.icon(
            label: Text(
              '',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            icon: Icon(
              Icons.delete,
              color: Colors.white,
            ),
            onPressed: () => deleteTransaction(cardAt),
          ),
        ),
        Expanded(
            child: TextButton.icon(
          label: Text(
            '',
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
          icon: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () => countUp(cardAt),
        )),
        Expanded(
            child: TextButton.icon(
          label: Text(
            '',
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
          icon: Icon(
            Icons.remove,
            color: Colors.white,
          ),
          onPressed: () => countDown(cardAt),
        )),
        Expanded(
          child: TextButton.icon(
            label: Text(
              '',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            icon: Icon(
              Icons.timer_3_select,
              color: Colors.white,
            ),
            onPressed: () => createTimer(cardAt),
          ),
        ),
        Expanded(
          child: TextButton.icon(
            label: Text(
              '',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            icon: Icon(
              Icons.auto_graph_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => StatsScreen(
                          name: cardAt.widget_name, count: cardAt.count)));
            },
          ),
        ),
      ],
    );
  }

  Future addTransaction(String name, int amount) async {
    final cardAt = cardetails()
      ..widget_name = name
      //..createdDate = DateTime.now()
      ..count = amount;

    final box = Boxes.getCardetails();
    box.add(cardAt);
    //box.put('mykey', transaction);

    // final mybox = Boxes.getTransactions();
    // final myTransaction = mybox.get('key');
    // mybox.values;
    // mybox.keys;
  }

  void editTransaction(
    cardetails cardAt,
    String name,
    int count,
  ) {
    cardAt.widget_name = name;
    cardAt.count = count;

    // final box = Boxes.getTransactions();
    // box.put(transaction.key, transaction);

    cardAt.save();
  }

  void deleteTransaction(cardetails cardAt) {
    // final box = Boxes.getTransactions();
    // box.delete(transaction.key);

    cardAt.delete();
    //setState(() => transactions.remove(transaction));
  }

  void countUp(cardetails cardAt) {
    DateTime day = DateTime.now();
    String date = day.toString().substring(0, 10);
    cardAt.count++;
    setState(() {});
    cardAt.date.add(date);
    String x = cardAt.date[0];
    print(x);
    print(cardAt.widget_name);
    cardAt.save();
  }

  void countDown(cardetails cardAt) {
    cardAt.count--;
    setState(() {});

    cardAt.save();
  }

  void createTimer(cardetails cardAT) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => timer(count: cardAT.count)),
    );
  }
}
