import 'package:flutter/material.dart';
import 'package:medicare/common/widgets/custom_shapes/curved_edges/curved_edges.dart';

class TCurvedEdgesWidget extends StatelessWidget {
  const TCurvedEdgesWidget({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: TCustomCurveEdges(), child: child);
  }
}
