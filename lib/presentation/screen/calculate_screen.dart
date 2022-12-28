import 'package:diatfori/common/constant.dart';
import 'package:diatfori/presentation/provider/nutrients_provider.dart';
import 'package:diatfori/presentation/screen/items_bag_screen.dart';
import 'package:diatfori/widget/calculate_food_item_widget.dart';
import 'package:diatfori/widget/sub_heading.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../widget/nutritions_widget.dart';

class CalculateScreen extends StatefulWidget {
  static const ROUTE_NAME = '/cal';
  const CalculateScreen({super.key});

  @override
  State<CalculateScreen> createState() => _CalculateScreenState();
}

class _CalculateScreenState extends State<CalculateScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Hitung Nutrisi'),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_rounded)),
        ),
        body: SizedBox(
          width: mediaQuery.width,
          height: mediaQuery.height,
          child: Stack(
            children: [
              // UKURAN BASE
              SizedBox(
                width: mediaQuery.width,
                height: mediaQuery.height / 1.3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 15,
                  ),
                  child: ListView(
                    children: [
                      // MAKANAN
                      SubHeading(
                        title: 'makanan',
                      ),
                      Container(
                          height: 120,
                          margin: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                          child: Consumer<NutrientProvider>(
                            builder: (context, state, _) {
                              if (state.state == ResultState.loading) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else if (state.state == ResultState.hasData) {
                                return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: 10,
                                  itemBuilder: (context, index) {
                                    var items = state.result.nutrients.where(
                                        (item) => item.kategori == "makanan");
                                    var itemFix = List.from(items)[index];
                                    return CalculateFoodItemWidget(
                                      item: itemFix,
                                    );
                                  },
                                );
                              } else if (state.state == ResultState.noData) {
                                return Center(
                                  child: Material(
                                    child: Text(state.message),
                                  ),
                                );
                              } else if (state.state == ResultState.error) {
                                return Center(
                                  child: Material(
                                    child: Text(state.message),
                                  ),
                                );
                              } else {
                                return const Center(
                                  child: Material(
                                    child: Text(''),
                                  ),
                                );
                              }
                            },
                          )),

                      // MINUMAN
                      SubHeading(
                        title: 'minuman',
                      ),
                      Container(
                          height: 120,
                          margin: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                          child: Consumer<NutrientProvider>(
                            builder: (context, state, _) {
                              if (state.state == ResultState.loading) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else if (state.state == ResultState.hasData) {
                                return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: 10,
                                  itemBuilder: (context, index) {
                                    var items = state.result.nutrients.where(
                                        (item) => item.kategori == "minuman");
                                    var itemFix = List.from(items)[index];
                                    return CalculateFoodItemWidget(
                                      item: itemFix,
                                    );
                                  },
                                );
                              } else if (state.state == ResultState.noData) {
                                return Center(
                                  child: Material(
                                    child: Text(state.message),
                                  ),
                                );
                              } else if (state.state == ResultState.error) {
                                return Center(
                                  child: Material(
                                    child: Text(state.message),
                                  ),
                                );
                              } else {
                                return const Center(
                                  child: Material(
                                    child: Text(''),
                                  ),
                                );
                              }
                            },
                          )),

                      // BUAH & SAYUR
                      SubHeading(
                        title: 'buah & sayur',
                      ),
                      Container(
                          height: 120,
                          margin: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                          child: Consumer<NutrientProvider>(
                            builder: (context, state, _) {
                              if (state.state == ResultState.loading) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else if (state.state == ResultState.hasData) {
                                return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: 10,
                                  itemBuilder: (context, index) {
                                    var items = state.result.nutrients.where(
                                        (item) => item.kategori == "tumbuhan");
                                    var itemFix = List.from(items)[index];
                                    return CalculateFoodItemWidget(
                                      item: itemFix,
                                    );
                                  },
                                );
                              } else if (state.state == ResultState.noData) {
                                return Center(
                                  child: Material(
                                    child: Text(state.message),
                                  ),
                                );
                              } else if (state.state == ResultState.error) {
                                return Center(
                                  child: Material(
                                    child: Text(state.message),
                                  ),
                                );
                              } else {
                                return const Center(
                                  child: Material(
                                    child: Text(''),
                                  ),
                                );
                              }
                            },
                          )),
                    ],
                  ),
                ),
              ),

              // TOTAL
              Positioned(
                bottom: 0,
                child: Container(
                  width: mediaQuery.width,
                  height: mediaQuery.height / 4,
                  padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: kStrongGreen,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        margin: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'jumlah item',
                              style: kItemTittleCard.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: kSoftGrey),
                            ),
                            const Spacer(),
                            SizedBox(
                                width: 90,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, ItemBagScreen.ROUTE_NAME);
                                  },
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 15,
                                        backgroundColor: kMatteBlack,
                                        child: Consumer<NutrientProvider>(
                                          builder: (context, value, child) {
                                            return Text(value.totalItems.length
                                                .toString());
                                          },
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text('item',
                                          style: kItemTittleCard.copyWith(
                                              fontWeight: FontWeight.w500,
                                              color: kSoftGrey)),
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          height: 70,
                          child: Consumer<NutrientProvider>(
                            builder: (context, value, child) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                      color: const Color.fromARGB(
                                          255, 212, 132, 3),
                                      size: 18,
                                    ),
                                  ),
                                ],
                              );
                            },
                          )),

                      // BERSIHKAN ITEM
                      Consumer<NutrientProvider>(
                        builder: (context, value, child) {
                          return TextButton(
                            child: const Text(
                              'bersihkan',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              value.clearItem();
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
