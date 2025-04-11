import 'package:flutter/material.dart';
import 'package:sel_frame/sel_controller.dart';
import 'package:sel_frame/sel_model.dart';

final GlobalKey<_SelMaterialState> selMaterialKey = GlobalKey<_SelMaterialState>();


class SelMaterial extends StatefulWidget {
  const SelMaterial({
    super.key,
    required this.selHome,
  });

  final Widget selHome;

  @override
  State<SelMaterial> createState() => _SelMaterialState();
}

class _SelMaterialState extends State<SelMaterial> {
  final selModel = SelModel();

  @override
  void initState() {
    super.initState();
    selInitAddPageList(widget.selHome);
  }

  void selState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Stack(
        children: selModel.selPageList,
      ),
    );
  }
}
