import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:skena/pages/SignInPage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DrawerHype extends StatelessWidget {
  DrawerHype({super.key});

  final supabase = Supabase.instance.client;

  @override
  Widget build(BuildContext context) {
    void signOut() async {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Signing Out...')));
      await supabase.auth.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignInPage()),
      );
    }

    return Drawer(
      child: Container(
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 225, 225, 225)),
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 238, 35, 43)),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: const Text(
                      'HYPEABYSS',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white
                  
                ),
                onPressed: () {
                  signOut();
                },
                child: const Row(
                  children: [
                    Icon(Icons.logout_sharp),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Sign Out'),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
