import 'package:flutter/material.dart';

import '../address/address_page.widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.titre});

  final String titre;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(titre),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
                child: Text("Bonjour", style: TextStyle(fontSize: 18.0),),
                ),
            const SizedBox(height: 10,),
            ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => AddrPage()));
            }, child: const Text('Chercher une adresse')),
          ],
        ),
      ),
    );
  }
}
