// lib/app/modules/home/home_view.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../common/widgets/other/custom_scaffold.dart';
import '../../../core/utils/utils.dart';
import '../../../core/variables/colors.dart';
import 'home_controller.dart';
import 'widgets/home_header_widget.dart';
import 'widgets/home_user_card_widget.dart';
import 'widgets/home_modules_grid_widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      bodyPadding: EdgeInsets.zero,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Purple Header Section
            HomeHeaderWidget(),

            // User Card Section
            Transform.translate(offset: Offset(0, -Utils.extraHighPadding), child: HomeUserCardWidget()),

            // Modules Grid Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Utils.normalPadding),
              child: HomeModulesGridWidget(),
            ),

            // Bottom spacing
            SizedBox(height: Utils.extraHighPadding * 2),
          ],
        ),
      ),
    );
  }
}
