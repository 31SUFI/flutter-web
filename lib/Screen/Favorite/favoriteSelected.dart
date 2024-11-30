import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing/Provider/favorite-provider.dart';

class Favoriteselected extends StatelessWidget {
  const Favoriteselected({super.key});

  @override
  Widget build(BuildContext context) {
    final providerfav = Provider.of<FavoriteProvider>(context);
    print("buuld");
    return Scaffold(
      appBar: AppBar(
        title: const Text("favorite"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: providerfav.selecteditems.length,
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
