import 'package:flutter/material.dart';
import 'package:skena/widgets/bottom_navbar.dart'; 
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:skena/widgets/product_detail.dart'; // Untuk encoding dan decoding JSON

class DropPage extends StatefulWidget {
  const DropPage({super.key});

  @override
  State<DropPage> createState() => _DropPageState();
}

class _DropPageState extends State<DropPage> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Drops'),
          centerTitle: true,
          automaticallyImplyLeading: false, // Added this line to remove the back button
          bottom: const TabBar(
            tabs: [
              Tab(text: 'POPULAR'),
              Tab(text: 'UPCOMING'),
              Tab(text: 'RELEASED'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ProductGrid(),
            UpcomingTabContent(),
            ReleasedTabContent(),
          ],
        ),
        bottomNavigationBar: BottomNavbar(
        currentIndex: 1,
      ),
      ),
    );
  }
}

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(0),
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
      children: const [
        ProductItem(
          imagePath: 'assets/images/yeezy.jpg',
          name: 'YEEZY BOOST 350 V2 "Glow-in-the-Dark"',
          date: 'May 24, 2019',
          description: 'After many months of waiting, the YEEZY BOOST 350 V2 "Glow-in-the-Dark" is finally set to make its return, and is doing so in grand fashion. While presented in its traditional white leather, black and yellow build, the sneaker notably is accompanied by a briefcase that its high-top counterpart originally released with.',
        ),
        ProductItem(
          imagePath: 'assets/images/jordania.jpg',
          name: 'Air Jordan 1 MID WMNS',
          date: 'May 22, 2022',
          description: 'After many months of waiting, the Air Jordan 1 MID WMNS is finally set to make its return, and is doing so in grand fashion. While presented in its traditional white leather, black and yellow build, the sneaker notably is accompanied by a briefcase that its high-top counterpart originally released with.',
        ),
        ProductItem(
          imagePath: 'assets/images/jordan34.jpg',
          name: 'Air Jordan 34 "CNY"',
          date: 'Jan 02, 2020',
          description: 'After many months of waiting, the Air Jordan 34 "CNY" is finally set to make its return, and is doing so in grand fashion. While presented in its traditional white leather, black and yellow build, the sneaker notably is accompanied by a briefcase that its high-top counterpart originally released with.',
        ),
        ProductItem(
          imagePath: 'assets/images/jordan3gs.jpg',
          name: 'Air Jordan 3 GS',
          date: 'Jan 04, 2020',
          description: 'After many months of waiting, the Air Jordan 3 GS is finally set to make its return, and is doing so in grand fashion. While presented in its traditional white leather, black and yellow build, the sneaker notably is accompanied by a briefcase that its high-top counterpart originally released with.',
        ),
        ProductItem(
          imagePath: 'assets/images/jordanvolt.jpg',
          name: 'Air Jordan 1 High OG "Volt Gold"',
          date: 'Jan 09, 2021',
          description: 'After many months of waiting, the Air Jordan 1 High OG "Volt Gold" is finally set to make its return, and is doing so in grand fashion. While presented in its traditional white leather, black and yellow build, the sneaker notably is accompanied by a briefcase that its high-top counterpart originally released with.',
        ),
        ProductItem(
          imagePath: 'assets/images/jordan7.jpg',
          name: 'Air Jordan 7 GS "Chlorine Blue"',
          date: 'Jan 22, 2021',
          description: 'After many months of waiting, the Air Jordan 7 GS "Chlorine Blue" is finally set to make its return, and is doing so in grand fashion. While presented in its traditional white leather, black and yellow build, the sneaker notably is accompanied by a briefcase that its high-top counterpart originally released with.',
        ),
        ProductItem(
          imagePath: 'assets/images/jordanchina.jpg',
          name: 'Air Jordan 1 Low OG "Chinese New Year"',
          date: 'Jan 31, 2021',
          description: 'After many months of waiting, the Air Jordan 1 Low OG "Chinese New Year" is finally set to make its return, and is doing so in grand fashion. While presented in its traditional white leather, black and yellow build, the sneaker notably is accompanied by a briefcase that its high-top counterpart originally released with.',
        ),
        ProductItem(
          imagePath: 'assets/images/jordanroom.jpg',
          name: 'Trophy Room x Air Jordan 1 High OG',
          date: 'Feb 10, 2021',
          description: 'After many months of waiting, the Trophy Room x Air Jordan 1 High OG is finally set to make its return, and is doing so in grand fashion. While presented in its traditional white leather, black and yellow build, the sneaker notably is accompanied by a briefcase that its high-top counterpart originally released with.',
        ),
      ],
    );
  }
}

class ProductItem extends StatefulWidget {
  final String imagePath;
  final String name;
  final String date;
  final String description;

  const ProductItem({
    super.key,
    required this.imagePath,
    required this.name,
    required this.date,
    required this.description,
  });

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
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

  void _toggleSaved(BuildContext context) async {
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
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(isSaved ? 'Product saved!' : 'Product removed!')));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetail(
              imagePath: widget.imagePath,
              name: widget.name,
              date: widget.date,
              description: widget.description,
            ),
          ),
        );
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.asset(
                widget.imagePath,
                fit: BoxFit.cover,
                height: 150,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.date),
                  IconButton(
                    icon: Icon(isSaved ? Icons.bookmark : Icons.bookmark_border),
                    color: isSaved ? Colors.purple : Colors.grey,
                    onPressed: () => _toggleSaved(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UpcomingTabContent extends StatelessWidget {
  const UpcomingTabContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(0),
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
      children: const [
        ProductItem(
          imagePath: 'assets/images/jordantatum.jpeg',
          name: 'Jordan Tatum 1 "Tunnel Walk"',
          date: 'Jun 10, 2024',
          description: 'After many months of waiting, the Jordan Tatum 1 "Tunnel Walk" is finally set to make its return, and is doing so in grand fashion. While presented in its traditional white leather, black and yellow build, the sneaker notably is accompanied by a briefcase that its high-top counterpart originally released with.',
        ),
        ProductItem(
          imagePath: 'assets/images/jordanlow.jpg',
          name: 'Air Jordan 1 Low OG "Metallic Silver"',
          date: 'Jun 1, 2024',
          description: 'After many months of waiting, the Air Jordan 1 Low OG "Metallic Silver" is finally set to make its return, and is doing so in grand fashion. While presented in its traditional white leather, black and yellow build, the sneaker notably is accompanied by a briefcase that its high-top counterpart originally released with.',
        ),
        ProductItem(
          imagePath: 'assets/images/jordan5.jpg',
          name: 'Air Jordan 5 GS "Miami Hurricanes"',
          date: 'June 05, 2024',
          description: 'After many months of waiting, the Air Jordan 5 GS "Miami Hurricanes" is finally set to make its return, and is doing so in grand fashion. While presented in its traditional white leather, black and yellow build, the sneaker notably is accompanied by a briefcase that its high-top counterpart originally released with.',
        ),
        ProductItem(
          imagePath: 'assets/images/jordan6.jpg',
          name: 'Air Jordan 6 "Reverse Oreo"',
          date: 'June 06, 2024',
          description: 'After many months of waiting, the Air Jordan 6 "Reverse Oreo" is finally set to make its return, and is doing so in grand fashion. While presented in its traditional white leather, black and yellow build, the sneaker notably is accompanied by a briefcase that its high-top counterpart originally released with.',
        ),
        ProductItem(
          imagePath: 'assets/images/jordanloww.jpeg',
          name: 'Air Jordan 1 Low OG WMNS "Gorge Green"',
          date: 'June 12, 2024',
          description: 'After many months of waiting, the Air Jordan 1 Low OG WMNS "Gorge Green" is finally set to make its return, and is doing so in grand fashion. While presented in its traditional white leather, black and yellow build, the sneaker notably is accompanied by a briefcase that its high-top counterpart originally released with.',
        ),
        ProductItem(
          imagePath: 'assets/images/jordanmetal.jpg',
          name: 'Air Jordan 1 High 85 "Metallic Burgundy"',
          date: 'June 22, 2024',
          description: 'After many months of waiting, the Air Jordan 1 High 85 "Metallic Burgundy" is finally set to make its return, and is doing so in grand fashion. While presented in its traditional white leather, black and yellow build, the sneaker notably is accompanied by a briefcase that its high-top counterpart originally released with.',
        ),
      ],
    );
  }
}

class ReleasedTabContent extends StatelessWidget {
  const ReleasedTabContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(0),
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
      children: const [
        ProductItem(
          imagePath: 'assets/images/jordambiru.jpg',
          name: 'Air Jordan 4 "Military Blue"',
          date: 'May 04, 2024',
          description: 'After many months of waiting, the Air Jordan 4 "Military Blue" is finally set to make its return, and is doing so in grand fashion. While presented in its traditional white leather, black and yellow build, the sneaker notably is accompanied by a briefcase that its high-top counterpart originally released with.',
        ),
        ProductItem(
          imagePath: 'assets/images/jordanpink.jpg',
          name: 'Jordan Tatum 2 "Easter"',
          date: 'May 09, 2024',
          description: 'After many months of waiting, the Jordan Tatum 2 "Easter" is finally set to make its return, and is doing so in grand fashion. While presented in its traditional white leather, black and yellow build, the sneaker notably is accompanied by a briefcase that its high-top counterpart originally released with.',
        ),
        ProductItem(
          imagePath: 'assets/images/agusjordan.jpg',
          name: 'Air Jordan 4 GS "Messy Room"',
          date: 'Jan 07, 2023',
          description:''
        ),
        ProductItem(
          imagePath: 'assets/images/jordantrue.jpg',
          name: 'Air Jordan 1 High OG "True Blue"',
          date: 'Jan 14, 2023',
          description: ''
        ),
        ProductItem(
          imagePath: 'assets/images/jordanhitam.jpg',
          name: 'Air Jordan 7 GS "Barely Grape"',
          date: 'Jan 24, 2023',
          description: ''
        ),
        ProductItem(
          imagePath: 'assets/images/jrdn.jpg',
          name: 'Union x AJKO 1 Low "Sail"',
          date: 'Feb 04, 2023',
          description: ''
        ),
      ],
    );
  }
}

