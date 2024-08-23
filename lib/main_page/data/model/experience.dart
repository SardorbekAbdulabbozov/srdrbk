class Experience {
  Experience({
    this.position,
    this.employmentType,
    this.duration,
    this.companyLogo,
    this.responsibilities,
    this.isCareerBreak,
    this.order,
  });

  Experience.fromJson(dynamic json) {
    position = json['position'];
    employmentType = json['employmentType'];
    duration = json['duration'];
    companyLogo = json['companyLogo'];
    responsibilities = json['responsibilities'];
    isCareerBreak = json['isCareerBreak'];
    order = json['order'];
  }

  String? position;
  String? employmentType;
  String? duration;
  String? companyLogo;
  String? responsibilities;
  bool? isCareerBreak;
  int? order;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['position'] = position;
    map['employmentType'] = employmentType;
    map['duration'] = duration;
    map['companyLogo'] = companyLogo;
    map['responsibilities'] = responsibilities;
    map['isCareerBreak'] = isCareerBreak;
    map['order'] = order;
    return map;
  }
}
