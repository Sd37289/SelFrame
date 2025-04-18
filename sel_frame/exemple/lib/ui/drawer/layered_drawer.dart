import 'package:flutter/material.dart';
import 'package:sel_frame/ui/drawer/sf_layered_draver/sf_layered_drawer.dart';

class EXLayeredDrawer extends StatelessWidget {
  EXLayeredDrawer({super.key});

  final GlobalKey<SfLayeredDrawerState> widgetOneKey = GlobalKey<SfLayeredDrawerState>();

  @override
  Widget build(BuildContext context) {
    return SfLayeredDrawer(
      key: widgetOneKey,
      pageList: [
        PageTemplate(
          label: 'Page 4',
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(onPressed: () => widgetOneKey.currentState?.onPage(0), icon: Icon(Icons.menu)),
            ),
          ),
        ),
        PageTemplate(
          label: 'Page 3',
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(onPressed: () => widgetOneKey.currentState?.onPage(1), icon: Icon(Icons.menu)),
            ),
          ),
        ),
        PageTemplate(
          label: 'Page 2',
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(onPressed: () => widgetOneKey.currentState?.onPage(2), icon: Icon(Icons.menu)),
            ),
          ),
        ),
        PageTemplate(
          label: 'Page 1',
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(onPressed: () => widgetOneKey.currentState?.onPage(3), icon: Icon(Icons.menu)),
            ),
          ),
        ),
      ],
    );
  }
}
