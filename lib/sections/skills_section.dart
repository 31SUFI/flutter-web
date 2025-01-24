import 'package:flutter/material.dart';
import 'package:portfolio_website/utils/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animate_do/animate_do.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      duration: const Duration(milliseconds: 1200),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isDesktop = constraints.maxWidth > 800;

          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? 80 : 20,
              vertical: 60,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'I have attained ',
                        style: AppStyles.headerText.copyWith(
                          fontSize: 28,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: 'Expertise',
                        style: AppStyles.headerText.copyWith(
                          fontSize: 28,
                          color: AppColors.accentColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: ' in an array of cutting-edge ',
                        style: AppStyles.headerText.copyWith(
                          fontSize: 28,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: 'tech stacks',
                        style: AppStyles.headerText.copyWith(
                          fontSize: 28,
                          color: AppColors.accentColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Empowering me to craft seamless and innovative solutions.',
                  style: AppStyles.subHeaderText.copyWith(
                    color: AppColors.accentColor,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'During my internship at Invision Custom Solutions, I developed a mobile app using Flutter, focusing on high-quality and scalable solutions. I worked closely with a cross-functional team to add new features, ensuring smooth functionality and integration across the app. This hands-on experience sharpened my skills in mobile development and team collaboration.',
                  style: AppStyles.bodyText.copyWith(
                    color: Colors.black,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 40),
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: _buildSkillCards(isDesktop),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  List<Widget> _buildSkillCards(bool isDesktop) {
    final List<Map<String, String>> skills = [
      {'name': 'Dart', 'icon': 'assets/icons/skills/dart.svg'},
      {'name': 'Flutter', 'icon': 'assets/icons/skills/flutter.svg'},
      {'name': 'Firebase', 'icon': 'assets/icons/skills/firebase.svg'},
      {'name': 'Git', 'icon': 'assets/icons/skills/git.svg'},
      {'name': 'Rest API', 'icon': 'assets/icons/skills/api.svg'},
      {'name': 'Provider', 'icon': 'assets/icons/skills/statemanagement.svg'},
      {'name': 'MvvM Architecture', 'icon': 'assets/icons/skills/mvvm.svg'},
      {'name': 'Node.js', 'icon': 'assets/icons/skills/nodejs.svg'},
      {'name': 'Express.js', 'icon': 'assets/icons/skills/express.svg'},
      {'name': 'MongoDB', 'icon': 'assets/icons/skills/mongodb.svg'},
      {'name': 'MySQL', 'icon': 'assets/icons/skills/mysql.svg'},
    ];

    return skills.map((skill) {
      return Container(
        width: isDesktop ? 150 : 100,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.accentColor.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              skill['icon']!,
              height: isDesktop ? 60 : 40,
              width: isDesktop ? 60 : 40,
            ),
            const SizedBox(height: 12),
            Text(
              skill['name']!,
              style: AppStyles.bodyText.copyWith(
                color: Colors.black,
                fontSize: isDesktop ? 16 : 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    }).toList();
  }
}
