import 'package:flutter/material.dart';
import 'package:portfolio_website/utils/constants.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      //color: AppColors.primaryColor.withOpacity(0.1), // Light background
      child: Center(
        child: Text(
          'Made with Flutter by Sufiyan',
          style: AppStyles.bodyText.copyWith(
            color: AppColors.textColor,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
