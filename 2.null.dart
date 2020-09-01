void main() {
  // The default value of any variable, if typed ones is null
  double z;
  print(z); // contains null!
  print(z++); // NoSuchMethod!

  // null is the single instance of the class Null. It is nto a "yes-man" as
  // in Objective-C and can cause NoSuchMethod errors
  // Always init your shit!!!
}
