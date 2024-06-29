// To parse this JSON data, do
//
//     final userProfile = userProfileFromJson(jsonString);

import 'dart:convert';

UserProfile userProfileFromJson(String str) => UserProfile.fromJson(json.decode(str));

String userProfileToJson(UserProfile data) => json.encode(data.toJson());

class UserProfile {
  int id;
  String email;
  DateTime emailVerifiedAt;
  String firstName;
  String lastName;
  String phone;
  String governorate;
  String address;
  String gender;
  String maritalStatus;
  DateTime birthday;
  String nationality;
  String experienceYears;
  String education;
  List<String> topic;
  int drivingLicense;
  String militaryStatus;
  String status;
  int completeState;
  DateTime createdAt;
  DateTime updatedAt;
  UserCv userCv;
  List<Experience> experiences;
  List<CvCourse> cvCourses;
  List<Reference> references;
  List<Link> links;

  UserProfile({
    required this.id,
    required this.email,
    required this.emailVerifiedAt,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.governorate,
    required this.address,
    required this.gender,
    required this.maritalStatus,
    required this.birthday,
    required this.nationality,
    required this.experienceYears,
    required this.education,
    required this.topic,
    required this.drivingLicense,
    required this.militaryStatus,
    required this.status,
    required this.completeState,
    required this.createdAt,
    required this.updatedAt,
    required this.userCv,
    required this.experiences,
    required this.cvCourses,
    required this.references,
    required this.links,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
    id: json["id"],
    email: json["email"],
    emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
    firstName: json["first_name"],
    lastName: json["last_name"],
    phone: json["phone"],
    governorate: json["governorate"],
    address: json["address"],
    gender: json["gender"],
    maritalStatus: json["marital_status"],
    birthday: DateTime.parse(json["birthday"]),
    nationality: json["nationality"],
    experienceYears: json["experience_years"],
    education: json["education"],
    topic: List<String>.from(json["topic"].map((x) => x)),
    drivingLicense: json["driving_license"],
    militaryStatus: json["military_status"],
    status: json["status"],
    completeState: json["complete_state"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    userCv: UserCv.fromJson(json["user_cv"]),
    experiences: List<Experience>.from(json["experiences"].map((x) => Experience.fromJson(x))),
    cvCourses: List<CvCourse>.from(json["cv_courses"].map((x) => CvCourse.fromJson(x))),
    references: List<Reference>.from(json["references"].map((x) => Reference.fromJson(x))),
    links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "email_verified_at": emailVerifiedAt.toIso8601String(),
    "first_name": firstName,
    "last_name": lastName,
    "phone": phone,
    "governorate": governorate,
    "address": address,
    "gender": gender,
    "marital_status": maritalStatus,
    "birthday": "${birthday.year.toString().padLeft(4, '0')}-${birthday.month.toString().padLeft(2, '0')}-${birthday.day.toString().padLeft(2, '0')}",
    "nationality": nationality,
    "experience_years": experienceYears,
    "education": education,
    "topic": List<dynamic>.from(topic.map((x) => x)),
    "driving_license": drivingLicense,
    "military_status": militaryStatus,
    "status": status,
    "complete_state": completeState,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "user_cv": userCv.toJson(),
    "experiences": List<dynamic>.from(experiences.map((x) => x.toJson())),
    "cv_courses": List<dynamic>.from(cvCourses.map((x) => x.toJson())),
    "references": List<dynamic>.from(references.map((x) => x.toJson())),
    "links": List<dynamic>.from(links.map((x) => x.toJson())),
  };
}

class CvCourse {
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String name;
  String source;
  String duration;
  int userId;
  String image;
  String details;

  CvCourse({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.source,
    required this.duration,
    required this.userId,
    required this.image,
    required this.details,
  });

  factory CvCourse.fromJson(Map<String, dynamic> json) => CvCourse(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    name: json["name"],
    source: json["source"],
    duration: json["duration"],
    userId: json["user_id"],
    image: json["image"],
    details: json["details"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "name": name,
    "source": source,
    "duration": duration,
    "user_id": userId,
    "image": image,
    "details": details,
  };
}

class Experience {
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  int userId;
  String companyName;
  String jobTitle;
  DateTime startDate;
  DateTime endDate;
  String details;
  String name;

  Experience({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
    required this.companyName,
    required this.jobTitle,
    required this.startDate,
    required this.endDate,
    required this.details,
    required this.name,
  });

  factory Experience.fromJson(Map<String, dynamic> json) => Experience(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    userId: json["user_id"],
    companyName: json["company_name"],
    jobTitle: json["job_title"],
    startDate: DateTime.parse(json["start_date"]),
    endDate: DateTime.parse(json["end_date"]),
    details: json["details"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "user_id": userId,
    "company_name": companyName,
    "job_title": jobTitle,
    "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
    "end_date": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
    "details": details,
    "name": name,
  };
}

class Link {
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String title;
  String link;
  int userId;

  Link({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.title,
    required this.link,
    required this.userId,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    title: json["title"],
    link: json["link"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "title": title,
    "link": link,
    "user_id": userId,
  };
}

class Reference {
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String name;
  String employment;
  String email;
  String phone;
  int userId;

  Reference({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.employment,
    required this.email,
    required this.phone,
    required this.userId,
  });

  factory Reference.fromJson(Map<String, dynamic> json) => Reference(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    name: json["name"],
    employment: json["employment"],
    email: json["email"],
    phone: json["phone"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "name": name,
    "employment": employment,
    "email": email,
    "phone": phone,
    "user_id": userId,
  };
}

class UserCv {
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  List<String> workCity; // Changed to List<String>
  String jobCurrent;
  String image;
  List<String> languages; // Changed to List<String>
  String cvFile;
  int userId;
  dynamic jobLevel;
  List<String> jobEnvironment; // Changed to List<String>
  List<String> jobTime; // Changed to List<String>
  String jobField;
  String skills;

  UserCv({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.workCity,
    required this.jobCurrent,
    required this.image,
    required this.languages,
    required this.cvFile,
    required this.userId,
    required this.jobLevel,
    required this.jobEnvironment,
    required this.jobTime,
    required this.jobField,
    required this.skills,
  });

  factory UserCv.fromJson(Map<String, dynamic> json) => UserCv(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    workCity: List<String>.from(json["work_city"] != null ? jsonDecode(json["work_city"]) : []),
    jobCurrent: json["job_current"],
    image: json["image"],
    languages: List<String>.from(json["languages"] != null ? jsonDecode(json["languages"]) : []),
    cvFile: json["cv_file"],
    userId: json["user_id"],
    jobLevel: json["job_level"],
    jobEnvironment: List<String>.from(json["job_environment"] != null ? jsonDecode(json["job_environment"]) : []),
    jobTime: List<String>.from(json["job_time"] != null ? jsonDecode(json["job_time"]) : []),
    jobField: json["job_field"],
    skills: json["skills"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
    "work_city": jsonEncode(workCity),
    "job_current": jobCurrent,
    "image": image,
    "languages": jsonEncode(languages),
    "cv_file": cvFile,
    "user_id": userId,
    "job_level": jobLevel,
    "job_environment": jsonEncode(jobEnvironment),
    "job_time": jsonEncode(jobTime),
    "job_field": jobField,
    "skills": skills,
  };
}
