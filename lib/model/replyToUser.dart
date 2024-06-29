import 'dart:convert';

ReplyToUserModel replyToUserModelFromJson(String str) => ReplyToUserModel.fromJson(json.decode(str));

String replyToUserModelToJson(ReplyToUserModel data) => json.encode(data.toJson());

class ReplyToUserModel {
  String? reply;

  ReplyToUserModel({
    this.reply
  });

  factory ReplyToUserModel.fromJson(Map<String, dynamic> json) => ReplyToUserModel(
    reply: json["reply"],
  );

  Map<String, dynamic> toJson() => {
    "reply" : reply,
  };
}

class UserConsultation {
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  int userId;
  int advisorId;
  String userMessage;
  String advisorReply;
  String topic;

  UserConsultation({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
    required this.advisorId,
    required this.userMessage,
    required this.advisorReply,
    required this.topic,
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
