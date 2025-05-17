import 'package:flutter/material.dart';
import 'package:medicare/common/widgets/appbar.dart';
import 'package:medicare/common/widgets/cards/book_appointment_card.dart';
import 'package:medicare/common/widgets/cards/payment_info_card.dart';
import 'package:medicare/features/authentication/screen/book_appointment_info/widgets/appointment_type_button.dart';
import 'package:medicare/features/authentication/screen/book_appointment_info/widgets/appointment_type_select.dart';
import 'package:medicare/utils/constants/sizes.dart';

class BookAppointmentInfoScreen extends StatelessWidget {
  const BookAppointmentInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: TSizes.lg,
            children: [
              TAppBar(
                title: Text('Back',
                    style: Theme.of(context).textTheme.titleMedium),
              ),

              //Main-Content
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: TSizes.gridViewSpacing),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: TSizes.lg,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: TSizes.xs,
                      children: [
                        Text(
                          'Booking Info',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .apply(fontWeightDelta: 700),
                        ),
                        TBookAppointmentCard(
                          showBooking: false,
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: TSizes.xs,
                      children: [
                        Text(
                          'Select Appointment Type',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .apply(fontWeightDelta: 700),
                        ),
                        Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.08),
                                  offset: Offset(0, 3),
                                  blurRadius: 11,
                                ),
                              ],
                            ),
                            padding: EdgeInsets.all(12),
                            child: TAppointmentTypeSelect()),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: TSizes.xs,
                      children: [
                        Text(
                          'Payment Info',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .apply(fontWeightDelta: 700),
                        ),
                        TPaymentInfoCard(label: 'Price', price: '\$100'),
                        TPaymentInfoCard(label: 'Tax', price: '\$0')
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: TSizes.xs,
                      children: [
                        Text(
                          'Total',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .apply(fontWeightDelta: 700),
                        ),
                        TPaymentInfoCard(label: 'Total Price', price: '\$100'),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(TSizes.gridViewSpacing),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Confirm & Pay \$100.00'),
            ),
          ),
        ));
  }
}
