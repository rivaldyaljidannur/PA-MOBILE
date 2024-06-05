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
                        color: Color.fromARGB(255, 177, 0, 175)),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Image.asset(
                      'assets/images/logo.png', // Pastikan path ke asset logo benar
                      height: 100, // Atur ukuran logo sesuai kebutuhan
                      width: 100, // Atur lebar logo sesuai kebutuhan
                      fit: BoxFit.contain, // Atur bagaimana logo menyesuaikan dalam container
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
