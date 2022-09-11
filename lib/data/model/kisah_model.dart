class KisahResult {
  KisahResult({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  List<Kisah> data;

  factory KisahResult.fromJson(Map<String, dynamic> json) => KisahResult(
        status: json["status"],
        message: json["message"],
        data: List<Kisah>.from(json["data"].map((x) => Kisah.fromJson(x))),
      );
}

class Kisah {
  Kisah({
    required this.name,
    required this.sumber,
    required this.link,
    required this.thumbnail,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
  });

  String name;
  String sumber;
  String link;
  String thumbnail;
  DateTime createdAt;
  DateTime updatedAt;
  String id;

  factory Kisah.fromJson(Map<String, dynamic> json) => Kisah(
        name: json["name"],
        sumber: json["sumber"],
        link: json["link"],
        thumbnail: json["thumbnail"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        id: json["id"],
      );
}
