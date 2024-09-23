import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

final baseUtilsProvider = Provider<BaseUtils>(
  (ref) => BaseUtils(),
);

class BaseUtils {
  Future<void> launchURL(String? url) async {
    if (url != null) {
      final url0 = Uri.parse(url);
      //  check that url can open in browser.
      if (await canLaunchUrl(url0)) {
        await launchUrl(url0);
      } else {
        throw 'Could not launch $url';
      }
    }
  }
}
