import 'package:cached_network_image/cached_network_image.dart';
import 'package:diatfori/data/model/resep_list.dart';
import 'package:diatfori/presentation/provider/database_provider.dart';
import 'package:diatfori/presentation/screen/item_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/constant.dart';

class ResepCard extends StatelessWidget {
  final ResultResep resep;

  const ResepCard({Key? key, required this.resep}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (context, provider, child) {
        return FutureBuilder<bool>(
          future: provider.isFavorited(resep.key),
          builder: (context, snapshot) {
            var isBookmarked = snapshot.data ?? false;
            return Card(
              color: kYellowSoft,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: SizedBox(
                height: 80,
                child: Center(
                  child: ListTile(
                      leading: SizedBox(
                        height: 100,
                        width: 100,
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          child: CachedNetworkImage(
                            imageUrl: resep.thumb,
                            fit: BoxFit.contain,
                            placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                      title: Text(
                        resep.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(resep.times),
                      trailing: isBookmarked
                          ? IconButton(
                        icon: const Icon(Icons.favorite, color: Colors.red,),
                        onPressed: () => provider.removeFavorite(resep.key),
                      )
                          : IconButton(
                        icon: const Icon(Icons.favorite_border, color: Colors.red,),
                        onPressed: () => provider.addFavorite(resep),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, DetailScreen.ROUTE_NAME,
                            arguments: resep.key);
                      }),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
