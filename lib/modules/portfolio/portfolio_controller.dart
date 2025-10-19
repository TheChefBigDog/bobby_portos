import 'package:get/get.dart';

class PortfolioController extends GetxController {
  var name = RxString("Samuel test");
  var title = "Flutter Developer | Mobile & Web Apps".obs;
  var about =
      "Hi! I'm a passionate Flutter developer with experience in creating beautiful, responsive, and scalable applications for mobile and web platforms."
          .obs;

  var email = "samuel.ryan@example.com".obs;
  var phone = "+62 812-3456-7890".obs;
  var linkedin = "www.linkedin.com/in/samuel-ryan".obs;
}
