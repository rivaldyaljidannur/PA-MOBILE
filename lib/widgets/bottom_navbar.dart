import 'package:flutter/material.dart';
import 'package:skena/pages/DropPage.dart';
import 'package:skena/pages/NewsPage.dart';
import 'package:skena/pages/SavedPage.dart';
import 'package:skena/pages/SignInPage.dart';

class BottomNavbar extends StatefulWidget {
  final int currentIndex;
  BottomNavbar({super.key, required this.currentIndex});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => NewsPage()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const DropPage()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SavedPage()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.article),
          label: 'News',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.flash_on),
          label: 'Drops',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark),
          label: 'Saved',
        ),
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.person),
        //   label: 'Account',
        // ),
      ],
      currentIndex: _currentIndex,
      onTap: _onItemTapped,
      selectedItemColor: Colors.purple,
      type: BottomNavigationBarType.fixed,
    );
  }
}
