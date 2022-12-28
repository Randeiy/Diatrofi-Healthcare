import 'package:diatfori/data/api/api_service.dart';
import 'package:diatfori/presentation/provider/detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/constant.dart';

class FoodRecipeScreen extends StatelessWidget {
  static const ROUTE_NAME = '/food-recipe';
  String keyResep;
  FoodRecipeScreen({super.key, required this.keyResep});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
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

                      // ingredients
                      _sectionRecipe('bahan'),
                      Container(
                          margin: const EdgeInsets.only(left: 20),
                          constraints: const BoxConstraints(maxHeight: 50),
                          child: MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: resep.ingredient.length,
                                itemBuilder: (context, index) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 10,
                                        height: 10,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: kStrongGreen),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(child: Text(resep.ingredient[index]))
                                    ],
                                  );
                                }),
                          )),

                      // steps
                      _sectionRecipe('cara'),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                          margin: const EdgeInsets.only(left: 20),
                          height: mediaQuery.height,
                          child: MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: resep.step.length,
                                itemBuilder: (context, index) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        width: 10,
                                        height: 10,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: kStrongGreen),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                          child: Text(
                                        resep.step[index],
                                      ))
                                    ],
                                  );
                                }),
                          )),
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

  Container _sectionRecipe(String title) {
    return Container(
        constraints: const BoxConstraints(maxWidth: 120),
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
            color: Colors.pink[100], borderRadius: BorderRadius.circular(20)),
        child: Text(title));
  }
}
