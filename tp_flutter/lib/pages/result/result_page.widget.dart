import 'package:flutter/material.dart';
import 'package:tp_flutter/services/address_service.widget.dart';


class ResultPage extends StatelessWidget {
  const ResultPage({super.key, required this.data});

  final String data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Resultats !'),
      ),
      body: FutureBuilder(
        future: AddrService.searchAddress(data),
        builder: (context, snapshot) {
          if(snapshot.hasError) {
            return const Center(
              child: Text("Erreur d'adresse ! Rentrez bien le champs SVP"),
            );
          }
          if(!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final results = snapshot.data!['features'] as List<dynamic>;
          if(results.isEmpty) {
            return const Center(child: Text("Nous n'avons rien trouvé :("));
          }

          return ListView.builder(
            itemCount: results.length,
            itemBuilder: (BuildContext context, int index) {
              final feature = results[index];
              final properties = feature['properties'];
              final label = properties['label'];

              return ListTile(
                title: Text(label),
              );
            },
          );
        },
      ),
    );
  }
}