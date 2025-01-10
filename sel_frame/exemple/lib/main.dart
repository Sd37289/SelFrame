import 'package:flutter/material.dart';
import 'package:sel_frame/sel_controller.dart';
import 'package:sel_frame/sel_material.dart';
import 'package:sel_frame/sel_navigator.dart';
import 'package:sel_frame/sel_scaffold.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SelMaterial(
      key: selMaterialKey,
      selHome: SelScaffold(
        selAppBar: Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          color: Colors.green,
          child: SizedBox(
            height: 20,
            child: ElevatedButton(
                onPressed: (){
              selOpenDrawer(context);
            },
                child: Text('dd'),
              style: ButtonStyle(
                // minimumSize: const Size(0, 0), // Minimum boyutları sıfıra ayarla
                // padding: EdgeInsets.zero,
              ),
            ),
          ),
        ),
        selBottomBar: Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          color: Colors.blue,
        ),
      ),
    );
  }
}

class secondPage extends StatelessWidget {
  const secondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.purple,
      child: ElevatedButton(
          onPressed: () {
            selNavigatorPush(context, newPage());
          },
          child: Text('adsfadsf')),
    );
  }
}

class newPage extends StatelessWidget {
  const newPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.red,
    );
  }
}
