import 'package:flutter/material.dart';
import 'package:mobile/config/themes/app_colors.dart';

enum LeftBtnVariant { back, notification, menu }

enum RightBtnVariant { search, post, profile }

class Header extends StatelessWidget implements PreferredSizeWidget {
  final LeftBtnVariant? leftBtnVariant;
  final RightBtnVariant? rightBtnVariant;
  final VoidCallback? onPressLeftButton;
  final VoidCallback? onPressRightButton;
  final Widget? title;
  final String? subTitle;
  final bool isCentered;
  final double height;

  const Header({
    super.key,
    this.leftBtnVariant,
    this.rightBtnVariant,
    this.onPressLeftButton,
    this.onPressRightButton,
    this.title,
    this.subTitle,
    this.isCentered = true,
    this.height = 56.0,
  });

  @override
  Widget build(BuildContext context) {
    const Color backgroundColor = AppColors.white;
    const Color elementColor = AppColors.arsenic;

    Widget? buildLeftIcon() {
      if (leftBtnVariant == null) return null;
      IconData? iconData;
      switch (leftBtnVariant) {
        case LeftBtnVariant.back:
          iconData = Icons.arrow_back;
          break;
        case LeftBtnVariant.menu:
          iconData = Icons.menu;
          break;
        case LeftBtnVariant.notification:
          iconData = Icons.notifications;
          break;
        default:
          iconData = Icons.arrow_back;
      }
      return IconButton(
        icon: Icon(iconData, color: elementColor, size: 29),
        onPressed: onPressLeftButton,
      );
    }

    Widget? buildRightIcon() {
      if (rightBtnVariant == null) return null;
      IconData? iconData;
      switch (rightBtnVariant) {
        case RightBtnVariant.search:
          iconData = Icons.search;
          break;
        case RightBtnVariant.profile:
          iconData = Icons.person;
          break;
        default:
          iconData = Icons.search;
      }
      return IconButton(
        icon: Icon(iconData, color: elementColor, size: 29),
        onPressed: onPressRightButton,
      );
    }

    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 4,
      centerTitle: isCentered,
      title: title is String
          ? Text(
              title as String,
              style: const TextStyle(
                color: elementColor,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            )
          : title,
      leading: buildLeftIcon(),
      actions: [buildRightIcon() ?? Container()],
      toolbarHeight: height,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
