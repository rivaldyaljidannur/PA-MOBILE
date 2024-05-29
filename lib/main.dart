import 'package:flutter/material.dart';
import 'package:skena/pages/SignInPage.dart';
import 'package:skena/pages/NewsPage.dart';
import 'package:skena/pages/DropPage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// const supabaseUrl = 'https://qpllyvsicsgsecwxdnif.supabase.co';
// const supabaseKey = String.fromEnvironment('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFwbGx5dnNpY3Nnc2Vjd3hkbmlmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTY5MDU0MjQsImV4cCI6MjAzMjQ4MTQyNH0.iM3c39Dx21SjnokcWb4-QHZwOuPAFozIHX89CN03ZKU');

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
      url: 'https://kuyagctvyoymheookkir.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt1eWFnY3R2eW95bWhlb29ra2lyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTY5NzM2OTMsImV4cCI6MjAzMjU0OTY5M30.u5SFmYoauo3aMM1nkGgYj3aZKAJp1NbL2hg4toRes-w');
  runApp(const Mainpage());
}

class Mainpage extends StatelessWidget {
  const Mainpage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      routes: {
        '/': (context) => SignInPage(),
        '/drop': (context) => const DropPage(),
        '/save': (context) => const Text("Belum"),
        '/account': (context) => const SignInPage(),
      },
    );
  }
}
