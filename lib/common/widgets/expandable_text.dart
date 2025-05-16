import 'package:flutter/material.dart';
import 'package:medicare/utils/constants/colors.dart';

class TExpandableText extends StatefulWidget {
  final String text;

  const TExpandableText(this.text, {super.key});

  @override
  State<TExpandableText> createState() => _TExpandableTextState();
}

class _TExpandableTextState extends State<TExpandableText> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context)
        .textTheme
        .titleSmall!
        .apply(color: TColors.neutralsGray2);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          maxLines: _expanded ? null : 3,
          overflow: _expanded ? TextOverflow.visible : TextOverflow.ellipsis,
          style: textStyle,
        ),
        const SizedBox(height: 4),
        GestureDetector(
          onTap: () => setState(() => _expanded = !_expanded),
          child: Text(
            _expanded ? 'Show less' : '... More',
            style: textStyle.copyWith(
              color: TColors.coolOrange,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }
}
