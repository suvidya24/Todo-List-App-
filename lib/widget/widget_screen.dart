import 'package:flutter/material.dart';
import 'package:todo/data/journal_entry.dart';

class JournalEntryScreen extends StatelessWidget {
  final JournalEntry entry; 
  const JournalEntryScreen({required this.entry,super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      //color : const Color.fromARGB(255, 235, 215, 143),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              entry.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            SizedBox(height: 8),

            Text(
              entry.content, 
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
            ),

            SizedBox(height: 8),

            Text(
              entry.date,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
