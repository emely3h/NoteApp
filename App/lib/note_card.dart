import 'package:flutter/material.dart';
import './detail_Screen.dart';

class NoteCard extends StatelessWidget {
  final Function delete;
  String category;
  NoteCard(this.category, this.delete);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      height: 60,
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        shadowColor: Colors.black,
        elevation: 5,
        child: ClipPath(
          clipper: ShapeBorderClipper(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          child: Container(
            height: 180,
            decoration: BoxDecoration(
              border: Border(
                  left: BorderSide(
                      color: Theme.of(context).primaryColor, width: 20)),
              color: Colors.white70,
            ),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push<Widget>(
                          context,
                          MaterialPageRoute<Widget>(
                              builder: (BuildContext context) =>
                                  DetailScreen()),
                        );
                      },
                      child: Text(
                        category,
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => delete(),
                  color: Colors.black38,
                )
              ],
            ),
          ),
        ),
      ),
    );
    /*  child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: */

    /* Card(
          elevation: 10,
          shape: Border(
              left:
                  BorderSide(color: Theme.of(context).primaryColor, width: 10)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ],
            ),
          ), */
  }
}
