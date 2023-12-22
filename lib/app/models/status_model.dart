class StatusModel {
  StatusModel({
    required this.error,
    required this.login,
    required this.userId,
    required this.role,
    required this.apiVer,
    required this.devDebugParam,
  });

  int error;
  bool login;
  String userId;
  String role;
  String apiVer;
  String devDebugParam;

  factory StatusModel.fromJson(Map<String, dynamic> json) => StatusModel(
        error: json['error'],
        login: json['login'],
        userId: json['user_id'],
        role: json['role'],
        apiVer: json['api-ver'],
        devDebugParam: json['dev-debug-param'],
      );
  factory StatusModel.init() => StatusModel(
        error: 1,
        login: false,
        userId: '',
        role: '',
        apiVer: '',
        devDebugParam: '',
      );

  Map<String, dynamic> toJson() => {
        "error": 0,
        "login": true,
        "user_id": "1",
        "role": "Admin",
        "api-ver": "0.1",
        "dev-debug-param": "1",
      };
}
