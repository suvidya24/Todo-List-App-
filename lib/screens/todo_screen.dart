import 'package:flutter/material.dart';
import 'package:todo/widget/widget_screen.dart';
import 'package:todo/widget/add_entry_buttom.dart';
import 'package:todo/data/data.dart'; 

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Todo List",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Colors.black,
          ),
        ),
      ),

      body: ListView.builder(
        itemCount: listOfEntry.length,
        itemBuilder: (context, index) {
          return JournalEntryScreen(
            entry: listOfEntry[index],
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (context) {
              return AddEntryButtomSheet(
                onSave: (entry){
                  setState(() {
                      listOfEntry.add(entry);
                    });
                    Navigator.pop(context);
                },
              );
            },
          );
        },
        backgroundColor: Colors.amberAccent,
        splashColor: Colors.orangeAccent,
        child: Icon(Icons.add, size: 30, color: Colors.black),
      ),
    );
  }
}
