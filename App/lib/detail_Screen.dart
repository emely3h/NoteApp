import 'package:flutter/material.dart';
import './CustomAppBar.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Category 1"),
      floatingActionButton: FloatingActionButton(
        elevation: 10.0,
        child: Icon(
          Icons.add,
          color: Theme.of(context).primaryColor,
          size: 50,
        ),
        backgroundColor: Colors.white,
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: new BorderRadius.only(
            bottomLeft: const Radius.circular(20.0),
            bottomRight: const Radius.circular(20.0),
          ),
        ),
        child: Container(
          height: 500,
          padding: EdgeInsets.only(top: 40),
        ),
      ),
    );
  }
}
