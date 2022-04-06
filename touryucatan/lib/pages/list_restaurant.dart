import 'dart:async';

import 'package:flutter/material.dart';
import 'package:touryucatan/api/restaurant_api.dart';
import 'package:touryucatan/model/restaurant.dart';
import 'package:touryucatan/widget/search_widget.dart';
import '../main.dart';

class GivesListPage extends StatefulWidget {
  @override
  GivesListPageState createState() => GivesListPageState();
}

class GivesListPageState extends State<GivesListPage> {
  List<Restaurante> restaurantes = [];
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
    final restaurantes = await RestaurantsApi.getRestaurant(query);

    setState(() => this.restaurantes = restaurantes );
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
                itemCount: restaurantes.length,
                itemBuilder: (context, index) {
                  final restaurant = restaurantes[index];

                  return buildRestaurant(restaurant);
                },
              ),
            ),
          ],
        ),
      );

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'BUSCAR',
        onChanged: searchRestaurant,
      );

  Future searchRestaurant(String query) async => debounce(() async {
        final restaurantes = await RestaurantsApi.getRestaurant(query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.restaurantes = restaurantes;
        });
      });

  Widget buildRestaurant(Restaurante restaurante) => ListTile(
        leading: Image.network(
          restaurante.img,
          fit: BoxFit.cover,
          width: 180,
          height: 180,
        ),
        title: Text(restaurante.restaurante),
        subtitle: Text(restaurante.direccion),
      );
}
