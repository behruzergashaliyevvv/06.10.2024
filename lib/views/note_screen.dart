

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/note_controller.dart';

class NoteScreen extends StatelessWidget {
  final productNameController = TextEditingController();
  final priceController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final noteController = Provider.of<NoteController>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Note')),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Column(
              children: [
                TextField(
                  controller: productNameController,
                  decoration: InputDecoration(labelText: 'Product Name'),
                ),
                TextField(
                  controller: priceController,
                  decoration: InputDecoration(labelText: 'Price'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: amountController,
                  decoration: InputDecoration(labelText: 'Amount'),
                  keyboardType: TextInputType.number,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await noteController.addNote(
                      productNameController.text,
                      double.parse(priceController.text),
                      int.parse(amountController.text),
                    );
                  },
                  child: Text('Add Note'),
                ),
              ],
            ),
          ),
          Expanded(
            child: noteController.notes.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: noteController.notes.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(noteController.notes[index].productName),
                        subtitle: Text(
                            '\$${noteController.notes[index].price}\nAmount: ${noteController.notes[index].amount}'),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            noteController
                                .deleteNote(noteController.notes[index].id);
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
