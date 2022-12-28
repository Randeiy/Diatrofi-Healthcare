import 'dart:convert';

ResepDetail resepdetailFromJson(String str) => ResepDetail.fromJson(json.decode(str));

String resepdetailToJson(ResepDetail data) => json.encode(data.toJson());

class ResepDetail {
  ResepDetail({
    required this.method,
    required this.status,
    required this.results,
  });

  final String method;
  final bool status;
  final ResultDetailResep results;

  factory ResepDetail.fromJson(Map<String, dynamic> json) => ResepDetail(
    method: json["method"],
    status: json["status"],
    results: ResultDetailResep.fromJson(json["results"]),
  );

  Map<String, dynamic> toJson() => {
    "method": method,
    "status": status,
    "results": results.toJson(),
  };
}

class ResultDetailResep {
  ResultDetailResep({
    required this.title,
    required this.thumb,
    required this.servings,
    required this.times,
    required this.difficulty,
    required this.author,
    required this.desc,
    required this.needItem,
    required this.ingredient,
    required this.step,
  });

  final String title;
  final String thumb;
  final String servings;
  final String times;
  final String difficulty;
  final Author author;
  final String desc;
  final List<NeedItem> needItem;
  final List<String> ingredient;
  final List<String> step;

  factory ResultDetailResep.fromJson(Map<String, dynamic> json) => ResultDetailResep(
    title: json["title"],
    thumb: json["thumb"],
    servings: json["servings"],
    times: json["times"],
    difficulty: json["difficulty"],
    author: Author.fromJson(json["author"]),
    desc: json["desc"],
    needItem: List<NeedItem>.from(json["needItem"].map((x) => NeedItem.fromJson(x))),
    ingredient: List<String>.from(json["ingredient"].map((x) => x)),
    step: List<String>.from(json["step"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "thumb": thumb,
    "servings": servings,
    "times": times,
    "difficulty": difficulty,
    "author": author.toJson(),
    "desc": desc,
    "needItem": List<dynamic>.from(needItem.map((x) => x.toJson())),
    "ingredient": List<dynamic>.from(ingredient.map((x) => x)),
    "step": List<dynamic>.from(step.map((x) => x)),
  };
}

class Author {
  Author({
    required this.user,
    required this.datePublished,
  });

  final String user;
  final String datePublished;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
    user: json["user"],
    datePublished: json["datePublished"],
  );

  Map<String, dynamic> toJson() => {
    "user": user,
    "datePublished": datePublished,
  };
}

class NeedItem {
  NeedItem({
    required this.itemName,
    required this.thumbItem,
  });

  final String itemName;
  final String thumbItem;

  factory NeedItem.fromJson(Map<String, dynamic> json) => NeedItem(
    itemName: json["item_name"],
    thumbItem: json["thumb_item"],
  );

  Map<String, dynamic> toJson() => {
    "item_name": itemName,
    "thumb_item": thumbItem,
  };
}
