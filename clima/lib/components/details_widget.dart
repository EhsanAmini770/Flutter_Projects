import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';

class DetailsWidget extends StatelessWidget {
  final String title, value;

  const DetailsWidget({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(value, style: kDetailTextStyle),
            Visibility(
                visible: title == "WIND" ? true : false,
                child: Text(
                  ' km/hr',
                  style: kDetailSuffixStyle,
                ))
          ],
        ),
        Text(title, style: kDetailTitleTextStyle),
      ],
    );
  }
}
