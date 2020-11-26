import 'package:App/note_card.dart';
import 'package:flutter/material.dart';
import 'package:App/CustomAppBar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(50, 130, 184, 1.0),
        textSelectionColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> categories = [
    "Einkaufen",
    "Merken",
    "DiesDas",
    "Wichtiges",
    "Erkenntnisse",
    "asdf",
    "a",
    "b",
    "c",
  ];

  final myController = TextEditingController();

  void addCategory(String category) {
    setState(() {
      categories.add(category);
    });
    Navigator.of(context).pop();
  }
  void deleteCategory(String category){
    print("deleted");
    setState(() {
      categories.remove(category);
    });
  }

  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  void newEntry() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Type a category name:",
                style: TextStyle(color: Theme.of(context).primaryColor)),
            actionsPadding: EdgeInsets.symmetric(horizontal: 30),
            buttonPadding: EdgeInsets.symmetric(horizontal: 20),
            content: TextField(
              controller: myController,
              onSubmitted: addCategory,
            ),
            actions: [
              FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                color: Theme.of(context).primaryColor,
                child: Text("Go Back", style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                color: Theme.of(context).primaryColor,
                child: Text("Submit", style: TextStyle(color: Colors.white)),
                onPressed: () {
                  addCategory(myController.text);
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Notes"),
      floatingActionButton: FloatingActionButton(
        elevation: 10.0,
        child: Icon(
          Icons.add,
          color: Theme.of(context).primaryColor,
          size: 50,
        ),
        backgroundColor: Colors.white,
        onPressed: newEntry,
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
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: categories.length,
            itemBuilder: (BuildContext context, i) {
              return Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: NoteCard(categories[i], () => deleteCategory(categories[i]),));
            },
          ),
        ),
      ),
    );
  }
}
