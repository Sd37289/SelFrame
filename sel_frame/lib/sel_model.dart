import 'package:flutter/material.dart';


class SelModel {
  static final SelModel _instance = SelModel._internal();
  SelModel._internal();
  factory SelModel() => _instance;

  List<Widget> selPageList = [];
}

