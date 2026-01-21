// class Person {
//   String _name;
//   Person(this._name);
// }



// main(){
//   Person per1 = Person('mina');
//   print(per1._name);
//   per1._name = 'raca';
// // student stu = student('Hello', 10);

  
// }

class Person {
  String _name; // private variable
  int age;

  Person(this._name, this.age);

  void showName() {
    print('Name: $_name');
  }
}

void main() {
  var p = Person('Rachna', 20);
  p.showName(); // ✅ works — can access inside the same class
  print(p.age); // ✅ works
  print(p._name); 
  //// ❌ Error: _name is private to this file
}
