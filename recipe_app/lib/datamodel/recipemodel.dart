// class Category {
//   final String id;
//   final String name;
//   final String thumbnailUrl;
//   final String description;

//   Category({
//     required this.id,
//     required this.name,
//     required this.thumbnailUrl,
//     required this.description,
//   });

//   factory Category.fromJson(Map<String, dynamic> json) {
//     return Category(
//       id: json['idCategory'] ?? '',
//       name: json['strCategory'] ?? '',
//       thumbnailUrl: json['strCategoryThumb'] ?? '',
//       description: json['strCategoryDescription'] ?? '',
//     );
//   }
// }
class Users {
  String? id;
  String? name;
  String? email;
  String? username;
  String? password;
  String? role;

  Users({
    required this.id,
    required this.name,
    required this.email,
    required this.username,
    required this.password,
    required this.role,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      username: json['username'],
      password: json['password'],
      role: json['role'],
    );
  }
}

// class User {
//   final String id;
//   final String name;
//   final String email;

//   User({
//     required this.id,
//     required this.name,
//     required this.email,
//   });

//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       id: json['id'],
//       name: json['name'],
//       email: json['email'],
//     );
//   }
// }
