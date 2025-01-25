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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Made with ',
              style: AppStyles.bodyText.copyWith(
                color: AppColors.textColor,
                fontSize: 16,
              ),
            ),
            const FlutterLogo(size: 20),
            Text(
              ' by Sufiyan',
              style: AppStyles.bodyText.copyWith(
                color: AppColors.textColor,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
