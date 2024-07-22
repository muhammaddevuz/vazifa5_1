import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson81/blocs/products/products_bloc.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  String title = '';
  String description = '';
  String price = '';
  String imageUrl = '';

  final _formKey = GlobalKey<FormState>();

  void _add() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add Note"),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Title',
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Iltimos title kiriting";
                }
                return null;
              },
              onSaved: (newValue) {
                if (newValue != null) {
                  title = newValue;
                }
              },
            ),
            TextFormField(
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Description',
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Iltimos description kiritin";
                }
                return null;
              },
              onSaved: (newValue) {
                if (newValue != null) {
                  description = newValue;
                }
              },
            ),
            TextFormField(
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Narx',
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Iltimos Narx kiriting";
                }
                return null;
              },
              onSaved: (newValue) {
                if (newValue != null) {
                  price = newValue;
                }
              },
            ),
            TextFormField(
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'ImageUrl',
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Iltimos ImageUrl kiriting";
                }
                return null;
              },
              onSaved: (newValue) {
                if (newValue != null) {
                  imageUrl = newValue;
                }
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel")),
        ElevatedButton(
            onPressed: () {
              _add();
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                context.read<ProductsBloc>().add(AddProductEvent({
                      "title": title,
                      "price": int.parse(price),
                      "description": description,
                      "categoryId": 1,
                      "images": [imageUrl],
                    }));

                Navigator.pop(context);
              }
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, foregroundColor: Colors.white),
            child: const Text("Qo'shish"))
      ],
    );
  }
}
