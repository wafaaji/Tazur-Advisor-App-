class Advisor {
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  String name;
  String email;
  String password;
  String topics;

  Advisor({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.name,
    required this.email,
    required this.password,
    required this.topics,
  });

  factory Advisor.fromJson(Map<String, dynamic> json) => Advisor(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    name: json["name"],
    email: json["email"],
    password: json["password"],
    topics: json["topics"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
    "name": name,
    "email": email,
    "password": password,
    "topics": topics,
  };
}