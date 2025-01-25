import 'package:flutter/material.dart';
import 'package:portfolio_website/widgets/navbar.dart';
import 'package:portfolio_website/sections/hero_section.dart';
import 'package:portfolio_website/sections/about_section.dart';
import 'package:portfolio_website/sections/skills_section.dart';
import 'package:portfolio_website/sections/projects_section.dart';
import 'package:portfolio_website/sections/footer_section.dart';
import 'package:visibility_detector/visibility_detector.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController scrollController = ScrollController();
  final Map<String, bool> visibleSections = {
    'hero': true,
    'about': false,
    'skills': false,
    'projects': false,
  };

  void updateVisibility(String sectionKey, bool isVisible) {
    setState(() {
      visibleSections[sectionKey] = isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Navbar(),
      ),
      drawer: NavDrawer(scrollController: scrollController),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            VisibilityDetector(
              key: const Key('hero'),
              onVisibilityChanged: (info) {
                updateVisibility('hero', info.visibleFraction > 0.3);
              },
              child: const HeroSection(),
            ),
            VisibilityDetector(
              key: const Key('about'),
              onVisibilityChanged: (info) {
                updateVisibility('about', info.visibleFraction > 0.3);
              },
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 800),
                opacity: visibleSections['about']! ? 1.0 : 0.0,
                child: const AboutSection(),
              ),
            ),
            VisibilityDetector(
              key: const Key('skills'),
              onVisibilityChanged: (info) {
                updateVisibility('skills', info.visibleFraction > 0.3);
              },
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 800),
                opacity: visibleSections['skills']! ? 1.0 : 0.0,
                child: const SkillsSection(),
              ),
            ),
            VisibilityDetector(
              key: const Key('projects'),
              onVisibilityChanged: (info) {
                updateVisibility('projects', info.visibleFraction > 0.3);
              },
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 800),
                opacity: visibleSections['projects']! ? 1.0 : 0.0,
                child: const ProjectsSection(),
              ),
            ),
            const FooterSection(),
          ],
        ),
      ),
    );
  }
}
