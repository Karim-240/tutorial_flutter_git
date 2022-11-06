// Se agrega el paquete de material dart que se encarga
// de crear el tema/plantilla 
import 'package:flutter/material.dart';

// Funcion principal que llama a los elementos de ejecucion
void main(){
  // Se ejecuta como constante a clase MyApp 
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp ({super.key});
  @override
  // Se crea el widget que es lo que se muestra en pantalla 
  Widget build(BuildContext constext){
    // Regresamos el widget con la construccion realizada 
    return MaterialApp(
      // Se agrega el titulo del widget en web se ve como 
      // titulo de la ventan 
      title: 'Titulo de pagina',
      // Es la estructura general de la vista 
      home:Scaffold(
        // Se agrega la propiedad appBar que en web seria como el navbar
        appBar: AppBar(
          // Se agrega el titulo del navbar 
          title: const Text('Bien venido a Flutter'),
        ),
        // Se indica que los  descendientes del cuerpo estaran centrados 
        body: const Center(
          // Es como un div en web que contiene el texto declarado
          child: Text('Texto central'),
        ),
      ),
    );
  }
}
