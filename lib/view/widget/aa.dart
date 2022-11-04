import 'package:flutter/material.dart';

import '../../view_modle/controller_status_page.dart';
import '../../view_modle/darkmode/them_controller.dart';
import 'package:get/get.dart';
class DarkModeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerStatusPage>(
        init: ControllerStatusPage(),
        builder: (controller){
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            //  bukidIconWidget(context),
              Switch(
                  activeColor: Get.isDarkMode?Colors.black45:Colors.white,
                  activeTrackColor: Get.isDarkMode?Colors.blue:Colors.red,
                  value:controller.darkSwich ,
                  onChanged: (value){
                    ThemeDarkController().ChangeThemedark();
                    controller.darkSwich=value;
                  }
              )
            ],);
        });
  }
}