import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../common/constant.dart';
import '../data/model/article.dart';
import '../presentation/screen/article_web_view.dart';

class CardArticle extends StatelessWidget {
  final Article article;

  const CardArticle({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kBlueSoft,
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
                  child: CachedNetworkImage(
                    imageUrl: article.urlToImage!,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              title: Text(
                article.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(article.author!),
              onTap: () {
                Navigator.pushNamed(
                  context, ArticleWebView.routeName,
                    arguments: article.url);
              }
              ),
        ),
      ),
    );
  }

}

