### The Code : 

```dart
void main() {
  final Person(
    :age,
    :name,
    :isRich,
  ) = Person(
    name: 'John', age: 30, isRich: true,
  );
  
  print("$name - $age - $isRich");
}

class Person {
  String name;
  int age;
  bool isRich;

  Person({
    required this.name,
    required this.age,
    required this.isRich,
  });
}
```

### Result / Preview

`John - 30 - true`
