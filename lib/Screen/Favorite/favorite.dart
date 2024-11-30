import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing/Provider/favorite-provider.dart';
import 'package:testing/Screen/Favorite/favoriteSelected.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    print("buuld");
    return Scaffold(
      appBar: AppBar(
        title: const Text("favorite"),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Favoriteselected()));
            },
            child: Icon(Icons.favorite),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return Consumer<FavoriteProvider>(
                      builder: (context, value, child) {
                    return ListTile(
                      onTap: () {
                        if (value.selecteditems.contains(index)) {
                          value.remove(index);
                        } else {
                          value.add(index);
                        }
                      },
                      title: Text("item$index"),
                      trailing: Icon(value.selecteditems.contains(index)
                          ? Icons.favorite
                          : Icons.favorite_outline),
                    );
                  });
                }),
          )
        ],
      ),
    );
  }
}
