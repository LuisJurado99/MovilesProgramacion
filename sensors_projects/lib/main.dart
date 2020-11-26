import 'package:flutter/material.dart';
import 'package:all_sensors/all_sensors.dart';

main() => runApp(TEP());

class TEP extends StatefulWidget {
  @override
  createState() => Estado();
}

class Estado extends State<TEP> {
  List<double> angulo = [0.0, 0.0, 0.0];
  double espTop= 300.0,espIzq=125.0, ancho= 250;

  @override
  void initState() {
    super.initState();
    accelerometerEvents.listen((event) {
      setState(() {
        angulo = [event.x, event.y, event.z];
        if(espIzq>=1 && espIzq<=300){
          espIzq -= angulo[0] *2;
          (espIzq>300)? espIzq= 299:null;
          (espIzq<1.2)? espIzq= 1.2:null;
        }
        if(espTop >= 1 && espTop <=400) {
          espTop += angulo[1]*3;
          ancho += angulo[1]*2;
          (espTop > 400) ? espTop = 400 : null;
          (espTop < 1) ? espTop = 1 : null;
          (ancho > 300) ? ancho = 300 : null;
          (ancho < 20 ) ? ancho = 20 : null;
        }

        print("espIzq:$espIzq");
      });
    });
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Sensores"
              "${angulo[0].roundToDouble()},"
              "${angulo[1].roundToDouble()},"
              "${angulo[2].roundToDouble()}"),
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/carretera.gif'),
                      fit: BoxFit.cover
                  )
              ),
            ),
           
           Positioned(child: Image.asset("images/backmoto.png"),
             top:espTop,
             right: espIzq,
             height: ancho,
             width: 200,
           )
            ],//Children
        )
      )
  );
}
