class LoginRequest {
  String? userName;
  String? password;
  String? deviceId;
  String? deviceToken;
  String? system;
  String? otp;

  LoginRequest({
    this.userName,
    this.password,
    this.deviceId,
    this.deviceToken,
    this.system,
    this.otp,
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) {
    return LoginRequest(
      userName: json['userName'],
      password: json['password'],
      deviceId: json['deviceId'],
      deviceToken: json['deviceToken'],
      system: json['system'],
      otp: json['otp'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'password': password,
      'deviceId': deviceId,
      'deviceToken': deviceToken,
      'system': system,
      'otp': otp,
    };
  }
}
