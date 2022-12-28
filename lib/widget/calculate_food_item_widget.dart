import 'package:cached_network_image/cached_network_image.dart';
import 'package:diatfori/data/model/nutrisi.dart';
import 'package:diatfori/presentation/provider/nutrients_provider.dart';
import 'package:diatfori/widget/nutritions_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/constant.dart';
import 'kcal_widget.dart';

class CalculateFoodItemWidget extends StatelessWidget {
  Nutrient item;

  CalculateFoodItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: kSoftGreen, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // foto
          Container(
            margin: const EdgeInsets.all(10),
            height: 100,
            width: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: item.pictureId,
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),

          // segmen 2
          SizedBox(
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 160,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          KcalWidget(kcal: item.kalori),
                          const SizedBox(height: 5),
                          Text(
                            item.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: kItemTittleCard,
                          )
                        ],
                      ),
                      Consumer<NutrientProvider>(
                        builder: (context, val, _) {
                          return InkWell(
                            child: const CircleAvatar(
                              radius: 20,
                              backgroundColor: kStrongGreen,
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                            onTap: () {
                              val.addItem(
                                  item.id,
                                  item.name,
                                  item.kategori,
                                  item.pictureId,
                                  item.kalori,
                                  item.lemak,
                                  item.protein,
                                  item.karbohidrat);
                              val.calculateKalori();
                              print("total ${val.totalItems}");
                            },
                          );
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 160,
                  child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          NutritionWidget(
                            title: 'protein',
                            total: item.protein,
                            color: kBrightGreen,
                          ),
                          NutritionWidget(
                            title: 'karbo',
                            total: item.karbohidrat,
                            color: kCarbs,
                          ),
                          NutritionWidget(
                            title: 'lemak',
                            total: item.lemak,
                            color: kFats,
                          ),
                        ],
                      )
                    
                  ),
                
              ],
            ),
          )
        ],
      ),
    );
  }

}

