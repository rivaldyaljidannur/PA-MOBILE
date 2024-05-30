import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skena/widgets/Drawer.dart';
import 'dart:convert';
import 'package:skena/widgets/bottom_navbar.dart';
import 'package:skena/widgets/product_detail.dart';
import 'package:intl/intl.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({super.key});

  @override
  _SavedPageState createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
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
      savedArticles = savedProducts
          .map((item) => json.decode(item) as Map<String, dynamic>)
          .toList();
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

  void _sortByName({bool ascending = true}) {
    setState(() {
      savedArticles.sort((a, b) {
        return ascending
            ? a['name'].compareTo(b['name'])
            : b['name'].compareTo(a['name']);
      });
    });
  }

  void _sortByDate({bool ascending = true}) {
    setState(() {
      savedArticles.sort((a, b) {
        DateFormat formatter = DateFormat('MMM dd, yyyy');
        DateTime dateA = formatter.parse(a['date']);
        DateTime dateB = formatter.parse(b['date']);
        return ascending ? dateA.compareTo(dateB) : dateB.compareTo(dateA);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerHype(),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: const Text('Saved Articles'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (value) {
              switch (value) {
                case 'Name Ascending':
                  _sortByName(ascending: true);
                  break;
                case 'Name Descending':
                  _sortByName(ascending: false);
                  break;
                case 'Date Ascending':
                  _sortByDate(ascending: true);
                  break;
                case 'Date Descending':
                  _sortByDate(ascending: false);
                  break;
              }
            },
            itemBuilder: (BuildContext context) {
              return {
                'Name Ascending',
                'Name Descending',
                'Date Ascending',
                'Date Descending'
              }.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
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
                  leading: Image.asset(article['imagePath'],
                      width: 100, height: 100, fit: BoxFit.cover),
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
