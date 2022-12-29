import 'package:flutter/material.dart';


extension CustomColorScheme on ColorScheme {
  Color get scaffoldBackround => brightness == Brightness.light ? const Color(0xFFF1F1F1)  :  const Color(0xFF282E3A); 
  


  Color get defaultButtonColor => brightness == Brightness.light ? const Color(0xFFF1F1F1)  :  const Color(0xFF282E3A); 
  Color get defaultButtonTextColor => brightness == Brightness.light ? const Color(0xFFF1F1F1)  :  const Color(0xFF282E3A); 

  Color get defaultInputBackgroundColor => brightness == Brightness.light ? const Color(0xFFF1F1F1)  :  const Color(0xFF282E3A); 





}