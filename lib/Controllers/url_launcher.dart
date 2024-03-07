import 'package:url_launcher/url_launcher.dart';

Future<void> launchURL(String url) async {
  if (!url.startsWith('http://') && !url.startsWith('https://')) {
    url = 'https://$url';
  }

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

