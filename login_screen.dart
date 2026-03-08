import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'pokemon_list.dart';

class LoginScreen extends StatelessWidget {

  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // Lottie Animation
            Lottie.network(
              "https://assets10.lottiefiles.com/packages/lf20_qp1q7mct.json",
              height: 200,
            ),

            SizedBox(height: 20),

            Text(
              "Welcome to Poképedia",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 20),

            TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter your name",
              ),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PokemonListScreen(),
                  ),
                );
              },
              child: Text("Enter Poképedia"),
            )
          ],
        ),
      ),
    );
  }
}
