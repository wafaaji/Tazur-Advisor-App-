import 'dart:convert';

CompanyProfile companyProfileFromJson(String str) => CompanyProfile.fromJson(json.decode(str));

String companyProfileToJson(CompanyProfile data) => json.encode(data.toJson());

class CompanyProfile {
  Company company;
  List<Job> jobs;
  List<Course> courses;

  CompanyProfile({
    required this.company,
    required this.jobs,
    required this.courses,
  });

  factory CompanyProfile.fromJson(Map<String, dynamic> json) => CompanyProfile(
    company: Company.fromJson(json["company"]),
    jobs: List<Job>.from(json["jobs"].map((x) => Job.fromJson(x))),
    courses: List<Course>.from(json["courses"].map((x) => Course.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "company": company.toJson(),
    "jobs": List<dynamic>.from(jobs.map((x) => x)),
    "courses": List<dynamic>.from(courses.map((x) => x.toJson())),
  };
}

class Company {
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String status;
  String name;
  String phone;
  String topic;
  String locationMap;
  String location;
  String fax;
  String documents;
  List<String> type;
  String logo;
  String email;
  String aboutUs;

  Company({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    required this.name,
    required this.phone,
    required this.topic,
    required this.locationMap,
    required this.location,
    required this.fax,
    required this.documents,
    required this.type,
    required this.logo,
    required this.email,
    required this.aboutUs,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    // Handle the 'type' field which might be a stringified JSON array
    List<String> parsedType;
    if (json["type"] is String) {
      parsedType = List<String>.from(jsonDecode(json["type"]));
    } else {
      parsedType = List<String>.from(json["type"].map((x) => x));
    }

    return Company(
      id: json["id"],
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
      status: json["status"],
      name: json["name"],
      phone: json["phone"],
      topic: json["topic"],
      locationMap: json["location_map"],
      location: json["location"],
      fax: json["fax"],
      documents: json["documents"],
      type: parsedType,
      logo: json["logo"],
      email: json["email"],
      aboutUs: json["about_us"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "status": status,
    "name": name,
    "phone": phone,
    "topic": topic,
    "location_map": locationMap,
    "location": location,
    "fax": fax,
    "documents": documents,
    "type":  jsonEncode(type),
    "logo": logo,
    "email": email,
    "about_us": aboutUs,
  };
}

class Course {
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  String duration;
  String numberTrainees;
  String topic;
  String type;
  String name;
  int companyId;
  String startDate;
  String endDate;
  int days;
  String price;
  String location;
  String status;

  Course({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.duration,
    required this.numberTrainees,
    required this.topic,
    required this.type,
    required this.name,
    required this.companyId,
    required this.startDate,
    required this.endDate,
    required this.days,
    required this.price,
    required this.location,
    required this.status,
  });

  factory Course.fromJson(Map<String, dynamic> json) => Course(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    duration: json["duration"],
    numberTrainees: json["number_trainees"],
    topic: json["topic"],
    type: json["type"],
    name: json["name"],
    companyId: json["company_id"],
    startDate: json["start_date"],
    endDate: json["end_date"],
    days: json["days"],
    price: json["price"],
    location: json["location"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
    "duration": duration,
    "number_trainees": numberTrainees,
    "topic": topic,
    "type": type,
    "name": name,
    "company_id": companyId,
    "start_date": startDate,
    "end_date": endDate,
    "days": days,
    "price": price,
    "location": location,
    "status": status,
  };
}

class Job {
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  bool hiddenName;
  String jobTitle;
  String numberEmployees;
  String topic;
  String jobEnvironment;
  String salaryFields;
  String educationLevel;
  String requireQualifications;
  String specialQualifications;
  bool isRequiredImage;
  String requiredLanguages;
  String experienseYears;
  String gender;
  String location;
  int companyId;
  bool isRequiredLicense;
  String status;
  String isRequiredMilitary;
  String jobTime;
  String endDate;

  Job({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.hiddenName,
    required this.jobTitle,
    required this.numberEmployees,
    required this.topic,
    required this.jobEnvironment,
    required this.salaryFields,
    required this.educationLevel,
    required this.requireQualifications,
    required this.specialQualifications,
    required this.isRequiredImage,
    required this.requiredLanguages,
    required this.experienseYears,
    required this.gender,
    required this.location,
    required this.companyId,
    required this.isRequiredLicense,
    required this.status,
    required this.isRequiredMilitary,
    required this.jobTime,
    required this.endDate,
  });

  factory Job.fromJson(Map<String, dynamic> json) => Job(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    hiddenName: json["hidden_name"]  == 1,
    jobTitle: json["job_title"],
    numberEmployees: json["number_employees"],
    topic: json["topic"],
    jobEnvironment: json["job_environment"],
    salaryFields: json["salary_fields"],
    educationLevel: json["education_level"],
    requireQualifications: json["require_qualifications"],
    specialQualifications: json["special_qualifications"],
    isRequiredImage: json["is_required_image"]  == 1,
    requiredLanguages: json["required_languages"],
    experienseYears: json["experiense_years"],
    gender: json["gender"],
    location: json["location"],
    companyId: json["company_id"],
    isRequiredLicense: json["is_required_license"]  == 1,
    status: json["status"],
    isRequiredMilitary: json["is_required_military"],
    jobTime: json["job_time"],
    endDate: json["end_date"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
    "hidden_name": hiddenName ? 1 : 0,
    "job_title": jobTitle,
    "number_employees": numberEmployees,
    "topic": topic,
    "job_environment": jobEnvironment,
    "salary_fields": salaryFields,
    "education_level": educationLevel,
    "require_qualifications": requireQualifications,
    "special_qualifications": specialQualifications,
    "is_required_image": isRequiredImage ? 1 : 0,
    "required_languages": requiredLanguages,
    "experiense_years": experienseYears,
    "gender": gender,
    "location": location,
    "company_id": companyId,
    "is_required_license": isRequiredLicense ? 1 : 0,
    "status": status,
    "is_required_military": isRequiredMilitary,
    "job_time": jobTime,
    "end_date": endDate,
  };
}
