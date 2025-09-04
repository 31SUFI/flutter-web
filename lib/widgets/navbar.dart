import 'package:flutter/material.dart';
import 'package:portfolio_website/screens/home_screen.dart';
import 'package:portfolio_website/utils/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      actions: [
        IconButton(
          icon: SvgPicture.asset(
            'assets/icons/coding.svg',
            height: 24,
            width: 24,
          ),
          onPressed: () {
            // No action needed, just display the icon
          },
        ),
      ],
    );
  }
}

class NavDrawer extends StatelessWidget {
  final ScrollController scrollController;

  const NavDrawer({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                leading: const Icon(Icons.home, color: Colors.black),
                title:
                    const Text('Home', style: TextStyle(color: Colors.black)),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.info, color: Colors.black),
                title:
                    const Text('About', style: TextStyle(color: Colors.black)),
                onTap: () {
                  Navigator.pop(context);
                  scrollController.animateTo(
                    600,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.star, color: Colors.black),
                title:
                    const Text('Skills', style: TextStyle(color: Colors.black)),
                onTap: () {
                  Navigator.pop(context);
                  scrollController.animateTo(
                    1200,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.work, color: Colors.black),
                title: const Text('Experience',
                    style: TextStyle(color: Colors.black)),
                onTap: () {
                  Navigator.pop(context);
                  scrollController.animateTo(
                    1500,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.code, color: Colors.black),
                title: const Text('Projects',
                    style: TextStyle(color: Colors.black)),
                onTap: () {
                  Navigator.pop(context);
                  scrollController.animateTo(
                    1800,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
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
