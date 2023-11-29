
/// The response of the `GET /users/` endpoint.
class User {
  User({
    required this.id,
    required this.email,
    required this.name,
    required this.tier,
    required this.tel,
    required this.startYear,
  });

  /// Convert a JSON object into an [User] instance.
  /// This enables type-safe reading of the API response.
  factory User.fromJson(Map<String, dynamic> json) {
    print('User');
    print(json['name']);
    return User(
      id: json['id'] as int,
      email: json['email'] as String,
      name: json['name'] as String,
      tier: json['tier'] as String,
      tel: json['tel'] as String,
      startYear: json['start_year'] as int,
    );
  }

  final int id;
  final String email;
  final String name;
  final String tier;
  final String tel;
  final int startYear;
}