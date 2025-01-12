import 'package:flutter/material.dart';
import 'package:portfolio_website/utils/constants.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:portfolio_website/utils/url_launcher_utils.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animate_do/animate_do.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      duration: const Duration(milliseconds: 1200),
      child: Container(
        height:
            MediaQuery.of(context).size.height - 80, // Full height minus navbar
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hello, I\'m', style: AppStyles.subHeaderText),
                  Text('M. Sufiyan', style: AppStyles.headerText),
                  const SizedBox(height: 20),
                  DefaultTextStyle(
                    style: AppStyles.subHeaderText
                        .copyWith(color: AppColors.primaryColor),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText('Flutter Developer'),
                        TypewriterAnimatedText('UI/UX Designer'),
                        TypewriterAnimatedText('Mobile App Developer'),
                      ],
                      repeatForever: true,
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: UrlLauncherUtils.downloadCV,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                    ),
                    child: Text(
                      'Download CV',
                      style: AppStyles.bodyText.copyWith(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      _SocialIconButton(
                        svgPath: 'assets/icons/linkedin.svg',
                        platform: 'linkedin',
                      ),
                      const SizedBox(width: 15),
                      _SocialIconButton(
                        svgPath: 'assets/icons/github.svg',
                        platform: 'github',
                      ),
                      const SizedBox(width: 15),
                      _SocialIconButton(
                        svgPath: 'assets/icons/medium.svg',
                        platform: 'medium',
                      ),
                      const SizedBox(width: 15),
                      _SocialIconButton(
                        svgPath: 'assets/icons/whatsapp.svg',
                        platform: 'whatsapp',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Profile image or illustration can be added here
          ],
        ),
      ),
    );
  }
}

class _SocialIconButton extends StatelessWidget {
  final String svgPath;
  final String platform;

  const _SocialIconButton({
    required this.svgPath,
    required this.platform,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset(
        svgPath,
        height: 24,
        width: 24,
      ),
      onPressed: () => UrlLauncherUtils.openSocialMedia(platform),
      iconSize: 24,
      splashRadius: 24,
      tooltip: 'Visit $platform',
    );
  }
}
