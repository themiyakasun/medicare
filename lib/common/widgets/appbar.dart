import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:medicare/utils/constants/colors.dart';
import 'package:medicare/utils/constants/sizes.dart';
import 'package:medicare/utils/device/device_utility.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TAppBar(
      {super.key,
      this.title,
      this.actions,
      this.leadingIcon,
      this.leadingOnPressed,
      this.showBackArrow = true});

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    final appBarHeight = TDeviceUtils.getAppBarHeight();

    return Padding(
        padding: EdgeInsets.all(TSizes.gridViewSpacing),
        child: AppBar(
          automaticallyImplyLeading: false,
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
          leading: showBackArrow
              ? IconButton(
                  onPressed: () => Get.back(),
                  icon: Container(
                    width: appBarHeight,
                    height: TSizes.xl,
                    decoration: BoxDecoration(color: TColors.orangeRange),
                    child: Icon(Icons.arrow_back),
                  ),
                  padding: EdgeInsets.zero,
                )
              : leadingIcon != null
                  ? IconButton(
                      onPressed: leadingOnPressed, icon: Icon(leadingIcon))
                  : null,
          title: title,
          actions: actions,
        ));
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
