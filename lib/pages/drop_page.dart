import 'package:flutter/material.dart';
import 'package:skena/pages/account_page.dart';
import 'package:skena/pages/saves_page.dart';
import 'package:skena/widgets/navbar.dart';
import 'package:skena/pages/news_page.dart';
// import 'package:skena/pages/saved_page.dart';
// import 'package:skena/pages/account_page.dart';
import 'package:skena/pages/product_detail_page.dart'; // Import halaman detail

class DropPage extends StatefulWidget {
  const DropPage({super.key});

  @override
  State<DropPage> createState() => _DropPageState();
}

class _DropPageState extends State<DropPage> {
  int _currentIndex = 1;

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
        Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
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
        bottomNavigationBar: CustomNavbar(
          currentIndex: _currentIndex,
          onItemSelected: _onNavbarItemTapped,
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
          name: 'AIR JORDAN 1 MID WMNS',
          date: 'May 22, 2022',
          description: 'After many months of waiting, the AIR JORDAN 1 MID WMNS is finally set to make its return, and is doing so in grand fashion. While presented in its traditional white leather, black and yellow build, the sneaker notably is accompanied by a briefcase that its high-top counterpart originally released with.',
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
          date: 'Jan , 2021',
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

class ProductItem extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(
              imagePath: imagePath,
              name: name,
              date: date,
              description: description,
            ),
          ),
        );
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
              height: 120,
              width: double.infinity,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(date),
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
          name: 'Air Jordan 4 GS “Messy Room”',
          date: 'Jan 07, 2023',
          description:''
        ),
        ProductItem(
          imagePath: 'assets/images/jordantrue.jpg',
          name: 'Air Jordan 1 High OG “True Blue”',
          date: 'Jan 14, 2023',
          description: ''
        ),
        ProductItem(
          imagePath: 'assets/images/jordanhitam.jpg',
          name: 'Air Jordan 7 GS “Barely Grape”',
          date: 'Jan 24, 2023',
          description: ''
        ),
        ProductItem(
          imagePath: 'assets/images/jrdn.jpg',
          name: 'Union x AJKO 1 Low “Sail”',
          date: 'Feb 04, 2023',
          description: ''
        ),
      ],
    );
  }
}

