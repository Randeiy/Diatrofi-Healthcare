import 'dart:convert';

Reseplist reseplistFromJson(String str) => Reseplist.fromJson(json.decode(str));

String reseplistToJson(Reseplist data) => json.encode(data.toJson());

class Reseplist {
  Reseplist({
    required this.method,
    required this.status,
    required this.results,
  });

  final String method;
  final bool status;
  final List<ResultResep> results;

  factory Reseplist.fromJson(Map<String, dynamic> json) => Reseplist(
    method: json["method"],
    status: json["status"],
    results: List<ResultResep>.from(json["results"].map((x) => ResultResep.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "method": method,
    "status": status,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class ResultResep {
  ResultResep({
    required this.title,
    required this.thumb,
    required this.key,
    required this.times,
  });

  final String title;
  final String thumb;
  final String key;
  final String times;


  factory ResultResep.fromJson(Map<String, dynamic> json) => ResultResep(
    title: json["title"],
    thumb: json["thumb"],
    key: json["key"],
    times: json["times"],

  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "thumb": thumb,
    "key": key,
    "times": times,

  };
}

enum Difficulty { MUDAH, CUKUP_RUMIT }