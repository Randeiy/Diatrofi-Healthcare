// To parse this JSON data, do
//
//     final resepsearch = resepsearchFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Resepsearch resepsearchFromJson(String str) =>
    Resepsearch.fromJson(json.decode(str));

String resepsearchToJson(Resepsearch data) => json.encode(data.toJson());

class Resepsearch {
  Resepsearch({
    required this.method,
    required this.status,
    required this.results,
  });

  final String method;
  final bool status;
  final List<Result> results;

  factory Resepsearch.fromJson(Map<String, dynamic> json) => Resepsearch(
    method: json["method"],
    status: json["status"],
    results:List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    

  );

  Map<String, dynamic> toJson() => {
    "method": method,
    "status": status,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    required this.title,
    required this.thumb,
    required this.key,
    required this.times,
    required this.serving,
  });

  final String title;
  final String thumb;
  final String key;
  final String times;
  final String serving;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    title: json["title"],
    thumb: json["thumb"],
    key: json["key"],
    times: json["times"],
    serving: json["serving"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "thumb": thumb,
    "key": key,
    "times": times,
    "serving": serving,
  };
}

enum Difficulty { CUKUP_RUMIT, MUDAH, LEVEL_CHEF_PANJI }
