import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skena/pages/DropPage.dart';
import 'package:skena/pages/NewsPage.dart';
import 'package:skena/pages/SignInPage.dart';
import 'dart:convert';
import 'package:skena/widgets/bottom_navbar.dart';
import 'package:skena/widgets/product_detail.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({super.key});

  @override
  _SavedPageState createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  int _currentIndex = 2;

  List<Map<String, dynamic>> savedArticles = [];

  @override
  void initState() {
    super.initState();
    _loadSavedProducts();
  }

  void _loadSavedProducts() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> savedProducts = prefs.getStringList('savedProducts') ?? [];
    setState(() {
      savedArticles = savedProducts.map((item) => json.decode(item) as Map<String, dynamic>).toList();
    });
  }

  void _removeProduct(String name) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> savedProducts = prefs.getStringList('savedProducts') ?? [];
    savedProducts.removeWhere((item) => json.decode(item)['name'] == name);
    await prefs.setStringList('savedProducts', savedProducts);
    setState(() {
      savedArticles.removeWhere((article) => article['name'] == name);
    });
  }

  void _onNavbarItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NewsPage()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DropPage()),
        );
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context) => SavedPage()));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Articles'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: savedArticles.isEmpty
          ? const Center(
              child: Text('There is no saved article'),
            )
          : ListView.builder(
              itemCount: savedArticles.length,
              itemBuilder: (context, index) {
                var article = savedArticles[index];
                return ListTile(
                  leading: Image.asset(article['imagePath'], width: 100, height: 100, fit: BoxFit.cover),
                  title: Text(article['name']),
                  subtitle: Text('Published on: ${article['date']}'),
                  trailing: IconButton(
                    icon: Icon(Icons.bookmark_remove, color: Colors.red),
                    onPressed: () => _removeProduct(article['name']),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetail(
                          imagePath: article['imagePath'],
                          name: article['name'],
                          date: article['date'],
                          description: article['description'],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            bottomNavigationBar: BottomNavbar(
        currentIndex: 2,
      ),
    );
  }
}
