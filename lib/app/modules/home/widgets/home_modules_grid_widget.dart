// lib/app/modules/home/widgets/home_modules_grid_widget.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/variables/colors.dart';
import '../../common/controllers/user_controller.dart';
import '../../common/widgets/card/custom_card.dart';
import '../../common/widgets/texts/custom_text.dart';
import '../home_controller.dart';

class HomeModulesGridWidget extends GetView<HomeController> {
  const HomeModulesGridWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // First row - 3 items
        Row(
          children: [
            Expanded(child: _buildModuleCard("Haberler", Icons.calendar_today, Color(0xFF6B73FF), () {})),
            SizedBox(width: Utils.normalPadding),
            Expanded(child: _buildModuleCard("Duyurular", Icons.campaign, Color(0xFFFF9800), () {})),
            SizedBox(width: Utils.normalPadding),
            Expanded(child: _buildModuleCard("Dökümanlar", Icons.description, Color(0xFF4CAF50), () {})),
          ],
        ),
        SizedBox(height: Utils.normalPadding),

        // Second row - 3 items
        Row(
          children: [
            Expanded(child: _buildModuleCard("QR", Icons.qr_code, Color(0xFF9C27B0), () {})),
            SizedBox(width: Utils.normalPadding),
            Expanded(child: _buildModuleCard("Randevu Al", Icons.access_time, Color(0xFF00BCD4), () {})),
            SizedBox(width: Utils.normalPadding),
            Expanded(child: _buildModuleCard("E-Yoklama", Icons.checklist, Color(0xFF607D8B), () {})),
          ],
        ),
        SizedBox(height: Utils.normalPadding),

        // Third row - 3 items
        Row(
          children: [
            Expanded(child: _buildModuleCard("Ders Programı", Icons.schedule, Color(0xFFE91E63), () {})),
            SizedBox(width: Utils.normalPadding),
            Expanded(child: _buildModuleCard("Sınav Programı", Icons.quiz, Color(0xFFFFC107), () {})),
            SizedBox(width: Utils.normalPadding),
            Expanded(child: _buildModuleCard("Öğretmen Notu", Icons.note, Color(0xFFFF5722), () {})),
          ],
        ),
        SizedBox(height: Utils.normalPadding),

        // Page indicator
        _buildPageIndicator(),
      ],
    );
  }

  Widget _buildModuleCard(String title, IconData icon, Color color, VoidCallback onTap) {
    return CustomCard(
      onTap: onTap,
      backgroundColor: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Utils.normalRadius)),
      child: Container(
        height: Get.height * 0.12,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon Container
            Container(
              width: Utils.extraHighIconSize * 1.2,
              height: Utils.extraHighIconSize * 1.2,
              decoration: BoxDecoration(color: color.withOpacity(0.1), shape: BoxShape.circle),
              child: Icon(icon, color: color, size: Utils.normalIconSize),
            ),
            SizedBox(height: Utils.lowPadding),

            // Title
            CustomText.low(title, bold: true, centerText: true, textColor: ColorTable.getTextColor),
          ],
        ),
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Active indicator
        Container(
          width: Utils.normalRadius * 1.5,
          height: Utils.extraLowRadius,
          decoration: BoxDecoration(color: Get.theme.primaryColor, borderRadius: BorderRadius.circular(Utils.extraLowRadius)),
        ),
        SizedBox(width: Utils.extraLowPadding),

        // Inactive indicator
        Container(
          width: Utils.extraLowRadius,
          height: Utils.extraLowRadius,
          decoration: BoxDecoration(color: ColorTable.getTextColor.withOpacity(0.3), shape: BoxShape.circle),
        ),
      ],
    );
  }
}
