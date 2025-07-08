import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/variables/colors.dart';

import '../../../../../core/utils/utils.dart';

class DefaultAppBar extends StatelessWidget {
  ///App bar title
  final Widget? title;
  final double? titleSpacing;

  ///Geri butonunu gösterir veya gizler
  final bool showLeadingBackIcon;

  ///Title widgetını ortalar
  final bool centerTitle;

  final Widget? leadingIcon;

  ///App barın sağında listelenecek olan widgetlar
  final List<Widget>? actions;

  final Function()? onLeadingPressed;
  final double? leadingWidth;

  final double? elevation;

  const DefaultAppBar({
    Key? key,
    this.title,
    this.showLeadingBackIcon = true,
    this.leadingIcon,
    this.actions,
    this.onLeadingPressed,
    this.centerTitle = true,
    this.leadingWidth,
    this.titleSpacing,
    this.elevation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: titleSpacing,
      backgroundColor: Colors.white,
      elevation: elevation ?? 0,
      toolbarHeight: Utils.appBarHeight,
      centerTitle: centerTitle,
      leadingWidth: showLeadingBackIcon ? leadingWidth ?? Get.width * 0.17 : 0,
      automaticallyImplyLeading: showLeadingBackIcon,
      leading: showLeadingBackIcon
          ? onLeadingPressed == null
              ? null
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(width: Utils.lowPadding),
                    InkWell(
                      onTap: onLeadingPressed ?? () {},
                      child: CircleAvatar(
                        radius: Utils.normalIconSize,
                        backgroundColor: ColorTable.getTextColor.withOpacity(0.03),
                        child: Icon(Icons.arrow_back_ios_new_rounded, color: ColorTable.getTextColor, size: Utils.normalIconSize),
                      ),
                    ),
                  ],
                )
          : null,
      title: SizedBox(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: centerTitle ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            if (!showLeadingBackIcon && (actions ?? []).isNotEmpty) SizedBox(width: Utils.extraHighIconSize * 1.4),
            if (leadingIcon != null) leadingIcon!,
            Padding(
              padding: leadingIcon != null ? EdgeInsets.symmetric(horizontal: Utils.normalPadding) : EdgeInsets.zero,
              child: title,
            ),
          ],
        ),
      ),
      actions: (actions != null && (actions ?? []).isNotEmpty)
          ? [
              Padding(
                padding: EdgeInsets.only(right: Utils.lowIconSize),
                child: Wrap(runAlignment: WrapAlignment.center, direction: Axis.horizontal, children: actions!),
              )
            ]
          : [SizedBox(width: showLeadingBackIcon ? Utils.extraHighIconSize * 1.4 : Utils.normalIconSize)],
    );
  }
}
