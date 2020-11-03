import 'package:flutter/material.dart';

class DrawerScreenDetail extends StatelessWidget {
  final Text pageText;

  DrawerScreenDetail({this.pageText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: pageText,
              )
            ],
          ),
        ),
      ),
    );
  }
}
