class User {
  int? id;
  String? email;
  String? name;
  String? tier;
  int? playgroundId;
  bool? isActive;
  String? tel;
  int? startYear;
  int? teamId;

  User(
      {id,
      email,
      name,
      tier,
      playgroundId,
      isActive,
      tel,
      startYear,
      teamId});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
    tier = json['tier'];
    playgroundId = json['playgroundId'];
    isActive = json['isActive'];
    tel = json['tel'];
    startYear = json['start_year'];
    teamId = json['teamId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['email'] = email;
    data['name'] = name;
    data['tier'] = tier;
    data['playgroundId'] = playgroundId;
    data['isActive'] = isActive;
    data['tel'] = tel;
    data['start_year'] = startYear;
    data['teamId'] = teamId;
    return data;
  }
}
