class LoginApiModel {
  String? status;
  String? message;
  Data? data;

  LoginApiModel({this.status, this.message, this.data});

  factory LoginApiModel.fromJson(Map<String, dynamic> json) {
    return LoginApiModel(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        if (data != null) 'data': data!.toJson(),
      };
}

class Data {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  String? phone;
  String? avatar;
  int? earnings;
  String? role;
  String? status;
  String? isVerified;
  String? joinedAt;
  String? ratings;
  String? bio;

  Data({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.phone,
    this.avatar,
    this.earnings,
    this.role,
    this.status,
    this.isVerified,
    this.joinedAt,
    this.ratings,
    this.bio,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      gender: json['gender'],
      phone: json['phone'],
      avatar: json['avatar'],
      earnings: json['earnings'],
      role: json['role'],
      status: json['status'],
      isVerified: json['is_verified'],
      joinedAt: json['joined_at'],
      ratings: json['ratings'],
      bio: json['bio'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'gender': gender,
        'phone': phone,
        'avatar': avatar,
        'earnings': earnings,
        'role': role,
        'status': status,
        'is_verified': isVerified,
        'joined_at': joinedAt,
        'ratings': ratings,
        'bio': bio,
      };
}
