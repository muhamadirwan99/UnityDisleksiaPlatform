class WebinarsResult {
  WebinarsResult({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  List<Webinar> data;

  factory WebinarsResult.fromJson(Map<String, dynamic> json) => WebinarsResult(
        status: json["status"],
        message: json["message"],
        data: List<Webinar>.from(json["data"].map((x) => Webinar.fromJson(x))),
      );
}

class Webinar {
  Webinar({
    required this.name,
    required this.desc,
    required this.link,
    required this.date,
    required this.thumbnail,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
  });

  String name;
  String desc;
  String link;
  DateTime date;
  String thumbnail;
  DateTime createdAt;
  DateTime updatedAt;
  String id;

  factory Webinar.fromJson(Map<String, dynamic> json) => Webinar(
        name: json["name"],
        desc: json["desc"],
        link: json["link"],
        date: DateTime.parse(json["date"]),
        thumbnail: json["thumbnail"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "desc": desc,
        "link": link,
        "date": date.toIso8601String(),
        "thumbnail": thumbnail,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "id": id,
      };
}
