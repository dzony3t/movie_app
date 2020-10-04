
import 'package:flutter/material.dart';

class OverviewDetails extends StatelessWidget {
  final details;
  OverviewDetails({this.details});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Description'),),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            child: Text(details.overview, style: TextStyle(color: Colors.white, fontSize: 15),),
          ),
        ),
      ),
    );
  }
}
