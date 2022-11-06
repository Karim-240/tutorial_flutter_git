// Fuente del ejemplo que se esta siguiendo 
// https://docs.flutter.dev/get-started/codelab
// Se agrega el paquete de material dart que se encarga
// de crear el tema/plantilla 
import 'dart:html';

import 'package:flutter/material.dart';
// Libreria que obtiene palabras en ingles para el ejemplo
import 'package:english_words/english_words.dart';
// Funcion principal que llama a los elementos de ejecucion
void main(){
  // Se ejecuta como constante a clase MyApp 
  runApp(const MyApp());
}

// Estructura basica de la aplicacion
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
        // Se elimino el const ya que el valor no viene de un string declarado 
        body: const Center(
          // Es como un div en web que contiene el texto declarado
          // El texto se tomara de la clase que genera texto aleatorio
          child: RandomWords(),
        ),
      ),
    );
  }
}

// Esta seria la clase del widget generador de texto
class RandomWords extends StatefulWidget {
  const RandomWords({super.key});

  @override
  // LLama al creador de estados
  State<RandomWords> createState() => _RandomWordsState();
}
// Esta seria la clase del estado del widget se usa el prefijo _
class _RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    // Se instancia el generador aleatorio en la variable
    final wordPair = WordPair.random();
    // Regresa el texto generado como pascal case
    return Text(wordPair.asPascalCase);
  }
}