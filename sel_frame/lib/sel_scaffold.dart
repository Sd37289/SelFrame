import 'package:flutter/material.dart';
import 'package:sel_frame/sel_controller.dart';

final GlobalKey<_SelScaffoldAState> selScaffoldA = GlobalKey<_SelScaffoldAState>();

class SelScaffoldA extends StatefulWidget {
  const SelScaffoldA({
    super.key,
    this.selAppBar,
    this.selBody,
    this.selBottomBar,
  });

  final PreferredSizeWidget? selAppBar;
  final Widget? selBody;
  final Widget? selBottomBar;

  @override
  State<SelScaffoldA> createState() => _SelScaffoldAState();
}

class _SelScaffoldAState extends State<SelScaffoldA> {
  @override
  void initState() {
    super.initState();
    selInitAddPageList(Scaffold(
      appBar: widget.selAppBar,
      body: widget.selBody,
      bottomNavigationBar: widget.selBottomBar,
    ));
  }

  void selState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
