// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class ConstantsWidget{
  static const BorderRadius borderRadius_14 = BorderRadius.all(Radius.circular(14));
  static const BorderRadius borderRadius_20 = BorderRadius.all(Radius.circular(20));
  static const BorderRadius borderRadius_8 = BorderRadius.all(Radius.circular(8));

  static const BorderRadius onlyBottom_25 =  BorderRadius.only(bottomLeft: Radius.circular(25),bottomRight: Radius.circular(25));
  static const BorderRadius onlyTop_25 =  BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25));
  


  static const EdgeInsets allPadding_16 = EdgeInsets.all(16.0);
  static const EdgeInsets allPadding_20 = EdgeInsets.all(20.0);
  static const EdgeInsets allPadding_25 = EdgeInsets.all(25.0);
  static const EdgeInsets allPadding_35 = EdgeInsets.all(35.0);
  static const EdgeInsets allPadding_8 = EdgeInsets.all(8.0);

  static const EdgeInsets leftRight_25_topBottom_15 = EdgeInsets.only(left:25.0,right: 25.0,top: 15,bottom: 15);


  static const EdgeInsets onlyLeftRightPadding_35 = EdgeInsets.only(left:35.0,right: 35.0);
  static const EdgeInsets onlyLeftRightPadding_20 = EdgeInsets.only(left:20.0,right: 20.0);
  static const EdgeInsets onlyLeftRightPadding_25 = EdgeInsets.only(left:25.0,right: 25.0);
  static const EdgeInsets onlyLeftRightPadding_8 = EdgeInsets.only(left:8.0,right: 8);
  static const EdgeInsets boxPadding =  EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12);
  static const EdgeInsets smallBoxPadding =  EdgeInsets.only(left: 16, right: 16, top: 6, bottom: 6);


  static const EdgeInsets allPadding_45 = EdgeInsets.all(45.0);
  // static Widget defaultHeightSmall = SizedBox(height: 2.h);
  // static Widget defaultHeightMedium = SizedBox(height: 4.h);
  // static Widget defaultHeightLarge = SizedBox(height: 10.h);

  static const Duration duration_350_ms = Duration(milliseconds:350);
  static const Duration duration_500_ms = Duration(milliseconds:500);
  static const Duration duration_1_sn = Duration(seconds: 1);
  static const Duration duration_3_sn = Duration(seconds: 3);

  //static const Padding customDivider = Padding(padding: EdgeInsets.only(top:15,bottom: 15),child: Divider(color: ProjectColor.inputBorderLight),);




}