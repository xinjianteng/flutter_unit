// 注册请求
class UserRegisterRequestEntity {
  String username;
  String email;
  String password;

  UserRegisterRequestEntity({
    required this.username,
    required this.email,
    required this.password,
  });

  factory UserRegisterRequestEntity.fromJson(Map<String, dynamic> json) =>
      UserRegisterRequestEntity(
        username: json["username"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "password": password,
      };
}

// 注册返回
class UserRegisterResponseEntity {
  String? objectId;
  String? sessionToken;
  String? createdAt;

  UserRegisterResponseEntity({
    this.objectId,
    this.sessionToken,
    this.createdAt,
  });


  factory UserRegisterResponseEntity.fromJson(Map<String, dynamic> json) =>
      UserRegisterResponseEntity(
        objectId: json["objectId"],
        sessionToken: json["sessionToken"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toJson() => {
    "objectId": objectId,
    "sessionToken": sessionToken,
    "createdAt": createdAt,
  };
}


// 登录请求
class UserLoginRequestEntity {
  String email;
  String password;

  UserLoginRequestEntity({
    required this.email,
    required this.password,
  });

  factory UserLoginRequestEntity.fromJson(Map<String, dynamic> json) =>
      UserLoginRequestEntity(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}

// 登录返回
class UserLoginResponseEntity {
  String? accessToken;
  String? displayName;
  List<String>? channels;

  UserLoginResponseEntity({
    this.accessToken,
    this.displayName,
    this.channels,
  });

  factory UserLoginResponseEntity.fromJson(Map<String, dynamic> json) =>
      UserLoginResponseEntity(
        accessToken: json["access_token"],
        displayName: json["display_name"],
        channels: List<String>.from(json["channels"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "display_name": displayName,
        "channels":
            channels == null ? [] : List<dynamic>.from(channels!.map((x) => x)),
      };
}

