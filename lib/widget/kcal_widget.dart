import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../common/constant.dart';

class KcalWidget extends StatelessWidget {
  num kcal;
  KcalWidget({super.key, required this.kcal});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const FaIcon(
          FontAwesomeIcons.fire,
          color: Colors.deepOrange,
          size: 20,
        ),
        const SizedBox(width: 5),
        Text(
          '$kcal kalori',
          style: kBodyText.copyWith(
              fontWeight: FontWeight.w600, color: kMatteBlack),
        )
      ],
    );
  }

}

