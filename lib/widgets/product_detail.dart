import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class ProductDetail extends StatefulWidget {
  final String imagePath;
  final String name;
  final String date;
  final String description;

  const ProductDetail({
    super.key,
    required this.imagePath,
    required this.name,
    required this.date,
    required this.description,
  });

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  bool isSaved = false;

  @override
  void initState() {
    super.initState();
    _checkIfSaved();
  }

  void _checkIfSaved() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> savedProducts = prefs.getStringList('savedProducts') ?? [];
    setState(() {
      isSaved = savedProducts.any((item) => json.decode(item)['name'] == widget.name);
    });
  }

  void _toggleSaved() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> savedProducts = prefs.getStringList('savedProducts') ?? [];
    if (isSaved) {
      savedProducts.removeWhere((item) => json.decode(item)['name'] == widget.name);
    } else {
      Map<String, dynamic> product = {
        'imagePath': widget.imagePath,
        'name': widget.name,
        'date': widget.date,
        'description': widget.description,
      };
      savedProducts.add(json.encode(product));
    }
    await prefs.setStringList('savedProducts', savedProducts);
    setState(() {
      isSaved = !isSaved;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drops'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(isSaved ? Icons.bookmark : Icons.bookmark_border),
            onPressed: _toggleSaved,
            color: isSaved ? Colors.purple : Colors.black,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              widget.imagePath,
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            const SizedBox(height: 16),
            Text(
              widget.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.date,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              widget.description,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

