import 'package:flutter/material.dart';
import 'package:tp_flutter/services/address_service.widget.dart';

import '../result/result_page.widget.dart';



class AddrPage extends StatelessWidget {
  AddrPage({super.key});


  final _address = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Recherche !'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Recherchez une adresse"),
            const SizedBox(height: 10,),
            SizedBox(
            width: 250,
              child: TextField(
                controller: _address,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Adresse',
                ),
              ),
            ),
            const SizedBox(height: 10,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => ResultPage(data: _address.text)));
              },
              child: const Text('Rechercher'),
            ),
          ],
        ),
      ),
    );
  }
}
