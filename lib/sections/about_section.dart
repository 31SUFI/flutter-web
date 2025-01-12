import 'package:flutter/material.dart';
import 'package:portfolio_website/utils/constants.dart';
import 'package:animate_do/animate_do.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
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
                        text: 'About Me ',
                        style: AppStyles.headerText.copyWith(
                          fontSize: 28,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Passionate Flutter Developer & Technical Trainer',
                  style: AppStyles.subHeaderText.copyWith(
                    color: AppColors.accentColor,
                  ),
                ),
                const SizedBox(height: 30),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Who am I?',
                        style: AppStyles.headerText.copyWith(
                          fontSize: 24,
                          color: AppColors.accentColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  '''I'm Muhammad Sufiyan, a Flutter Developer, a Student, and a Technical Trainer.

I'm a final-year Computer Science student at Dawood University of Engineering and Technology and a national-level certified mobile app developer. I have been learning and working in mobile app development for over 2 years, during which I've collaborated with different organizations to help them launch their prototypes and gain practical experience. My passion for technology and education has led me to teach others, sharing my industry knowledge as a technical teacher.

In addition to my academic pursuits, I have real-world industry experience, having contributed to numerous projects that combine innovative mobile solutions with modern technologies. Currently, I'm focused on advancing my skills in Flutter, AI, and machine learning, always seeking new challenges to further push my capabilities.''',
                  style: AppStyles.bodyText.copyWith(
                    color: Colors.black,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
