/*
Sets
*/

main(List<String> args) {
  // SET
  final bestEpisodes = const ['IV', 'V', 'VI'];
  var episodes = Set.from(bestEpisodes); // named constructor
  print(episodes);

  var houses = {'Lannister', 'Stark', 'Targaryen'};
  houses.add("Greyjoy");

  print(houses.contains('Kardasian'));

  // Siempre implementa == y hashCode si vas a meter clases propias en map y set

  // Map {key: value}
  var books = {
    // Key          Value
    'Asimov': {'Foundation', 'Foundation and Empire', 'Second Foundation'},
    'Heinlein': {'Starship Troopers'},
    'Cixin': {'The Three Body Problem', 'The Dark Forrest', "Death's End"}
  };
  print(books);
  print("Books by Asimov: ${books['Asimov']}");
  books['Scalzi'] = {"Old man's war", 'The god engines'};
  print(books);
}
