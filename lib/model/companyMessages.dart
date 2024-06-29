// To parse this JSON data, do
//
//     final companyMessages = companyMessagesFromJson(jsonString);

import 'dart:convert';

List<CompanyMessages> companyMessagesFromJson(String str) => List<CompanyMessages>.from(json.decode(str).map((x) => CompanyMessages.fromJson(x)));

String companyMessagesToJson(List<CompanyMessages> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CompanyMessages {
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  int advisorId;
  int companyId;
  String userMessage;
  String? advisorReply;
  String topic;

  CompanyMessages({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.advisorId,
    required this.companyId,
    required this.userMessage,
    required this.advisorReply,
    required this.topic,
  });

  factory CompanyMessages.fromJson(Map<String, dynamic> json) => CompanyMessages(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    advisorId: json["advisor_id"],
    companyId: json["company_id"],
    userMessage: json["user_message"],
    advisorReply: json["advisor_reply"],
    topic: json["topic"],
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
  };
}
