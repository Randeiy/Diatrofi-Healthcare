import 'package:diatfori/common/constant.dart';
import 'package:diatfori/data/api/api_service.dart';
import 'package:diatfori/presentation/provider/detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../widget/expendable_text.dart';
import 'food_recipe_screen.dart';

class DetailScreen extends StatelessWidget {
  static const ROUTE_NAME = '/food-detail';
  String keyResep;
  DetailScreen({super.key, required this.keyResep});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>
          DetailProvider(apiService: ApiService(), keyResep: keyResep),
      child: Scaffold(
        body: Consumer<DetailProvider>(
          builder: (context, state, _) {
            if (state.state == ResultState.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.state == ResultState.hasData) {
              var resep = state.result.results;
              return NestedScrollView(
                headerSliverBuilder: (context, isScrolled) {
                  return [
                    SliverAppBar(
                      leading: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                          )),
                      actions: [
                        IconButton(
                            onPressed: () {
                              Navigator.popAndPushNamed(
                                  context, FoodRecipeScreen.ROUTE_NAME,
                                  arguments: keyResep);
                            },
                            icon: const FaIcon(
                              FontAwesomeIcons.fire,
                            )),
                      ],
                      elevation: 0,
                      shadowColor: Colors.transparent,
                      expandedHeight: 300,
                      flexibleSpace: FlexibleSpaceBar(
                        background:
                            Image.network(resep.thumb, fit: BoxFit.cover),
                      ),
                    ),
                  ];
                },
                body: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),

                      // Penulis
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            decoration:
                                BoxDecoration(color: kPink.withOpacity(.7)),
                            child: Text('Oleh : ${resep.author.user}'),
                          ),
                          Text(
                            resep.author.datePublished,
                            style: const TextStyle(color: Colors.black54),
                          )
                        ],
                      ),

                      // Nama item
                      Text(
                        resep.title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),

                      // tingkat kesulitan
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        decoration: const BoxDecoration(color: kSoftGreen),
                        child: Text(resep.difficulty),
                      ),

                      // waktu memasak
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        decoration: const BoxDecoration(color: kSoftGrey),
                        child: Text('Waktu memasak : ${resep.times}'),
                      ),

                      // deskripsi
                      ExpandableText(resep.desc)
                    ],
                  ),
                ),
              );
            } else if (state.state == ResultState.error) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return const Text('');
            }
          },
        ),
      ),
    );
  }

  InkWell customIconButton(icon, Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 20,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: kMatteBlack, borderRadius: BorderRadius.circular(10)),
        child: icon,
      ),
    );
  }
}
