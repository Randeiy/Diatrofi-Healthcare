import 'package:flutter/material.dart';

import '../common/constant.dart';

class NutritionWidget extends StatelessWidget {
  String title;
  num? total;
  Color? color;
  double? size;
  NutritionWidget(
      {super.key, required this.title, this.total, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${total!.toStringAsFixed(2)} g',
            style: kBodyText.copyWith(
                fontWeight: FontWeight.bold, color: color, fontSize: size),
          ),
          Text(
            title,
            style: TextStyle(fontSize: size),
          ),
        ],
      ),
    );
  }
}
