import 'package:flutter/material.dart';
import 'package:sel_frame/sel_controller.dart';
import 'package:sel_frame/sel_material.dart';

Future<void> selNavigatorPush(BuildContext context, Widget page) async {
  selAddPageList(page);
  selMaterialKey.currentState?.selState();
}
