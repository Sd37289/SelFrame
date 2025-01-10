import 'package:flutter/material.dart';
import 'package:sel_frame/sel_model.dart';

///
void selInitAddPageList(Widget page) {
  final selModel = SelModel();
  selModel.selPageList = [];
  selModel.selPageList.add(page);
}

///
void selAddPageList(Widget page) {
  final selModel = SelModel();
  selModel.selPageList.add(page);
}

void selOpenDrawer(BuildContext context){
  final selModel = SelModel();
}