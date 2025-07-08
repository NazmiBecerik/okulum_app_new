import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import '../common/widgets/appbar/home_app_bar.dart';
import '../common/widgets/buttons/custom_elevated_button.dart';
import '../common/widgets/textfield/custom_text_form_field.dart';
import '../common/widgets/textfield/search_field.dart';
import '../../routes/app_routes.dart';
import '../../../core/utils/utils.dart';
import '../../../core/variables/colors.dart';
import '../../../core/variables/enums.dart';

import '../common/widgets/appbar/default_app_bar.dart';

import '../common/widgets/icons/icon_with_background.dart';
import '../common/widgets/other/custom_scaffold.dart';
import '../common/widgets/texts/custom_text.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(child: Column(children: [
           
          ],
        )),
    );
  }

  HomeAppBar buildAppBar() {
    return HomeAppBar(
      actions: [
        settingsIcon(),
        SizedBox(width: Utils.lowPadding),
      ],
    );
  }

  InkWell settingsIcon() => InkWell(
    onTap: () => controller.settingsOnTap(),
    child: CircleAvatar(
      radius: Utils.normalIconSize,
      backgroundColor: ColorTable.getTextColor.withOpacity(0.03),
      child: Icon(Icons.settings_outlined, color: ColorTable.getTextColor, size: Utils.normalIconSize),
    ),
  );
}
