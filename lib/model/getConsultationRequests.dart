import 'dart:convert';

GetConsultationRequests getConsultationRequestsFromJson(String str) => GetConsultationRequests.fromJson(json.decode(str));

String getConsultationRequestsToJson(GetConsultationRequests data) => json.encode(data.toJson());

class GetConsultationRequests {
  List<UserConsultation> userConsultation;
  List<CompanyConsultation> companyConsultation;

  GetConsultationRequests({
    required this.userConsultation,
    required this.companyConsultation,
  });

  factory GetConsultationRequests.fromJson(Map<String, dynamic> json) => GetConsultationRequests(
    userConsultation: List<UserConsultation>.from(json["user_consultation"].map((x) => UserConsultation.fromJson(x))),
    companyConsultation: List<CompanyConsultation>.from(json["company_consultation"].map((x) => CompanyConsultation.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "user_consultation": List<dynamic>.from(userConsultation.map((x) => x.toJson())),
    "company_consultation": List<dynamic>.from(companyConsultation.map((x) => x.toJson())),
  };
}

class CompanyConsultation {
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  int advisorId;
  int companyId;
  String userMessage;
  dynamic advisorReply;
  String topic;
  Company company;

  CompanyConsultation({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.advisorId,
    required this.companyId,
    required this.userMessage,
    required this.advisorReply,
    required this.topic,
    required this.company,
  });

  factory CompanyConsultation.fromJson(Map<String, dynamic> json) => CompanyConsultation(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    advisorId: json["advisor_id"],
    companyId: json["company_id"],
    userMessage: json["user_message"],
    advisorReply: json["advisor_reply"],
    topic: json["topic"],
    company: Company.fromJson(json["company"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
    "advisor_id": advisorId,
    "company_id": companyId,
    "user_message": userMessage,
    "advisor_reply": advisorReply,
    "topic": topic,
    "company": company.toJson(),
  };
}

class Company {
  int id;
  String name;
  String logo;
  String email;

  Company({
    required this.id,
    required this.name,
    required this.logo,
    required this.email,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    id: json["id"],
    name: json["name"],
    logo: json["logo"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "logo": logo,
    "email": email,
  };
}

class UserConsultation {
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  int userId;
  int advisorId;
  String userMessage;
  dynamic advisorReply;
  String topic;
  User user;

  UserConsultation({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
    required this.advisorId,
    required this.userMessage,
    required this.advisorReply,
    required this.topic,
    required this.user,
  });

  factory UserConsultation.fromJson(Map<String, dynamic> json) => UserConsultation(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    userId: json["user_id"],
    advisorId: json["advisor_id"],
    userMessage: json["user_message"],
    advisorReply: json["advisor_reply"],
    topic: json["topic"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "user_id": userId,
    "advisor_id": advisorId,
    "user_message": userMessage,
    "advisor_reply": advisorReply,
    "topic": topic,
    "user": user.toJson(),
  };
}

class User {
  int id;
  String firstName;
  String lastName;
  String email;
  UserCv userCv;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.userCv,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    userCv: UserCv.fromJson(json["user_cv"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "user_cv": userCv.toJson(),
  };
}

class UserCv {
  int userId;
  String image;

  UserCv({
    required this.userId,
    required this.image,
  });

  factory UserCv.fromJson(Map<String, dynamic> json) => UserCv(
    userId: json["user_id"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "image": image,
  };
}
