import 'package:url_launcher/url_launcher.dart';

class Lanc{
  static Future<void> launch(url) async {
  if (await canLaunch(url)) {
 
 
    await launch(url);
  } else {
    print("Not supported");
  }
}
}


