import 'package:flutter/material.dart';
import "package:intl/intl.dart";

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final String title;

  CustomAppBar(
    this.title, {
    Key key,
  })  : preferredSize = Size.fromHeight(130.0),
        super(key: key);

  @override
  static final now = new DateTime.now();
  final String today = DateFormat('yMd').format(now);

  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: new BorderRadius.only(
            bottomLeft: const Radius.circular(50.0),
            bottomRight: const Radius.circular(50.0),
          ),
          color: Theme.of(context).primaryColor,
        ),
        child: Column(
         
          crossAxisAlignment: CrossAxisAlignment.start,
          
          
          children: <Widget>[
          Row(
            children: [
              IconButton(icon: Icon(Icons.arrow_back),onPressed: Navigator.of(context).pop),
              Padding(
                padding: const EdgeInsets.only(left: 57, top: 20),
                child: Text(today, style: TextStyle(color: Theme.of(context).textSelectionColor),),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 57, top: 20),
            child: Text(title, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Theme.of(context).textSelectionColor) ,),
          ),
          
        ]),
      ),
   
    );
   
  }
}
