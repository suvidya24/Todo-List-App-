import 'package:flutter/material.dart';
import 'package:todo/data/journal_entry.dart';
// import 'package:todo/data/data.dart';
import 'package:intl/intl.dart'; 

class AddEntryButtomSheet extends StatefulWidget {
  final Function(JournalEntry) onSave;
  const AddEntryButtomSheet({required this.onSave, super.key});
  @override
  State<AddEntryButtomSheet> createState() => _AddEntryButtomSheetState();
}

class _AddEntryButtomSheetState extends State<AddEntryButtomSheet> {
  // Text Editing Controllers for the input fields
  final TextEditingController _titleEditingController = TextEditingController();
  final TextEditingController _containEditingController = TextEditingController();

  // void printData() {
  //   print(_titleEditingController.text);
  //   print(_containEditingController.text);
  //   _titleEditingController.clear();
  //   _containEditingController.clear();
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _titleEditingController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Title",
              ),
            ),

            SizedBox(height: 16),

            TextField(
              controller: _containEditingController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Content",
              ),
            ),

            SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [
                OutlinedButton(
                  onPressed: () {
                    //printData();
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    JournalEntry entry = JournalEntry(
                      id: "0",
                      title: _titleEditingController.text,
                      content: _containEditingController.text,
                      date: DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now()),
                    );
                    // setState(() {
                    //   listOfEntry.add(entry);
                    // });
                    // Navigator.pop(context);
                    widget.onSave(entry);
                  },
                  child: Text(
                    "Save",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
