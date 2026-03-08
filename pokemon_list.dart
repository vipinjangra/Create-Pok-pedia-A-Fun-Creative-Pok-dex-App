import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PokemonListScreen extends StatefulWidget {
  @override
  _PokemonListScreenState createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {

  List pokemon = [];
  bool loading = true;

  Future fetchPokemon() async {

    final response = await http.get(
      Uri.parse("https://pokeapi.co/api/v2/pokemon?limit=20"),
    );

    final data = jsonDecode(response.body);

    setState(() {
      pokemon = data["results"];
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchPokemon();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Poképedia"),
      ),

      body: loading
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
        ),
        itemCount: pokemon.length,
        itemBuilder: (context, index) {

          final name = pokemon[index]["name"];

          final imageUrl =
              "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${index + 1}.png";

          return Card(
            elevation: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Image.network(imageUrl, height: 80),

                SizedBox(height: 10),

                Text(
                  name.toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
