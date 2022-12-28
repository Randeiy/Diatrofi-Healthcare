import 'package:cached_network_image/cached_network_image.dart';
import 'package:diatfori/data/model/nutrisi.dart';
import 'package:diatfori/presentation/provider/nutrients_provider.dart';
import 'package:diatfori/widget/kcal_widget.dart';
import 'package:diatfori/widget/nutritions_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../common/constant.dart';

class ItemBagScreen extends StatelessWidget {
  static const ROUTE_NAME = '/item-bag';
  const ItemBagScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          // TOTAL
          Container(
            padding: const EdgeInsets.all(8),
            height: MediaQuery.of(context).size.height / 6,
            decoration: const BoxDecoration(
                color: kStrongGreen,
                borderRadius: BorderRadius.only(
                  // bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )),
            child: Consumer<NutrientProvider>(
              builder: (context, value, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'jumlah item ${value.totalItems.length} item',
                      style: kItemTittleCard.copyWith(
                          fontWeight: FontWeight.w500, color: kSoftGrey),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        height: 55,
                        child: Consumer<NutrientProvider>(
                          builder: (context, value, child) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const FaIcon(
                                      FontAwesomeIcons.fire,
                                      size: 22,
                                      color: Colors.redAccent,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(value.totalKalori.toString())
                                  ],
                                ),
                                SizedBox(
                                  height: 50,
                                  child: NutritionWidget(
                                    title: 'protein',
                                    total: value.totalProtein,
                                    color: kBrightGreen,
                                    size: 18,
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                  child: NutritionWidget(
                                    title: 'karbo',
                                    total: value.totalKarbo,
                                    color: Colors.orange[800],
                                    size: 18,
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                  child: NutritionWidget(
                                    title: 'lemak',
                                    total: value.totalLemak,
                                    color:
                                        const Color.fromARGB(255, 212, 132, 3),
                                    size: 18,
                                  ),
                                ),
                              ],
                            );
                          },
                        )),
                  ],
                );
              },
            ),
          ),

          // ITEM YANG DITAMBAHKAN
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Consumer<NutrientProvider>(
                builder: (context, value, _) {
                  if (value.totalItems.isNotEmpty) {
                    return ListView.builder(
                      itemCount: value.totalItems.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        var item = value.totalItems[index];
                        return _itemCal(item, index);
                      },
                    );
                  }
                  return const Center(
                    child: Text(
                      'kamu belum menambahkan apapun :(',
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _itemCal(Nutrient item, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: kSoftGreen),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // nama
          Text(
            '  ${item.name}',
            overflow: TextOverflow.ellipsis,
            style: kSection.copyWith(fontSize: 18),
          ),
          const SizedBox(
            height: 5,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 80,
                width: 80,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    imageUrl: item.pictureId,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  KcalWidget(kcal: item.kalori),
                  const SizedBox(
                    height: 5,
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
                    ),
                  )
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Consumer<NutrientProvider>(
                builder: (context, val, _) {
                  return Row(
                    children: [
                      InkWell(
                        child: const CircleAvatar(
                          radius: 20,
                          backgroundColor: kStrongGreen,
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {
                          // menambahkan item & menghitung ulang total
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
                        },
                      ),
                      const SizedBox(width: 8),
                      InkWell(
                        child: const CircleAvatar(
                          radius: 20,
                          backgroundColor: kStrongGreen,
                          child: Icon(
                            Icons.delete_forever_rounded,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {
                          // menghapus item & menghitung ulang total
                          val.delItem(index);
                          val.calculateKalori();
                        },
                      ),
                    ],
                  );
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
