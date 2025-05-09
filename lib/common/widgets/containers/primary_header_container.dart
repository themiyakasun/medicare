import 'package:flutter/material.dart';
import 'package:medicare/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:medicare/utils/constants/colors.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgesWidget(
      child: Container(
          color: TColors.dartPurpleNeutral,
          padding: const EdgeInsets.all(0),
          child: SizedBox(
            height: 250,
            child: Stack(
              children: [child],
            ),
          )),
    );
  }
}
