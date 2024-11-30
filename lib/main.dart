import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing/Provider/counter-provider.dart';
import 'package:testing/Provider/favorite-provider.dart';
import 'package:testing/Screen/Favorite/favorite.dart';

import 'Screen/counter/counterscreen.dart';

// Import the Counter class

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => FavoriteProvider(), // Provide the Counter class
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Favorite(),
    );
  }
}
