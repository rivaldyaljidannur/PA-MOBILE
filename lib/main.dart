import 'package:flutter/material.dart';
import 'package:skena/pages/account_page.dart';
import 'package:skena/pages/news_page.dart';
import 'package:skena/pages/drop_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const supabaseUrl = 'https://qpllyvsicsgsecwxdnif.supabase.co';
const supabaseKey = String.fromEnvironment('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFwbGx5dnNpY3Nnc2Vjd3hkbmlmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTY5MDU0MjQsImV4cCI6MjAzMjQ4MTQyNH0.iM3c39Dx21SjnokcWb4-QHZwOuPAFozIHX89CN03ZKU');

Future<void> main() async {
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);
  runApp( const Mainpage());
}

class Mainpage extends StatelessWidget {
  const Mainpage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      routes: {
        '/': (context) => NewsPage(),
        '/drop': (context) => DropPage(),
        '/save': (context) => Text("Belum"),
        '/account': (context) => SignIn(),
      },
    );
  }
}