import 'dart:async';


import 'package:flutter/material.dart';
import 'package:touryucatan/api/craftsmen_api.dart';
import 'package:touryucatan/model/craftsmen.dart';
import 'package:touryucatan/widget/search_widget.dart';
import '../main.dart';

class GiveListPage extends StatefulWidget {
  @override
  GiveListPageState createState() => GiveListPageState();
}

class GiveListPageState extends State<GiveListPage> {
  List<Artesano> artesanos = [];
  String query = '';
  Timer? debouncer;

  @override
  void initState() {
    super.initState();

    init();
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  Future init() async {
    final artesanos = await ArtesanosApi.getArtesanos(query);

    setState(() => this.artesanos = artesanos);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          //title: Text(MyApp.title),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            buildSearch(),
            Expanded(
              child: ListView.builder(
                itemCount: artesanos.length,
                itemBuilder: (context, index) {
                  final artesano = artesanos[index];

                  return buildBook(artesano);
                },
              ),
            ),
          ],
        ),
      );

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'BUSCAR',
        onChanged: searchArtesano,
      );

  Future searchArtesano(String query) async => debounce(() async {
        final artesanos = await ArtesanosApi.getArtesanos(query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.artesanos = artesanos;
        });
      });

  Widget buildBook(Artesano artesano) => ListTile(
        leading: Image.network(
          artesano.img,
          fit: BoxFit.cover,
          width: 150,
          height: 180,
        ),
        title: Text(artesano.negocio), 
        subtitle: Text(artesano.direccion),
        
      );
}
