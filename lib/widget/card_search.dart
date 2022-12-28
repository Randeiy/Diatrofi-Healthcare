import 'package:diatfori/common/constant.dart';
import 'package:diatfori/data/model/resep_search.dart';
import 'package:diatfori/presentation/screen/item_detail_screen.dart';
import 'package:flutter/material.dart';

class CardSearch extends StatelessWidget {
  final Result resep;

  const CardSearch({Key? key, required this.resep}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: kYellowSoft,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: SizedBox(
          height: 80,
          child: Center(
            child: ListTile(
                leading: SizedBox(
                  height: 100,
                  width: 100,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Container(
                        padding: const EdgeInsets.all(5.0),
                        child: Image.network(
                            resep.thumb)),
                  ),
                ),
                title: Text(
                  resep.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () {Navigator.pushNamed(context, DetailScreen.ROUTE_NAME,
                    arguments: resep.key);}
            ),
          ),
        ),
      );
    
  }
}

Row iconWithText(BuildContext context, {IconData? icon, required String text}) {
  return Row(
    children: [
      Icon(
        icon,
        size: 15,
        color: Colors.black,
      ),
      Text(
        text,
        style:
        Theme.of(context).textTheme.caption?.copyWith(color: Colors.black),
      ),
    ],
  );

}

