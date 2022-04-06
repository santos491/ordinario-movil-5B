
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:touryucatan/pages/craftsmen.dart';
import 'package:touryucatan/pages/restaurant.dart';
import 'package:touryucatan/pages/tours.dart';
import 'dart:convert';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.red,
        
      ),
      home: const Home(),
    );
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final items = const [
    Icon(Icons.place, size: 30,),
    Icon(Icons.restaurant, size: 30,),
    Icon(Icons.people, size: 30,),
  ];

  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('PUEBLOS MAGICOS'),
        backgroundColor: Colors.red,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        items: items,
        index: index,
        onTap: (selctedIndex){
          setState(() {
            index = selctedIndex;
          });
        },
        height: 70,
        backgroundColor: Colors.transparent,
        animationDuration: const Duration(milliseconds: 300),
        // animationCurve: ,
      ),
      body: Container(
        color: Colors.red,
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: getSelectedWidget(index: index),
      ),
      
    );
  }

  Widget getSelectedWidget({required int index}){
    Widget widget;
    switch(index){
      case 0:
        widget =  Tours();
        break;
      case 1:
        widget = Restaurant();
        break;
      case 2:
        widget = Craftsmen();
        break;
      default:
        widget =  Restaurant();
        break;
    }
    return widget;
  }
}

