import 'package:flutter/material.dart';
import 'package:my_project/addNew.dart';

import 'cloth.dart';

class ClothesListScreen extends StatefulWidget {
  const ClothesListScreen({Key? key}) : super(key: key);

  @override
  State<ClothesListScreen> createState() => _ClothesListScreenState();
}

class _ClothesListScreenState extends State<ClothesListScreen> {
  final List<Clothes> _clothes = [
    Clothes(id: 1, name: "Pants", price: "300\$"),
  ];

  void _addClothesFunction() {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: NewClothes(addClothes: _addClothes),
        );
      },
    );
  }

  void _addClothes(Clothes clothes) {
    setState(() {
      _clothes.add(clothes);
    });
  }

  void _editClothes(Clothes clothes) {
    TextEditingController nameController =
        TextEditingController(text: clothes.name);
    TextEditingController priceCtl = TextEditingController(text: clothes.price);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Clothes'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: priceCtl,
                  decoration: const InputDecoration(
                    labelText: 'Price',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Update'),
              onPressed: () {
                setState(() {
                  clothes.name = nameController.text;
                  clothes.price = priceCtl.text;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Clothes'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: _clothes.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(
                _clothes[index].name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              subtitle: Text(
                _clothes[index].price ?? "",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w100,
                  color: Colors.green,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit_rounded),
                    onPressed: () => _editClothes(_clothes[index]),
                    color: Colors.green,
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete_rounded),
                    onPressed: () {
                      setState(() {
                        _clothes.removeAt(index);
                      });
                    },
                    color: Colors.lightBlue,
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addClothesFunction,
        tooltip: 'Add Clothes',
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
