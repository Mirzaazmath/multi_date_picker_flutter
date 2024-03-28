import 'package:flutter/material.dart';
import 'package:multi_date_picker_textfeild/home_screen.dart';

void main(){
  runApp( const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:   MyHomePage(),  );
  }
}