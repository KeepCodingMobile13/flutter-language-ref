/*
  SCRIPTS VS LIBS

    Si no tiene un main, es una librería. Punto pelota.

*/

/*
  La sintaxis del import es siempre la misma, solo cambia donde esté 
  la librería.abstract

  import <URI> // siempre cadena;
  import <URI> as <name>;

  *Opciones de URI*

  * Ruta a la librería: más vale que esté en local
  * Protocolo http o https: no recomendado
  * protocolo dart: para cosas de sistema
  * protocolo package: lo gestiona pub y más vale que esté en pub.dev
*/

/*

EJEMPLOS

import 'stack.dart' as stack;
import '../lib/stack.dart'; // contaminas mi ámbito


import 'dart/async';
import 'package:uuid/uuid.dart'; // hay que añadir una linea en dependencias en pubspec.yaml

*/
