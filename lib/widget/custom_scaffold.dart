import 'package:diatfori/common/constant.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;

  const CustomScaffold({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          body,
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: kSoftGreen,
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(30))),
              margin: const EdgeInsets.all(0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.arrow_back_ios_rounded,
                    color: kMatteBlack,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Text(
                      'Diatrofi',
                      style: kSection.copyWith(color: kMatteBlack),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
