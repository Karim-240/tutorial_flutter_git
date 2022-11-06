// Se agrega el paquete de material dart que se encarga
// de crear el tema/plantilla 
import 'package:flutter/material.dart';
// Libreria que obtiene palabras en ingles para el ejemplo
import 'package:english_words/english_words.dart';
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
    // Seria como crear una instancia del generador de palabras aleatorias
    final wordPair = WordPair.random();
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
        // Se elimino el const ya que el valor no viene de un string declarado 
        body: Center(
          // Es como un div en web que contiene el texto declarado
          // El texto se tomara de la instancia y se indica que sera escrito en pascalcase
          child: Text(wordPair.asPascalCase),
        ),
      ),
    );
  }
}
