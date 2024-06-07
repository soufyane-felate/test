import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prepakt/eff.dart';

class UserData {
  final String nom;
  final String prenom;
  final String vle;
  final bool check;
  final double price;

  UserData({
    required this.nom,
    required this.prenom,
    required this.vle,
    required this.check,
    required this.price,
  });
}

void main() {
  runApp(M2());
}

class M2 extends StatefulWidget {
  const M2({super.key});

  @override
  State<M2> createState() => _M2State();
}

class _M2State extends State<M2> {
  var nomController = TextEditingController();
  var prnomController = TextEditingController();
  var dateController = TextEditingController();
  String? vle = "";
  bool check = false;
  double price = 0.0;

  void calculer() {
    try {
      DateTime birthDate = DateFormat('dd/MM/yyyy').parseStrict(dateController.text);
      DateTime currentDate = DateTime.now();
      int age = currentDate.year - birthDate.year;
      if (currentDate.month < birthDate.month || (currentDate.month == birthDate.month && currentDate.day < birthDate.day)) {
        age--;
      }
      if (age >= 1 && age <= 3) {
        if (vle == "ocp") {
          price = check ? 150.0 : 80.0;
        } else if (vle == "fm6") {
          price = check ? 100.0 : 70.0;
        } else if (vle == "one") {
          price = check ? 110.0 : 75.0;
        }
      } else if (age >= 3 && age <= 5) {
        if (vle == "ocp") {
          price = check ? 250.0 : 180.0;
        } else if (vle == "fm6") {
          price = check ? 200.0 : 170.0;
        } else if (vle == "one") {
          price = check ? 210.0 : 175.0;
        }
      }
    } catch (e) {
      print("Invalid date format: $e");
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Test"),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextField(
                    controller: nomController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)),
                        hintText: "Nom de l'enfant"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextField(
                    controller: prnomController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      hintText: "Prénom de l'enfant",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(18.0),
                  child: TextField(
                    controller: dateController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)),
                        hintText: "Date de naissance de l'enfant"),
                    keyboardType: TextInputType.datetime,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    children: [
                      Text("Convention : "),
                      Text("OCP"),
                      Expanded(
                        child: Radio(
                          value: "ocp",
                          groupValue: vle,
                          onChanged: (value) {
                            setState(() {
                              vle = value!;
                            });
                          },
                        ),
                      ),
                      Text("FM6"),
                      Expanded(
                        child: Radio(
                            value: "fm6",
                            groupValue: vle,
                            onChanged: (value) {
                              setState(() {
                                vle = value;
                              });
                            }),
                      ),
                      Text("ONE"),
                      Expanded(
                        child: Radio(
                          value: "one",
                          groupValue: vle,
                          onChanged: (value) {
                            setState(() {
                              vle = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text("Transport"),
                    Checkbox(
                        value: check,
                        onChanged: (value) {
                          setState(() {
                            check = value!;
                          });
                        })
                  ],
                ),
                ElevatedButton(
                    onPressed: calculer,
                    child: Text("Calculer")),
                Text("${price.toStringAsFixed(2)} DH"),
                ElevatedButton(
                    onPressed: () {
                      UserData newData = UserData(
                        nom: nomController.text,
                        prenom: prnomController.text,
                        vle: vle ?? "",
                        check: check,
                        price: price,
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Eff(data: newData)),
                      );
                    },
                    child: Text("Next")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
