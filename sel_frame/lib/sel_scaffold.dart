import 'package:flutter/material.dart';

class SelScaffold extends StatefulWidget {
  SelScaffold({
    super.key,
    this.selAppBar,
    this.selBody,
    this.selBottomBar,
  });

  final Widget? selAppBar;
  final Widget? selBody;
  final Widget? selBottomBar;

  @override
  State<SelScaffold> createState() => _SelScaffoldState();
}

class _SelScaffoldState extends State<SelScaffold> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.selAppBar ?? SelAppBar(),
        Expanded(child: SizedBox(
          child: widget.selBody,
        )),
        widget.selBottomBar ?? const SizedBox(),
      ],
    );
  }
}

class SelAppBar extends StatelessWidget {
  const SelAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      color: Colors.brown,
    );
  }
}
