import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson81/blocs/products/products_bloc.dart';
import 'package:lesson81/data/models/product.dart';

class EditProduct extends StatefulWidget {
  final Product product;
  const EditProduct({super.key, required this.product});

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
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
              initialValue: widget.product.title,
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
              initialValue: widget.product.description,
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
              initialValue: widget.product.price,
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
              initialValue: widget.product.images[0].split('"')[1],
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

                context.read<ProductsBloc>().add(EditProductEvent(
                      {
                        "title": title,
                        "price": int.parse(price),
                        "description": description,
                        "categoryId": 1,
                        "images": [imageUrl],
                      },
                      widget.product.id,
                    ));

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
