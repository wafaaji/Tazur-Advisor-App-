import 'dart:convert';

List<UserMessages> userMessagesFromJson(String str) => List<UserMessages>.from(json.decode(str).map((x) => UserMessages.fromJson(x)));

String userMessagesToJson(List<UserMessages> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserMessages {
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  int userId;
  int advisorId;
  String userMessage;
  String? advisorReply;
  String topic;

  UserMessages({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
    required this.advisorId,
    required this.userMessage,
    required this.advisorReply,
    required this.topic,
  });

  factory UserMessages.fromJson(Map<String, dynamic> json) => UserMessages(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    userId: json["user_id"],
    advisorId: json["advisor_id"],
    userMessage: json["user_message"],
    advisorReply: json["advisor_reply"],
    topic: json["topic"],
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
  };
}
