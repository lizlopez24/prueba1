import 'package:flutter/material.dart';
import 'package:prueba_1/screens/Ejercicio01.dart';
import 'package:prueba_1/screens/Ejercicio02.dart';

void main() {
  runApp(const Prueba());
}

class Prueba extends StatelessWidget {
  const Prueba({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Prueba 1",
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
  int indice=0;
  @override
  Widget build(BuildContext context) {
    List<Widget> screens=[Cuerpo(context),Ejercicio01()];
    return Scaffold(
      appBar: AppBar(
        title: Text("Prueba1"),
      ),
      body: screens[indice],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indice,
        onTap: (value) {
          setState(() {
            indice=value;
          });
        },
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.balance_outlined), label: "Ejercicio 1")
      ]),
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
            children: [ datos(), Boton(context)])
        )
  );
}

Widget datos(){
  return Container(
    child: Column(children: [
      Text("Nombre: ", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
      Text("Lizeth López", style: TextStyle(fontSize: 30)),
      Text("Usuario en GIT: ", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
      Text("lizlopez24", style: TextStyle(fontSize: 30))
    ],),
  );
}


Widget Boton(context){
  return Container(
    padding: EdgeInsets.only(top: 80),
    child: FilledButton(onPressed: (){
      mostrarAlerta(context);
    }, child: Text("Ejercicio 02")),
  );
}

void mostrarAlerta(context){
  showDialog(context: context, builder: (context){
    return AlertDialog(
      title: Text("Verificar"),
      content: Text("Esta a punto de redirigirse al ejercicio 2,¿Está seguro?"),
      actions: [
        TextButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Ejercicio02()));
          
        }, child: Text("Aceptar")),
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text("Cancelar"))
      ],
    );
  });
}