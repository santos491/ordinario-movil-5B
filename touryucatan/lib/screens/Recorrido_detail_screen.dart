
import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:touryucatan/model/recorridoo.dart';
import 'package:url_launcher/url_launcher.dart';


class RutasDetailScreen extends StatefulWidget {
  const RutasDetailScreen({ Key? key }) : super(key: key);

  static const String routeName = '';

  @override
  _RutasDetailScreenState createState() => _RutasDetailScreenState();
}

class _RutasDetailScreenState extends State<RutasDetailScreen> {
  
  var productName = "";
  recorridoo? recorrer;

  @override
  void initState(){
    super.initState();
  }

  @override
  void didChangeDependencies() {

    var productString = ModalRoute.of(context)?.settings.arguments as String;
    print('page 2');
    print(productString);

    var productJson = jsonDecode(productString);
    print(productJson);

    setState(() {
      
      recorrer = recorridoo.fromJson(productJson);
      productName = recorrer!.name;

    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(productName),),
      body: Center(
        child: Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 25,),
                  Container(
                    margin: const EdgeInsets.all(5.0),
                    child: Text("LUGAR : " + (recorrer!.name) ,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0)),
                  ),
                   Container(
                            height: 90,
                            width: 90,
                            child: Image.asset('images/face1.jpg')
                   ),
                  const SizedBox(height: 15,),
                  Container(
                      margin: const EdgeInsets.all(5.0),
                      child: Text("DESCRIPCION : " + (recorrer!.description.toString()),
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0))
                  ),
                  const SizedBox(height: 15,),
                  Container(
                      margin: const EdgeInsets.all(5.0),
                      child: Text("DIRECCION : " + (recorrer!.direction.toString()),
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0))
                  ),
                  RaisedButton(
                    child: const Text("Tours"),
                    onPressed:(){
                    launch("https://programadestinosmexico.com/guias-turisticas-de-mexico/Gu%C3%ADa-Tur%C3%ADstica-de-Yucatan.pdf");
                    }),
                ],
              ),
          ),
      ),
    );
  }
}