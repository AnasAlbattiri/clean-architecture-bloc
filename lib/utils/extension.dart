import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension IntegerSum on int {
  // functions or getters or etc.
  int get addNine => this + 9; // this: المكان الي راح استدعي فيه الفنكشن
  int get subFive => this - 5;
  int get multiplyThree => this * 3;
  int addNumber(int number) => this + number;

}

extension StringText on String {
  String operator% (String name) => "$this $name";
}

extension CheckNull on String? {
  String orEmpty() => this == null ? "" : this!;
}

extension CenterWidget on Widget {
  Widget centerWidget() => Center(child: this,);

Padding paddingAll(double padding){
  return Padding(padding: EdgeInsets.all(padding),child: this,);
}
}

extension ShapeBorderX<T extends Widget> on T {
  Container roundedRectangleBorder(
      {required double radius, Color backgroundColor = Colors.white}) {
    return Container(
      decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(
            radius,
          )),
      child: this,
    );
  }
}