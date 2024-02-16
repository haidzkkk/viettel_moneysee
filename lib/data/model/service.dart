
import 'dart:ui';

class Service{
  String name;
  String src;
  Color? color;

  Service({
    required this.name,
    required this.src,
    this.color,
  });
  
  @override
  String toString() {
    return name.substring(0, 10);
  }
}