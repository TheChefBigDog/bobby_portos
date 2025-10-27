import 'package:bobby_portfolio/data/model/social_link/model.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioController extends GetxController {
  var name = RxString("Samuel test");
  var title = RxString("Flutter Developer | Mobile & Web Apps");
  var about = RxString(
    "Hi! I'm a passionate Flutter developer with experience in creating beautiful, responsive, and scalable applications for mobile and web platforms.",
  );
  var email = RxString("samuel.ryan@example.com");
  var phone = RxString("+62 812-3456-7890");
  var linkedin = RxString("www.linkedin.com/in/samuel-ryan");
  final RxList<SocialLink> socialLinks = <SocialLink>[].obs;

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  Future<void> openWhatsApp() async {
    final uri = Uri.parse('https://wa.me/62859211150899');
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }
}
