import 'package:flutter/material.dart';
import 'package:portfolio_website/widgets/navbar.dart';
import 'package:portfolio_website/sections/hero_section.dart';
import 'package:portfolio_website/sections/about_section.dart';
import 'package:portfolio_website/sections/skills_section.dart';
import 'package:portfolio_website/sections/projects_section.dart';
import 'package:portfolio_website/sections/footer_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Navbar(),
      ),
      drawer: NavDrawer(scrollController: scrollController),
      body: SingleChildScrollView(
        controller: scrollController,
        child: const Column(
          children: [
            HeroSection(),
            AboutSection(),
            SkillsSection(),
            ProjectsSection(),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}
