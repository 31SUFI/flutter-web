import 'package:flutter/material.dart';
import 'package:portfolio_website/widgets/navbar.dart';
import 'package:portfolio_website/sections/hero_section.dart';
import 'package:portfolio_website/sections/about_section.dart';
import 'package:portfolio_website/sections/skills_section.dart';
import 'package:portfolio_website/sections/projects_section.dart';
import 'package:visibility_detector/visibility_detector.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final Map<String, bool> _visibleSections = {
    'hero': true,
    'about': false,
    'skills': false,
    'projects': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Navbar(),
      ),
      drawer: const NavDrawer(),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            VisibilityDetector(
              key: const Key('hero'),
              onVisibilityChanged: (info) {
                if (info.visibleFraction > 0.3) {
                  setState(() => _visibleSections['hero'] = true);
                }
              },
              child: const HeroSection(),
            ),
            VisibilityDetector(
              key: const Key('about'),
              onVisibilityChanged: (info) {
                if (info.visibleFraction > 0.3) {
                  setState(() => _visibleSections['about'] = true);
                }
              },
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 800),
                opacity: _visibleSections['about']! ? 1.0 : 0.0,
                child: const AboutSection(),
              ),
            ),
            VisibilityDetector(
              key: const Key('skills'),
              onVisibilityChanged: (info) {
                if (info.visibleFraction > 0.3) {
                  setState(() => _visibleSections['skills'] = true);
                }
              },
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 800),
                opacity: _visibleSections['skills']! ? 1.0 : 0.0,
                child: const SkillsSection(),
              ),
            ),
            VisibilityDetector(
              key: const Key('projects'),
              onVisibilityChanged: (info) {
                if (info.visibleFraction > 0.3) {
                  setState(() => _visibleSections['projects'] = true);
                }
              },
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 800),
                opacity: _visibleSections['projects']! ? 1.0 : 0.0,
                child: const ProjectsSection(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
