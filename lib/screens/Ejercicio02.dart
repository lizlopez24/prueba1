import 'package:flutter/material.dart';

void main() {
  runApp(const Ejercicio02());
}

class Ejercicio02 extends StatelessWidget {
  const Ejercicio02({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ejercicio02",
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Prueba1"),
      ),
      body: Cuerpo(context),
    );
  }
}

Widget Cuerpo(context){
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: NetworkImage('https://img.freepik.com/vector-premium/fondo-degradado-delicado_652136-32.jpg'),
        fit: BoxFit.cover
        )),
    child: (
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Calculadora de Movimiento", style: TextStyle(fontSize: 30),),
          velocidad(),
          Boton(context)
        ],)),
  );
}
final TextEditingController _velocidad= TextEditingController();

Widget velocidad(){
  return Container(
    padding: EdgeInsets.all(30),
    child: TextField(
      controller: _velocidad,
      decoration: InputDecoration(
        hintText: "Ingrese la velocidad de desplazamiento",
        fillColor: Colors.white,
        filled: true
      ),
      keyboardType: TextInputType.number,
    ),
  );
}

Widget Boton(context){
  return Container(
    padding: EdgeInsets.only(top: 80),
    child: FilledButton(onPressed: (){
      mostrarAlerta(context);
    }, child: Text("Calcular")),
  );
}

double distancia(){
  double resultado=(double.tryParse(_velocidad.text)??0.00)*100;
  return resultado;
}

void mostrarAlerta(context){
  showDialog(context: context, builder: (context){
    return AlertDialog(
      title: Text("Calculo de Distancia"),
      content: Text("La distancia recorrida por el objeto es de ${distancia()} metros"),
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text("Cerrar"))
      ],
    );
  });
}