
import 'package:flutter/material.dart';

class AppConstants{
  static const String audio = 'https://www.ghanavibez.com/wp-content/uploads/2023/01/Rema_Selena_Gomez_-_Calm_Down_ghanavibez.com.mp3';
  static const String selinaImage= 'assets/images/pic.jpg';

}

class Sizes{
  Sizes(this.context){
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
  }
  final BuildContext context;
   double screenWidth =0;
   double screenHeight=0;

}
extension MediaQueryExt on BuildContext {
  double get height => MediaQuery.of(this).size.height;

  double get width => MediaQuery.of(this).size.width;
}


