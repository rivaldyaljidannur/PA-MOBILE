import 'package:flutter/material.dart';
import 'package:skena/pages/account_page.dart';
import 'package:skena/pages/saves_page.dart';
import 'package:skena/widgets/navbar.dart';
import 'package:skena/pages/drop_page.dart';
import 'package:skena/widgets/showsearch.dart';

class NewsPage extends StatefulWidget {
  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  int _currentIndex = 0;

  void _onNavbarItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) => NewsPage()));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) => DropPage()));
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context) => SavedPage()));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HYPEABYSS'),
        centerTitle: true,
        automaticallyImplyLeading: false, // Added this line to remove the back button
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('News'),
      ),
      bottomNavigationBar: CustomNavbar(
        currentIndex: _currentIndex,
        onItemSelected: _onNavbarItemTapped,
      ),
      // floatingActionButton: FloatingActionButton.extended(
      // //   onPressed: () {},
      // //   label: Text('Refine'),
      // //   icon: Icon(Icons.tune),
      // // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class DropItem extends StatelessWidget {
  final String imageUrl;
  final String date;
  final String name;

  DropItem({required this.imageUrl, required this.date, required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(imageUrl, height: 100, fit: BoxFit.cover),
          SizedBox(height: 8),
          Text(date, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text(name, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
