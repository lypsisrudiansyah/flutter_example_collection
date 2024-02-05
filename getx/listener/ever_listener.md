### Code Snippets

```dart
class MyController extends GetxController {
  RxBool isLogin = false.obs;

  @override
  void onReady() async {
    super.onReady();

    // * Dummy logic for changing the value of isLogin
    for (int i = 0; i < 10; i++) {
      print("------------");

      print('This is execution number ${i + 1}');
      isLogin.value = !isLogin.value;
      await Future.delayed(const Duration(seconds: 5));
    }
  }

  @override
  void onInit() {
    super.onInit();

    // * The listener will be called whenever the value of isLogin changes
    ever(isLogin, (value) {
      print("from listener  isLogin: $value");
      print("exact value isLogin : $isLogin");
    });
  }
}

```


### Result / Preview

```dart
I/flutter ( 3501): ------------
I/flutter ( 3501): This is execution number 1
I/flutter ( 3501): from listener  isLogin: true
I/flutter ( 3501): exact value isLogin : true
I/flutter ( 3501): ------------
I/flutter ( 3501): This is execution number 2
I/flutter ( 3501): from listener  isLogin: false
I/flutter ( 3501): exact value isLogin : false
I/flutter ( 3501): ------------
I/flutter ( 3501): This is execution number 3
I/flutter ( 3501): from listener  isLogin: true
I/flutter ( 3501): exact value isLogin : true
I/flutter ( 3501): ------------
I/flutter ( 3501): This is execution number 4
I/flutter ( 3501): from listener  isLogin: false
I/flutter ( 3501): exact value isLogin : false
I/flutter ( 3501): ------------
I/flutter ( 3501): This is execution number 5

```

---

### Why I Create This Example ?

Answer :

Because someone in a forum ask there, `How to write listeners on GetX like BlocListener on flutter_bloc ?`, specifically he want to make redirection after login if passed the reququirements

So one of the solution is like this using ever as the listener because there is more utils on GetX can be used as listener.
