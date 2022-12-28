import 'dart:convert';

Nutrients nutrientsFromJson(String str) => Nutrients.fromJson(json.decode(str));

String nutrientsToJson(Nutrients data) => json.encode(data.toJson());

class Nutrients {
    Nutrients({
        required this.nutrients,
    });

    final List<Nutrient> nutrients;

    factory Nutrients.fromJson(Map<String, dynamic> json) => Nutrients(
        nutrients: List<Nutrient>.from(json["nutrients"].map((x) => Nutrient.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "nutrients": List<dynamic>.from(nutrients.map((x) => x.toJson())),
    };
}

class Nutrient {
    Nutrient({
        required this.id,
        required this.name,
        required this.kategori,
        required this.pictureId,
        required this.kalori,
        required this.lemak,
        required this.protein,
        required this.karbohidrat,
    });

    final String id;
    final String name;
    final String kategori;
    final String pictureId;
    final double kalori;
    final double lemak;
    final double protein;
    final double karbohidrat;

    factory Nutrient.fromJson(Map<String, dynamic> json) => Nutrient(
        id: json["id"],
        name: json["name"],
        kategori: json["kategori"],
        pictureId: json["pictureId"],
        kalori: json["Kalori"].toDouble(),
        lemak: json["Lemak"].toDouble(),
        protein: json["Protein"].toDouble(),
        karbohidrat: json["Karbohidrat"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "kategori": kategori,
        "pictureId": pictureId,
        "Kalori": kalori,
        "Lemak": lemak,
        "Protein": protein,
        "Karbohidrat": karbohidrat,
    };
}


