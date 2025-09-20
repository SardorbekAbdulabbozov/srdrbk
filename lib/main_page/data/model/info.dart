class Info {
  Info({
    this.id,
    this.about,
    this.overview,
    this.mainPhoto,
    this.secondaryPhoto,
    this.phoneNumber,
    this.email,
    this.isOpenToWork,
    this.location,
    this.telegramUrl,
    this.linkedinUrl,
    this.githubUrl,
    this.cvUrl,
    this.xUrl,
  });

  Info.fromJson(dynamic json) {
    id = json['id'];
    about = json['about'];
    overview = json['overview'];
    mainPhoto = json['mainPhoto'];
    secondaryPhoto = json['secondaryPhoto'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    isOpenToWork = json['isOpenToWork'];
    location = json['location'];
    telegramUrl = json['telegramUrl'];
    linkedinUrl = json['linkedinUrl'];
    githubUrl = json['githubUrl'];
    cvUrl = json['cvUrl'];
    xUrl = json['xUrl'];
  }

  num? id;
  String? about;
  String? overview;
  String? mainPhoto;
  String? secondaryPhoto;
  String? phoneNumber;
  String? email;
  bool? isOpenToWork;
  String? location;
  String? telegramUrl;
  String? linkedinUrl;
  String? githubUrl;
  String? cvUrl;
  String? xUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['about'] = about;
    map['overview'] = overview;
    map['mainPhoto'] = mainPhoto;
    map['secondaryPhoto'] = secondaryPhoto;
    map['phoneNumber'] = phoneNumber;
    map['email'] = email;
    map['isOpenToWork'] = isOpenToWork;
    map['location'] = location;
    map['telegramUrl'] = telegramUrl;
    map['linkedinUrl'] = linkedinUrl;
    map['githubUrl'] = githubUrl;
    map['cvUrl'] = cvUrl;
    map['xUrl'] = xUrl;
    return map;
  }
}
