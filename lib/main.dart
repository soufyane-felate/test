import 'package:flutter/material.dart';
import 'package:prepakt/second.dart'; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text(
          "Login Page",
          style: TextStyle(
            color: Color.fromARGB(255, 1, 94, 117),
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Icon(Icons.calendar_month, color: Color.fromARGB(255, 1, 94, 117)),
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(
                    "https://media.istockphoto.com/id/522001766/photo/woman-standing-near-big-tropical-river.jpg?s=1024x1024&w=is&k=20&c=WV1ureMCR5BntWxRzHgY0JQlmhItWbEsHcuN8Mq1TP4="),
              ),
            ),
            Divider(
              height: 20,
              color: Colors.black26,
            ),
            Card(
              color: const Color.fromARGB(255, 7, 238, 255),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    Container(
                      child: Icon(Icons.phone),
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    Container(
                      child: Text(
                        "01342537628",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Card(
              color: const Color.fromARGB(255, 7, 255, 255),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    Container(
                      child: Icon(Icons.email),
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Container(
                        child: Text(
                      "trible@gmail.com",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ))
                  ],
                ),
              ),
            ),
            Card(
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Message "),
              ),
            ),
            Card(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 7, 205, 255)),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => M2()));
                },
                child: Text("Contact me"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
