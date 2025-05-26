import 'package:flutter/material.dart';
import 'package:medicare/common/widgets/cards/address_card.dart';
import 'package:medicare/features/authentication/screen/book_appointment_info/widgets/appointment_type_button.dart';
import 'package:medicare/utils/constants/sizes.dart';

class TAppointmentTypeSelect extends StatelessWidget {
  final String selectedType;
  final ValueChanged<String> onTypeChanged;

  const TAppointmentTypeSelect({
    super.key,
    required this.selectedType,
    required this.onTypeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            TAppointmentTypeButton(
              label: 'Online',
              isSelected: selectedType == 'online',
              onTap: () => onTypeChanged('online'),
            ),
            TAppointmentTypeButton(
              label: 'Physical',
              isSelected: selectedType == 'physical',
              onTap: () => onTypeChanged('physical'),
            )
          ],
        ),
        const SizedBox(height: TSizes.sm),
        selectedType == 'physical'
            ? SizedBox(width: double.infinity, child: TAddressCard())
            : const SizedBox.shrink()
      ],
    );
  }
}
