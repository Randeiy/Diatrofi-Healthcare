import 'package:cached_network_image/cached_network_image.dart';
import 'package:diatfori/data/model/food.dart';
import 'package:diatfori/presentation/screen/item_detail_screen.dart';
import 'package:diatfori/widget/kcal_widget.dart';
import 'package:flutter/material.dart';

import '../common/constant.dart';

class FoodItemWidget extends StatelessWidget {
  Food food;

  FoodItemWidget(
      {super.key,
      required this.food});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: kSoftGreen,
          ),
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: CachedNetworkImage(
                    imageUrl: food.imgUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 2, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // kcal
                    KcalWidget(kcal: food.kcal),
      
                    // title
                    Text(
                      food.name,
                      style: kItemTittleCard,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      food.description,
                      style: kBodyText,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    )
                  ],
                ),
              ))
            ],
          ),
        ),

        onTap: (){
          Navigator.pushNamed(context, DetailScreen.ROUTE_NAME, arguments: food);
        },
      ),
      
    );
  }

}

