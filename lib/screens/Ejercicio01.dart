import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const Ejercicio01());
}

class Ejercicio01 extends StatelessWidget {
  const Ejercicio01({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ejercicio01",
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
      body: Cuerpo(context),
    );
  }
}

Widget Cuerpo(context){
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage('assets/image/fondo-colorido-borroso-vivo.jpg'),
      fit: BoxFit.cover
      )),
    child: (
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Calculadora de IMC", style: TextStyle(fontSize: 30),),
          peso(),
          altura(),
          Boton(context),
        ],))
  );
}

final TextEditingController _peso= TextEditingController();

Widget peso(){
  return Container(
    padding: EdgeInsets.all(30),
    child: TextField(
      controller: _peso,
      decoration: InputDecoration(
        hintText: "Ingrese su peso en kg",
        fillColor: Colors.white,
        filled: true
      ),
      keyboardType: TextInputType.number,
    ),
  );
}

final TextEditingController _altura= TextEditingController();

Widget altura(){
  return Container(
    padding: EdgeInsets.all(30),
    child: TextField(
      controller: _altura,
      decoration: InputDecoration(
        hintText: "Ingrese su altura en metros",
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
      imc();
      mostrarAlerta(context);
    }, child: Text("Calcular")),
  );
}

double resultado=0;
String interpretacion="";

void imc(){
  double peso=(double.tryParse(_peso.text))?? 0.00;
  double altura= (double.tryParse(_altura.text))?? 0.00;
  resultado=peso/(altura*altura);
  if(resultado<18.5){
    interpretacion='Bajo Peso';
  }else if(resultado>=18.5 && resultado<=24.9){
    interpretacion='Peso Normal';
  }else if(resultado>=25 && resultado<=29.9){
    interpretacion='Sobrepeso';
  }else if(resultado>=30){
    interpretacion='Obesidad';
  }else{
    interpretacion='No existe un cálculo para los valores ingresados';
  }


}

void mostrarAlerta(context){
  showDialog(context: context, builder: (context){
    return AlertDialog(
      title: Text("Calculo de IMC"),
      content: Text("Su IMC es de: $resultado, equivalente a $interpretacion"),
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text("Cerrar"))
      ],
    );
  });
}