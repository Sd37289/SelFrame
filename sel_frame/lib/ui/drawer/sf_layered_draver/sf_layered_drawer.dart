import 'package:flutter/material.dart';

class SfLayeredDrawer extends StatefulWidget {
  const SfLayeredDrawer({
    super.key,
    required this.pageList,
    this.menuColor = Colors.deepOrangeAccent,
  });

  final List<PageTemplate> pageList;
  final Color menuColor;

  @override
  State<SfLayeredDrawer> createState() => SfLayeredDrawerState();
}

class SfLayeredDrawerState extends State<SfLayeredDrawer> {
  Duration duration = Duration(milliseconds: 500);
  double deviceScreenHeight = 0;
  double deviceScreenWidth = 0;
  List<PageProperties> propertiesList = [];
  int pageIndex = -1;
  int pageLastIndex = -1;

  @override
  void initState() {
    for (int i = 0; i < widget.pageList.length; i++) {
      propertiesList.add(PageProperties(scale: 1, radius: 0, topPositioned: 0, rightPositioned: 0));
    }
    pageIndex = widget.pageList.length;
    super.initState();
  }

  void onPage(int index) {
    setState(() {
      pageIndex = pageIndex == -1 ? index : -1;
      pageLastIndex = index != -1 ? index : pageLastIndex;
      for (int i = 0; i < propertiesList.length; i++) {
        propertiesList[i].scale = pageIndex == -1
            ? (0.7 + (i * 0.03))
            : pageIndex == i
                ? 1
                : (0.7 + (i * 0.03));
        propertiesList[i].radius = pageIndex == -1
            ? 40
            : pageIndex == i
                ? 0
                : 40;
        propertiesList[i].rightPositioned = pageIndex == -1
            ? -deviceScreenWidth * (0.5 + (i * 0.04))
            : pageIndex == i
                ? 0
                : -deviceScreenWidth;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    deviceScreenHeight = MediaQuery.of(context).size.height;
    deviceScreenWidth = MediaQuery.of(context).size.width;

    Widget menu() => Container(
          height: deviceScreenHeight,
          width: deviceScreenWidth,
          color: widget.menuColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
                widget.pageList.length,
                (index) => InkWell(
                      onTap: () => onPage(widget.pageList.length - 1 - index),
                      child: Row(
                        children: [
                          Container(
                            height: 45,
                            width: 8,
                            color: widget.pageList.length - 1 - index == pageLastIndex ? Colors.green : Colors.transparent,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            widget.pageList[widget.pageList.length - 1 - index].label,
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 28,
                              color: widget.pageList.length - 1 - index == pageLastIndex ? Colors.green : Colors.white,
                            ),
                          )
                        ],
                      ),
                    )),
          ),
        );

    Widget page(int index) => AnimatedScale(
          duration: duration,
          curve: Curves.easeInOut,
          scale: propertiesList[index].scale,
          child: AnimatedContainer(
              clipBehavior: Clip.hardEdge,
              duration: duration,
              height: deviceScreenHeight,
              width: deviceScreenWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(propertiesList[index].radius)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: widget.pageList[index].child),
        );

    return Scaffold(
      body: SizedBox(
        height: deviceScreenHeight,
        width: deviceScreenWidth,
        child: Stack(
          children: List.generate(
            widget.pageList.length + 1,
            (index) => index == 0
                ? menu()
                : AnimatedPositioned(
                    duration: duration,
                    top: propertiesList[index - 1].topPositioned,
                    right: propertiesList[index - 1].rightPositioned,
                    child: page(index - 1),
                  ),
          ),
        ),
      ),
    );
  }
}

class PageTemplate {
  final String label;
  final Widget child;

  PageTemplate({
    required this.label,
    required this.child,
  });
}

class PageProperties {
  double scale;
  double radius;
  double topPositioned;
  double rightPositioned;
  Color pageColor;

  PageProperties({
    required this.scale,
    required this.radius,
    required this.topPositioned,
    required this.rightPositioned,
    this.pageColor = Colors.white,
  });
}
