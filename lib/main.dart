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

// Shortcut para crear widget stateful o stateless
// StateFul : stful
// StateLess : stless

// Esta seria la clase del estado del widget se usa el prefijo _
class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18);
  // Se agrega el arreglo en donde se van a guardar las palabras favoritas
  final _saved = <WordPair>{};
  @override
  // Widget que construye la lista de recomendaciones 
   Widget build(BuildContext context) {
    // Regresa la vista con la lista de elementos 
    return ListView.builder(
      // Agrega padding a todos los lados de la vista 
      padding: const EdgeInsets.all(16.0),
      // Construye los elementos de la lista uno por uno por callback 
      itemBuilder: /*1*/ (context, i) {
        // Agrega un divisor entre los elementos de la lista 
        if (i.isOdd) return const Divider(); /*2*/
        // Divide i sobre 2 regresando valor int 
        final index = i ~/ 2; /*3*/
        // Si el index supera la longitud de la lista agrega 10 elementos extra 
        if (index >= _suggestions.length) {
          // Agrega a la lista 10 elementos de la funcion generateWordPairs 
          _suggestions.addAll(generateWordPairs().take(10)); /*4*/
        }
        // Se verifica si la palabra fue agregada a favoritos 
        final alreadySaved = _saved.contains(_suggestions[index]);
        // Regresa la lista de sugerencias como pascal case con el estilo definido en la variable _biggerFont
        return ListTile(
          title: Text(
            _suggestions[index].asPascalCase,
            style: _biggerFont,
          ),
          // Se agrega el icono de guardado en los items de la lista
          trailing: Icon(
            // Segun el estado de guardado realiza los siguientes cambios 
            // Si esta guardado aplica el icono completo, sino solo el borde
            alreadySaved ? Icons.favorite : Icons.favorite_border,
            // Si esta guardado pinta el icono de rojo, sino no se pinta
            color: alreadySaved ? Colors.red : null,
            // Si esta guardado muestra el mensaje de remove, sino el de guardar
            semanticLabel: alreadySaved ? 'Remove from saved' : 'Save',
          ),
        );
      },
    );
  }
}
