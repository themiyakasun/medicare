import 'package:flutter/material.dart';
import 'package:medicare/common/widgets/cards/address_card.dart';
import 'package:medicare/features/authentication/screen/book_appointment_info/widgets/appointment_type_button.dart';
import 'package:medicare/utils/constants/sizes.dart';

class TAppointmentTypeSelect extends StatefulWidget {
  const TAppointmentTypeSelect({super.key});

  @override
  State<TAppointmentTypeSelect> createState() => _TAppointmentTypeSelectState();
}

class _TAppointmentTypeSelectState extends State<TAppointmentTypeSelect> {
  String selectedType = 'online';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            TAppointmentTypeButton(
                label: 'Online',
                isSelected: selectedType == 'online',
                onTap: () => setState(() {
                      selectedType = 'online';
                    })),
            TAppointmentTypeButton(
                label: 'Physical',
                isSelected: selectedType == 'physical',
                onTap: () => setState(() {
                      selectedType = 'physical';
                    }))
          ],
        ),
        const SizedBox(
          height: TSizes.sm,
        ),
        selectedType == 'physical'
            ? SizedBox(
                width: double.infinity,
                child: TAddressCard(),
              )
            : const SizedBox.shrink()
      ],
    );
  }
}
