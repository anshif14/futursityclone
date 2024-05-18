// To parse this JSON data, do
//
//     final topCourseModel = topCourseModelFromJson(jsonString);

import 'dart:convert';

List<TopCourseModel> topCourseModelFromJson(String str) => List<TopCourseModel>.from(json.decode(str).map((x) => TopCourseModel.fromJson(x)));

String topCourseModelToJson(List<TopCourseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TopCourseModel {
  String? id;
  String ?title;
  String ?shortDescription;
  String ?description;
  List<String>? outcomes;
  Language? language;
  String ?categoryId;
  String? subCategoryId;
  String? section;
  List<dynamic>?requirements;
  String? price;
  String ?discountFlag;
  String? discountedPrice;
  Level? level;
  String ?userId;
  String ?thumbnail;
  String? videoUrl;
  String ?dateAdded;
  String ?lastModified;
  dynamic ?visibility;
  String ?isTopCourse;
  String? isAdmin;
  Status ?status;
  CourseOverviewProvider ?courseOverviewProvider;
  String ?metaKeywords;
  String? metaDescription;
  dynamic ?isFreeCourse;
  String? topCourseModelExternal;
  String? externalLink;
  int? rating;
  int?numberOfRatings;
  InstructorName? instructorName;
  int? totalEnrollment;
  String ?shareableLink;
  String? fullPrice;
  String? videoCount;

  TopCourseModel({
    this.id,
    this.title,
    this.shortDescription,
    this.description,
    this.outcomes,
    this.language,
    this.categoryId,
    this.subCategoryId,
    this.section,
    this.requirements,
    this.price,
    this.discountFlag,
    this.discountedPrice,
    this.level,
    this.userId,
    this.thumbnail,
    this.videoUrl,
    this.dateAdded,
    this.lastModified,
    this.visibility,
    this.isTopCourse,
    this.isAdmin,
    this.status,
    this.courseOverviewProvider,
    this.metaKeywords,
    this.metaDescription,
    this.isFreeCourse,
    this.topCourseModelExternal,
    this.externalLink,
    this.rating,
    this.numberOfRatings,
    this.instructorName,
    this.totalEnrollment,
    this.shareableLink,
    this.fullPrice,
    this.videoCount,
  });

  TopCourseModel copyWith({
    String? id,
    String? title,
    String? shortDescription,
    String? description,
    List<String>? outcomes,
    Language? language,
    String? categoryId,
    String? subCategoryId,
    String? section,
    List<dynamic>? requirements,
    String? price,
    String? discountFlag,
    String? discountedPrice,
    Level? level,
    String? userId,
    String? thumbnail,
    String? videoUrl,
    String? dateAdded,
    String? lastModified,
    dynamic visibility,
    String? isTopCourse,
    String? isAdmin,
    Status? status,
    CourseOverviewProvider? courseOverviewProvider,
    String? metaKeywords,
    String? metaDescription,
    dynamic isFreeCourse,
    String? topCourseModelExternal,
    String? externalLink,
    int? rating,
    int? numberOfRatings,
    InstructorName? instructorName,
    int? totalEnrollment,
    String? shareableLink,
    String? fullPrice,
    String? videoCount,
  }) =>
      TopCourseModel(
        id: id ?? this.id,
        title: title ?? this.title,
        shortDescription: shortDescription ?? this.shortDescription,
        description: description ?? this.description,
        outcomes: outcomes ?? this.outcomes,
        language: language ?? this.language,
        categoryId: categoryId ?? this.categoryId,
        subCategoryId: subCategoryId ?? this.subCategoryId,
        section: section ?? this.section,
        requirements: requirements ?? this.requirements,
        price: price ?? this.price,
        discountFlag: discountFlag ?? this.discountFlag,
        discountedPrice: discountedPrice ?? this.discountedPrice,
        level: level ?? this.level,
        userId: userId ?? this.userId,
        thumbnail: thumbnail ?? this.thumbnail,
        videoUrl: videoUrl ?? this.videoUrl,
        dateAdded: dateAdded ?? this.dateAdded,
        lastModified: lastModified ?? this.lastModified,
        visibility: visibility ?? this.visibility,
        isTopCourse: isTopCourse ?? this.isTopCourse,
        isAdmin: isAdmin ?? this.isAdmin,
        status: status ?? this.status,
        courseOverviewProvider: courseOverviewProvider ?? this.courseOverviewProvider,
        metaKeywords: metaKeywords ?? this.metaKeywords,
        metaDescription: metaDescription ?? this.metaDescription,
        isFreeCourse: isFreeCourse ?? this.isFreeCourse,
        topCourseModelExternal: topCourseModelExternal ?? this.topCourseModelExternal,
        externalLink: externalLink ?? this.externalLink,
        rating: rating ?? this.rating,
        numberOfRatings: numberOfRatings ?? this.numberOfRatings,
        instructorName: instructorName ?? this.instructorName,
        totalEnrollment: totalEnrollment ?? this.totalEnrollment,
        shareableLink: shareableLink ?? this.shareableLink,
        fullPrice: fullPrice ?? this.fullPrice,
        videoCount: videoCount ?? this.videoCount,
      );

  factory TopCourseModel.fromJson(Map<String, dynamic> json) => TopCourseModel(
    id: json["id"],
    title: json["title"],
    shortDescription: json["short_description"],
    description: json["description"],
    outcomes: [],
    language: languageValues.map[json["language"]],
    categoryId: json["category_id"],
    subCategoryId: json["sub_category_id"],
    section: json["section"],
    requirements: [],
    price: json["price"],
    discountFlag: json["discount_flag"],
    discountedPrice: json["discounted_price"],
    level: levelValues.map[json["level"]],
    userId: json["user_id"],
    thumbnail: json["thumbnail"],
    videoUrl: json["video_url"],
    dateAdded: json["date_added"],
    lastModified: json["last_modified"],
    visibility: json["visibility"],
    isTopCourse: json["is_top_course"],
    isAdmin: json["is_admin"],
    status: statusValues.map[json["status"]],
    courseOverviewProvider: courseOverviewProviderValues.map[json["course_overview_provider"]],
    metaKeywords: json["meta_keywords"],
    metaDescription: json["meta_description"],
    isFreeCourse: json["is_free_course"],
    topCourseModelExternal: json["external"],
    externalLink: json["external_link"],
    rating: json["rating"],
    numberOfRatings: json["number_of_ratings"],
    instructorName: instructorNameValues.map[json["instructor_name"]],
    totalEnrollment: json["total_enrollment"],
    shareableLink: json["shareable_link"],
    fullPrice: json["full_price"],
    videoCount: json["video_count"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "short_description": shortDescription,
    "description": description,
    "outcomes": [],
    "language": languageValues.reverse[language],
    "category_id": categoryId,
    "sub_category_id": subCategoryId,
    "section": section,
    "requirements": [],
    "price": price,
    "discount_flag": discountFlag,
    "discounted_price": discountedPrice,
    "level": levelValues.reverse[level],
    "user_id": userId,
    "thumbnail": thumbnail,
    "video_url": videoUrl,
    "date_added": dateAdded,
    "last_modified": lastModified,
    "visibility": visibility,
    "is_top_course": isTopCourse,
    "is_admin": isAdmin,
    "status": statusValues.reverse[status],
    "course_overview_provider": courseOverviewProviderValues.reverse[courseOverviewProvider],
    "meta_keywords": metaKeywords,
    "meta_description": metaDescription,
    "is_free_course": isFreeCourse,
    "external": topCourseModelExternal,
    "external_link": externalLink,
    "rating": rating,
    "number_of_ratings": numberOfRatings,
    "instructor_name": instructorNameValues.reverse[instructorName],
    "total_enrollment": totalEnrollment,
    "shareable_link": shareableLink,
    "full_price": fullPrice,
    "video_count": videoCount,
  };
}

enum CourseOverviewProvider {
  EMPTY,
  VIMEO,
  YOUTUBE
}

final courseOverviewProviderValues = EnumValues({
  "": CourseOverviewProvider.EMPTY,
  "vimeo": CourseOverviewProvider.VIMEO,
  "youtube": CourseOverviewProvider.YOUTUBE
});

enum InstructorName {
  EMPTY
}

final instructorNameValues = EnumValues({
  " ": InstructorName.EMPTY
});

enum Language {
  ENGLISH
}

final languageValues = EnumValues({
  "english": Language.ENGLISH
});

enum Level {
  ADVANCED,
  BEGINNER
}

final levelValues = EnumValues({
  "advanced": Level.ADVANCED,
  "beginner": Level.BEGINNER
});

enum Status {
  ACTIVE
}

final statusValues = EnumValues({
  "active": Status.ACTIVE
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
