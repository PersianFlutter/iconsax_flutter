import 'package:url_launcher/url_launcher.dart';

Future<void> openGithubRepo() async {
  final Uri url =
      Uri.parse('https://github.com/PersianFlutter/iconsax_flutter');
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
