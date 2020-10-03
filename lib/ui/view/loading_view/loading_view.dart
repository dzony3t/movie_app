import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 100,
        child: Center(child: CircularProgressIndicator()));
  }
}
