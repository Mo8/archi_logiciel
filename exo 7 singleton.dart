import 'dart:math';

class Singleton{

  final int uuid = Random().nextInt(10000000);
  static Singleton _singleton = Singleton._internal();

  Singleton._internal();

  static Singleton getInstance(){
    return _singleton;
  }

  @override
  String toString() {
    return 'Singleton{uuid: $uuid $hashCode}';
  }
}

main(){
  print(Singleton.getInstance());
  print(Singleton.getInstance());
  print(Singleton.getInstance());
}