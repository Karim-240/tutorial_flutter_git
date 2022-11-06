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
      // titulo de la ventana 
      title: 'Titulo de pagina',
      // Se agrega la propiedad de tema 
      theme: ThemeData(
        // Se indica que se va a trabajar con el tema de la navbar
        appBarTheme: const AppBarTheme(
          // Indicamos el color del fondo
          backgroundColor: Colors.white,
          // Indicamos el color del primer plano
          foregroundColor: Color.fromARGB(239, 9, 234, 46),
        ),
      ),
      // Es la estructura general de la vista 
      // Se retiro Scaffold para que se maneje desde el constructor de RandomWords
      // y asi se pueda interactuar con el icono de guardados que se va a agregar
      home: RandomWords(),
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
    // Crea la estructura completa desde aqui
    return Scaffold(
      // Sea agrega el navbar con las propiedades correspondientes 
      appBar: AppBar(
        // Se define el titulo de el navbar 
        title: const Text('Generador de nombres'),
        // Se definen las acciones 
        actions: [
          // Se agrega el boton en el navbar
          IconButton(
            // Se agrega el icono al navbar en este caso es list
            icon: const Icon(Icons.list),
            // Al ser presionado el boton llamara a la funcion _pushSaved
            onPressed: _pushSaved,
            // Texto que se muestra al pasar el cursor sobre el boton 
            tooltip: 'Saved sugestions',
            )
        ],
      ),
      body: 
    // Regresa la vista con la lista de elementos 
      ListView.builder(
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
            onTap: () {
              // SetState es llamado dentro del metodo build por lo que actualiza la pantalla 
              setState(() {
                // Verificamos si el valor alreadysaved del elemento actual esta en true o false
                if(alreadySaved){
                  // Si se hace tap en el elemento y estaba en la lista de saved se retira
                  _saved.remove(_suggestions[index]);
                }else{
                  // Si se hace tap ene l elemento y no estaba en la lista de saved se agrega
                  _saved.add(_suggestions[index]);
                }
              });
            },
          );
        },
      ),
    );
  }
  // Funcion que llama a la vista de lista de guardados
  void _pushSaved(){
    // Indica que se cambiara de pagina 
    Navigator.of(context).push(
      // Material es la plantilla de pagina que se esta usando aqui se construye la nueva pagina de sugerencias guardadas
      MaterialPageRoute(
        builder: (context) {
          // De la lista de guardados se mapea con las condiciones siguientes
          final tiles = _saved.map(
            (pair){
              return ListTile(
                title: Text(
                  // Cada elemento se mostrara con pascale case
                  pair.asPascalCase,
                  // Se aplica el mismo estilo que se definió desde el inicio
                  style: _biggerFont,
                ),
              );
            },
          );
          // Se verifica si las acciones anteriores se realizaron o si llego vacio 
          final divided = tiles.isNotEmpty
          // Si no viene vacio se agrega a la lista que se va a mostrar en la nueva pagina
            ? ListTile.divideTiles(
              context: context,
              tiles: tiles,
              ).toList()
            // Si viene vacio se deja de esa forma
            : <Widget>[];
          return Scaffold(
            // Sea agrega el titulo correspondiente a navbar de esta pagina 
            appBar: AppBar(
              title: const Text('Saved suggestions'),
            ),
            // Como cuerpo de la pagina se agrega la lista que se genero en la variable divided
            body: ListView(children: divided),
          );
        },
      ),
    );
  }
}
