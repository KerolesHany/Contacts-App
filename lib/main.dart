import 'package:contact/screens/contact_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ContactApp());
}

class ContactApp extends StatelessWidget {
  const ContactApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      routes: {
        ContactScreen.routeName: (_) => const ContactScreen(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: ContactScreen.routeName,
    );
  }
}
