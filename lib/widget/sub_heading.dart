import 'package:flutter/material.dart';

import '../common/constant.dart';

class SubHeading extends StatelessWidget {
  String title;
  SubHeading({super.key, required this.title, });

  @override
  Widget build(BuildContext context) {
    
    return Text(
          title,
          style: kSection,
        );
  }

  }

