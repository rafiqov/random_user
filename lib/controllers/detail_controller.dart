import 'package:get/get.dart';

import '../models/user_model.dart';

class DetailController extends GetxController{
   User? user = Get.arguments;
   double width = 0.45;

   void goBack(){
      Get.back();
   }
}