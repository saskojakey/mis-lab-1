import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_project/cloth.dart';

class NewClothes extends StatefulWidget {
  final Function addClothes;

  const NewClothes({Key? key, required this.addClothes}) : super(key: key);

  @override
  State<NewClothes> createState() => _NewClothesState();
}

class _NewClothesState extends State<NewClothes> {
  final nameCtl = TextEditingController();
  final priceCtl = TextEditingController();

  String _title = "";
  String price = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(children: [
        const Text("Add new article: ",
            style: TextStyle(fontSize: 20, color: Colors.lightBlueAccent)),
        TextField(
          controller: nameCtl,
          decoration: const InputDecoration(
            labelText: "Name:",
            hintText: "Insert name",
          ),
          onSubmitted: (_) => _submitData,
        ),
        TextField(
          controller: priceCtl,
          decoration: const InputDecoration(
            labelText: "Price",
            hintText: "Insert price",
          ),
          onSubmitted: (_) => _submitData,
        ),
        ElevatedButton(
            onPressed: _submitData,
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.redAccent,
              backgroundColor: Colors.lightGreenAccent,
              shadowColor: Colors.red,
              elevation: 5,
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
            child: const Text("Save"))
      ]),
    );
  }

  void _submitData() {
    if (nameCtl.text.isEmpty) {
      return;
    }
    _title = nameCtl.text;
    if (priceCtl.text.isEmpty) {
      return;
    }
    price = priceCtl.text;
    if (_title.isEmpty || price.isEmpty) {
      return;
    }
    final newClothes = Clothes(
      id: Random().nextInt(1000),
      name: _title,
      price: price,
    );
    widget.addClothes(newClothes);
    Navigator.of(context).pop();
  }
}
