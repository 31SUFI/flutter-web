import 'package:flutter/material.dart';
import 'package:portfolio_website/utils/constants.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.menu, color: AppColors.textColor),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
    );
  }
}

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white, // Set background color to white
        child: Center(
          // Center the content
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center vertically
            children: [
              ListTile(
                leading: const Icon(Icons.home, color: Colors.black),
                title:
                    const Text('Home', style: TextStyle(color: Colors.black)),
                onTap: () {
                  // Navigate to Home
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.info, color: Colors.black),
                title:
                    const Text('About', style: TextStyle(color: Colors.black)),
                onTap: () {
                  // Navigate to About
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.star, color: Colors.black),
                title:
                    const Text('Skills', style: TextStyle(color: Colors.black)),
                onTap: () {
                  // Navigate to Skills
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.work, color: Colors.black),
                title: const Text('Projects',
                    style: TextStyle(color: Colors.black)),
                onTap: () {
                  // Navigate to Projects
                  Navigator.pop(context);
                },
              ),
              // Add more items as needed
            ],
          ),
        ),
      ),
    );
  }
}
