import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:touryucatan/model/recorridoo.dart';
import 'package:touryucatan/screens/Recorrido_detail_screen.dart';



class RutasListScreen extends StatefulWidget {
  const RutasListScreen({ Key? key }) : super(key: key);

  static const String routeName = '';

  @override
  _RutasListScreenState createState() => _RutasListScreenState();
}

class _RutasListScreenState extends State<RutasListScreen> {
  
  List<recorridoo> recorridoos = [];

  Future<void> readJsonFile() async {

    final String response = await rootBundle.loadString('assets/Rutas.json');
    final productData = await json.decode(response);

    var list = productData["items"] as List<dynamic>;

    setState(() {
      recorridoos = list.map((e) => recorridoo.fromJson(e)).toList();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista de Lugares"),),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(onPressed: readJsonFile, child: const Text("Lugares Disponibles")),
          ),

          if (recorridoos.length > 0) 
            Expanded(
              child: ListView.builder(
                itemCount: recorridoos.length,
                itemBuilder: (BuildContext context, index) {
                  return Card(
                    margin: const EdgeInsets.all(15.0),
                    color: Colors.greenAccent[100],
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(recorridoos[index].name),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(recorridoos[index].id.toString(), style: const TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      onTap: () {
                        // print(jsonEncode(products[index]));
                        Navigator.of(context).pushNamed(RutasDetailScreen.routeName, arguments: jsonEncode(recorridoos[index]));
                      },
                    )
                  );
                },
              ),
            )
           else 
              Container(child: Text("No Disponibles"),)

        ],
      ),
    );
  }
}