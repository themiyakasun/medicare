import 'package:flutter/material.dart';
import 'package:medicare/common/widgets/appbar.dart';
import 'package:medicare/common/widgets/containers/search_container.dart';
import 'package:medicare/utils/constants/colors.dart';
import 'package:medicare/utils/constants/sizes.dart';
import 'package:medicare/utils/device/device_utility.dart';

class PatientSearchScreen extends StatelessWidget {
  const PatientSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TAppBar(
            title: Text('Find Doctor'),
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          SizedBox(
            height: 56, // or match TSearchContainer height
            child: Row(
              children: [
                Expanded(child: TSearchContainer()),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: TSizes.gridViewSpacing),
                  child: GestureDetector(
                    onTap: () {
                      // Your action here
                    },
                    child: Container(
                      width: 56,
                      height: 56, // match parent Container height
                      decoration: BoxDecoration(
                        color: TColors.coolOrange,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.filter_list,
                          size: 24,
                          color: TColors.neutralsWhite,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
