import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyHomePageState();
}

class MyHomePageState extends State {
  double opacidad = 1.0;

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Hola"),
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  if (opacidad > 0.1) {
                    opacidad = opacidad - 0.1;
                  } else {
                    opacidad = 1.0;
                  }
                });
              },
            ),
            body: Row(
              children: [
                Opacity(
                  child: Image.asset(
                    "images/message.png",
                    width: 200,
                  ),
                  opacity: opacidad,
                ),
                Text("La opacidad es $opacidad")
              ],
            )),
      );
}
