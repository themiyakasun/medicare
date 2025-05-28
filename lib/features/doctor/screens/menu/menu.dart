import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicare/common/widgets/appbar.dart';
import 'package:medicare/common/widgets/list_styles/menu_tile.dart';
import 'package:medicare/data/repositories/authentication/authentication_repository.dart';
import 'package:medicare/features/personalization/controllers/user_controller.dart';
import 'package:medicare/features/personalization/screens/account_settings/account_settings.dart';
import 'package:medicare/features/personalization/screens/change_password/change_password.dart';
import 'package:medicare/features/personalization/screens/video_call/video_call.dart';
import 'package:medicare/features/personalization/screens/wallet/wallet.dart';
import 'package:medicare/utils/constants/colors.dart';
import 'package:medicare/utils/constants/sizes.dart';
import 'package:medicare/utils/helpers/helper_functions.dart';
import 'package:medicare/utils/theme/custom_themes/image_strings.dart';

class doctorMenuScreen extends StatelessWidget {
  const doctorMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    final repository = Get.put(AuthenticationRepository());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TAppBar(
              title: Text('Menu'),
              showBackArrow: false,
            ),
            ListTile(
                leading: Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  clipBehavior: Clip.hardEdge,
                  child: Obx(
                    () => controller.user.value.profilePicture.isEmpty
                        ? Image.asset(
                            TImages.userImg,
                            fit: BoxFit.cover,
                            width: 64,
                            height: 64,
                          )
                        : Image.network(
                            controller.user.value.profilePicture,
                            fit: BoxFit.cover,
                            width: 64,
                            height: 64,
                            errorBuilder: (context, error, stackTrace) =>
                                Image.asset(
                              TImages.userImg,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ),
                title: Obx(
                  () => Text(
                    THelperFunctions.capitalize(controller.user.value.name),
                    style: Theme.of(context).textTheme.titleMedium!.apply(
                        color: TColors.neutralsDark, fontWeightDelta: 600),
                  ),
                )),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            //Menu Items
            Column(
              children: [
                TMenuTile(
                  icon: Icons.wallet_outlined,
                  title: 'Wallet',
                  onPressed: () => Get.to(() => WalletScreen()),
                ),
                TMenuTile(
                  icon: Icons.settings,
                  title: 'Account Settings',
                  onPressed: () => Get.to(() => AccountSettingsScreen()),
                ),
                TMenuTile(
                    icon: Icons.lock,
                    title: 'Change Password',
                    onPressed: () => Get.to(() => ChangePasswordScreen())),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                TMenuTile(
                    icon: Icons.file_copy,
                    title: 'Terms & Conditions',
                    onPressed: () => {}),
                TMenuTile(
                    icon: Icons.video_call,
                    title: 'Video Call',
                    onPressed: () => Get.to(() => VideoCallScreen())),
                TMenuTile(
                    icon: Icons.newspaper,
                    title: 'News & Blogs',
                    onPressed: () => {}),
                TMenuTile(
                    icon: Icons.support_agent,
                    title: 'Support',
                    onPressed: () => {}),
                Padding(
                  padding: EdgeInsets.all(TSizes.gridViewSpacing),
                  child: SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () => repository.logout(),
                        child: Text('Logout')),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
