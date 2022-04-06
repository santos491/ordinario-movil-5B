import 'package:flutter/material.dart';
import 'package:touryucatan/screens/Recorrido_detail_screen.dart';
import 'package:touryucatan/screens/Recorridos_list_screen.dart';


class Tours extends StatelessWidget {
  @override
Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.red
      ),
      home: RutasListScreen(),
      routes: {
       RutasListScreen.routeName: (context) => RutasListScreen(),
        RutasDetailScreen.routeName: (context) => RutasDetailScreen()
      },
    );
  }

