import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MiSorteo());
class MiSorteo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sorteo de frutas',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sorteo de Frutas'),
        ),
        body: Center(
            child: JuegoSorteo()
        )
      ),
    );
  }
}

class JuegoSorteo extends StatefulWidget{
  @override
  State<JuegoSorteo> createState() => JuegoSorteoState();
}

class JuegoSorteoState extends State<JuegoSorteo>{
  int contador = 0;
  var texto = 'Juega';
  var frutas = ['cereza','pinia','manzana','uva','frambuesa', 'frutilla', 'sandia','naranja'];
  String img1 = '';
  String img2 = '';
  String img3 = '';

  void generarAleatorio(){
    int num1 = this.aleatorio();
    int num2 = this.aleatorio();
    int num3 = this.aleatorio();
    setState(() {
      contador++;
      img1 = frutas[num1];
      img2 = frutas[num2];
      img3 = frutas[num3];
      if(num1 == num2){
        if(num1 == num3){
          texto = 'Ganaste !!!';
          contador = 1;
        }else{
          texto = 'Juega';
        }
      }else{
        texto = 'Juega';
      }
    });
  }
  int aleatorio() {
    var rnd = new Random();
    return rnd.nextInt(7) + 1;
  }

  @override
  void initState() {
    super.initState();
    this.generarAleatorio();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text('Nro. de Intentos: ${contador}', style: TextStyle(fontSize: 12.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                    Expanded(child: Image.asset('assets/${img1}.png'),),
                    Expanded(child: Image.asset('assets/${img2}.png'),),
                    Expanded(child: Image.asset('assets/${img3}.png'),),
                ],
              ),
              IconButton(
                icon: Icon(Icons.autorenew),
                onPressed: (){ generarAleatorio();},
              ),
              Text('${texto}', style: TextStyle(fontSize: 12.0),)
            ],
          ),
        ),
      )
    );
  }
}