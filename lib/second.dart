import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prepakt/data.dart';
import 'package:prepakt/eff.dart';




void main() {
  runApp(M2());
}

class M2 extends StatelessWidget {
  const M2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Page(),
    );
  }
}

class Page extends StatefulWidget {
  const Page({super.key});

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  var nController = TextEditingController();
  var pController = TextEditingController();
  var dController = TextEditingController();
  String convention = "";
  bool transport = false;
  double price = 0.0;

  void calculer() {
    DateTime date = DateFormat('dd/MM/yyyy').parseStrict(dController.text);
    DateTime today = DateTime.now();
    int age = today.year - date.year;
    if (today.month < date.month ||
        (today.month == date.month && today.day < date.day)) {
      age--;
    }

    if (age >= 2 && age <= 5 && convention.isNotEmpty) {
      switch (age) {
        case 2:
          switch (convention) {
            case "ocp":
              price = 100.0;
              break;
            case "fm6":
              price = 89.99;
              break;
            case "one":
              price = 85.99;
              break;
          }
          break;
        case 3:
          switch (convention) {
            case "ocp":
              price = 150.0;
              break;
            case "fm6":
              price = 119.99;
              break;
            case "one":
              price = 105.99;
              break;
          }
          break;
        case 4:
          switch (convention) {
            case "ocp":
              price = 250.0;
              break;
            case "fm6":
              price = 219.99;
              break;
            case "one":
              price = 205.99;
              break;
          }
          break;
        case 5:
          switch (convention) {
            case "ocp":
              price = 350.0;
              break;
            case "fm6":
              price = 319.99;
              break;
            case "one":
              price = 305.99;
              break;
          }
          break;
      }
      if (transport) {
        price += 40.0;
      }
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Error"),
            content: Text("Invalid date format: "),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          title: Text("Préscolaire"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextField(
                  controller: nController,
                  decoration: InputDecoration(
                      hintText: "Nom",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextField(
                  controller: pController,
                  decoration: InputDecoration(
                      hintText: "Prenom",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextField(
                  controller: dController,
                  decoration: InputDecoration(
                      hintText: "Date",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    const Text("Convention: "),
                    const Text("OCP: "),
                    Radio<String>(
                      groupValue: convention,
                      value: "ocp",
                      onChanged: (value) {
                        setState(() {
                          convention = value!;
                        });
                      },
                    ),
                    const Text("FM6 "),
                    Radio<String>(
                      groupValue: convention,
                      value: "fm6",
                      onChanged: (value) {
                        setState(() {
                          convention = value!;
                        });
                      },
                    ),
                    const Text("ONE"),
                    Radio<String>(
                      value: "one",
                      groupValue: convention,
                      onChanged: (value) {
                        setState(() {
                          convention = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
              CheckboxListTile(
                title: const Text("Transport: "),
                value: transport,
                onChanged: (value) {
                  setState(() {
                    transport = value!;
                  });
                },
              ),
              ElevatedButton(
                onPressed: calculer,
                child: const Text("Calculer"),
              ),
              Text("Prix: ${price.toStringAsPrecision(4)} DH"),
              ElevatedButton(
                onPressed: () {
                  UserData dte = UserData(
                    nom: nController.text,
                    prenom: pController.text,
                    price: price,
                    check: transport,
                    vle: convention ?? "",
                  );
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Eff(data: dte)));
                },
                child: const Text("send"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
