import 'package:flutter/material.dart';
import 'package:prepakt/second.dart'; 

class Eff extends StatefulWidget {
  final UserData data;

  const Eff({Key? key, required this.data}) : super(key: key);

  @override
  State<Eff> createState() => _EffState();
}

class _EffState extends State<Eff> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Details"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Center(
              child: Column(
                children: [
                  Row(children: [Text("Nom : ${widget.data.nom}")]),
                  Row(children: [Text("Prénom : ${widget.data.prenom}")]),
                  Row(children: [Text("Convention : ${widget.data.vle}")]),
                  Row(children: [Text("Transport : ${widget.data.check ? "Oui" : "Non"}")]),
                  Row(children: [Text("Prix : ${widget.data.price.toStringAsFixed(2)} DH")]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
