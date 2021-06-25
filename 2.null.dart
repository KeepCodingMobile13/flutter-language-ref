/// # Null
///
/// ## Non-nullable
///
/// Desde Dart 2.0, clase `Null` fue retirada de la jerarquía principal
/// haciendo que todos los tipos sean "non nullable" por la cara.
///
/// La clase Null sólo tiene una instancia: null
///
///           Object              Null
///           /     \
///    Iterable     Num
///       |         /  \
///     List     int  double
///
/// Null no es subtipo de nadie, así que:
/// * solo nullpuede ser null
/// * no se puede hacer un cast a Null
///
///  ## Nullable
///
/// Está implementado como una unión, al igual que en Swift, pero ésta no
/// es accesible al usuario
///
/// String?  ---------------->  String | Null
///
///
/// ## Top Type
///
/// Object no es el Top Type, puesto qu eno incluye a Null. Object? sí que lo es
/// y sería el tipo adecuado para representar cualquier cosa.
///
/// ## Operadores Null
///
/// `a?.foo()` Llama a foo sólo si a NO es null
/// `v = b ?? 42`  Asigna b a v, a no ser que b sea null. En ese caso, asigna 42
/// `b ??= 42`  Asigna 42 a b, siempre y cuando b  sea Null
///
/// ## Syntactic sugar a lo Kotlin
///
/// Se podría crear una "syntactic sugar" para "hacer cosas a una variable, solo
/// si no es null" como en Kotlin.
///
/// Para ello, se usan extensiones son Object?. Ver 8.9 Extensions
///
/// ## Asignación late
///
/// Con la palabra clave late, indicas que una variable no nulable tendrá un
/// valor antes de ser usado. No hace falta que lo asignes en el constructor, puede ser
/// en otro sitio, siempre que lo hagas. Si no lo haces, casca al compilar

void main() {
  int k; // no vale null. No está asignada. Compilará, pero como la uses, casca
  //print(k);

  int? a = 51;
  print(a?.isEven);

  int? v = a ?? 42;

  int? b;
  b ??= 42;
  print(b);
}

class Fistro {
  late String name;
}
