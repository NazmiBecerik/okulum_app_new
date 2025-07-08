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
        // PageView for modules
        SizedBox(
          height: Get.height * 0.5, // 3 sıra + spacing için yeterli yükseklik
          child: PageView(
            controller: controller.pageController,
            onPageChanged: controller.onPageChanged,
            children: [
              // First page - İlk 9 modül
              _buildModulesPage([
                {"title": "Haberler", "icon": Icons.newspaper, "color": Color(0xFF6B73FF)},
                {"title": "Duyurular", "icon": Icons.campaign, "color": Color(0xFFFF9800)},
                {"title": "Dökümanlar", "icon": Icons.description, "color": Color(0xFF4CAF50)},
                {"title": "QR", "icon": Icons.qr_code, "color": Color(0xFF9C27B0)},
                {"title": "Randevu Al", "icon": Icons.access_time, "color": Color(0xFF00BCD4)},
                {"title": "E-Yoklama", "icon": Icons.checklist, "color": Color(0xFF607D8B)},
                {"title": "Ders Programı", "icon": Icons.schedule, "color": Color(0xFFE91E63)},
                {"title": "Sınav Programı", "icon": Icons.quiz, "color": Color(0xFFFFC107)},
                {"title": "Öğretmen Notu", "icon": Icons.note, "color": Color(0xFFFF5722)},
              ]),

              // Second page - İkinci sayfa modülleri
              _buildModulesPage([
                {"title": "Karne", "icon": Icons.assessment, "color": Color(0xFF795548)},
                {"title": "Devamsızlık", "icon": Icons.event_busy, "color": Color(0xFF3F51B5)},
                {"title": "Ödevler", "icon": Icons.assignment, "color": Color(0xFF009688)},
                {"title": "Sınavlar", "icon": Icons.school, "color": Color(0xFFCDDC39)},
                {"title": "Etkinlikler", "icon": Icons.event, "color": Color(0xFFFF9E80)},
                {"title": "Kantin", "icon": Icons.restaurant, "color": Color(0xFF8BC34A)},
                {"title": "Kütüphane", "icon": Icons.local_library, "color": Color(0xFF673AB7)},
                {"title": "Spor", "icon": Icons.sports_soccer, "color": Color(0xFF2196F3)},
                {"title": "Müzik", "icon": Icons.music_note, "color": Color(0xFFE91E63)},
              ]),

              // Third page - Üçüncü sayfa modülleri
              _buildModulesPage([
                {"title": "Rehberlik", "icon": Icons.psychology, "color": Color(0xFF4CAF50)},
                {"title": "Sosyal Kulüp", "icon": Icons.groups, "color": Color(0xFFFF5722)},
                {"title": "Projeler", "icon": Icons.lightbulb, "color": Color(0xFFFFC107)},
                {"title": "Yarışmalar", "icon": Icons.emoji_events, "color": Color(0xFF9C27B0)},
                {"title": "Mezunlar", "icon": Icons.school, "color": Color(0xFF607D8B)},
                {"title": "İletişim", "icon": Icons.contact_mail, "color": Color(0xFF00BCD4)},
              ]),
            ],
          ),
        ),

        SizedBox(height: Utils.normalPadding),

        // Dynamic page indicator
        Obx(() => _buildPageIndicator()),
      ],
    );
  }

  Widget _buildModulesPage(List<Map<String, dynamic>> modules) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Utils.normalPadding),
      child: Column(
        children: [
          // First row - 3 items
          if (modules.length > 0)
            Row(
              children: [
                if (modules.length > 0) Expanded(child: _buildModuleCard(modules[0]["title"], modules[0]["icon"], modules[0]["color"], () {})),
                if (modules.length > 1) ...[
                  SizedBox(width: Utils.normalPadding),
                  Expanded(child: _buildModuleCard(modules[1]["title"], modules[1]["icon"], modules[1]["color"], () {})),
                ],
                if (modules.length > 2) ...[
                  SizedBox(width: Utils.normalPadding),
                  Expanded(child: _buildModuleCard(modules[2]["title"], modules[2]["icon"], modules[2]["color"], () {})),
                ],
              ],
            ),

          if (modules.length > 3) SizedBox(height: Utils.normalPadding),

          // Second row - 3 items
          if (modules.length > 3)
            Row(
              children: [
                if (modules.length > 3) Expanded(child: _buildModuleCard(modules[3]["title"], modules[3]["icon"], modules[3]["color"], () {})),
                if (modules.length > 4) ...[
                  SizedBox(width: Utils.normalPadding),
                  Expanded(child: _buildModuleCard(modules[4]["title"], modules[4]["icon"], modules[4]["color"], () {})),
                ],
                if (modules.length > 5) ...[
                  SizedBox(width: Utils.normalPadding),
                  Expanded(child: _buildModuleCard(modules[5]["title"], modules[5]["icon"], modules[5]["color"], () {})),
                ],
              ],
            ),

          if (modules.length > 6) SizedBox(height: Utils.normalPadding),

          // Third row - 3 items
          if (modules.length > 6)
            Row(
              children: [
                if (modules.length > 6) Expanded(child: _buildModuleCard(modules[6]["title"], modules[6]["icon"], modules[6]["color"], () {})),
                if (modules.length > 7) ...[
                  SizedBox(width: Utils.normalPadding),
                  Expanded(child: _buildModuleCard(modules[7]["title"], modules[7]["icon"], modules[7]["color"], () {})),
                ],
                if (modules.length > 8) ...[
                  SizedBox(width: Utils.normalPadding),
                  Expanded(child: _buildModuleCard(modules[8]["title"], modules[8]["icon"], modules[8]["color"], () {})),
                ],
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildModuleCard(String title, IconData icon, Color color, VoidCallback onTap) {
    return Container(
      // Glow effect container
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Utils.normalRadius),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.15),
            blurRadius: Utils.normalRadius,
            spreadRadius: Utils.extraLowPadding,
            offset: Offset(0, Utils.extraLowPadding),
          ),
        ],
      ),
      child: CustomCard(
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
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        bool isActive = controller.currentPageIndex == index;
        return Container(
          margin: EdgeInsets.symmetric(horizontal: Utils.extraLowPadding / 2),
          width: isActive ? Utils.normalRadius * 1.5 : Utils.extraLowRadius,
          height: Utils.extraLowRadius,
          decoration: BoxDecoration(
            color: isActive ? Get.theme.primaryColor : ColorTable.getTextColor.withOpacity(0.3),
            borderRadius: BorderRadius.circular(Utils.extraLowRadius),
          ),
        );
      }),
    );
  }
}
