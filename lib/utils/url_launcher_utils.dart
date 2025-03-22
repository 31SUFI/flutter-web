import 'package:url_launcher/url_launcher.dart';

class UrlLauncherUtils {
  static Future<void> downloadCV() async {
    const url =
        'https://drive.google.com/file/d/1hB8aBfWFTnVfCY28VCU_M6-wZ28eFOwC/view?usp=drive_link';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  static Future<void> openSocialMedia(String platform) async {
    final urls = {
      'github': 'https://github.com/31SUFI',
      'linkedin': 'https://www.linkedin.com/in/muhammad-sufiyan-3179aa199/',
      'medium': 'https://medium.com/@ksufi7350',
      'whatsapp': 'https://wa.me/03150261059',
    };

    final url = urls[platform];
    if (url != null && await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }
}
