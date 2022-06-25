import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
    LoginResponse({
        required this.result,
        required this.message,
        required this.usuario,
    });

    final String result;
    final String message;
    final Usuario? usuario;

    factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        result: json["result"],
        message: json["message"],
        usuario: json["usuario"] != false ? Usuario.fromJson(json["usuario"]) : null,
    );

    Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
        "usuario": usuario!.toJson(),
    };
}

class Usuario {
    Usuario({
        required this.id,
        required this.name,
        required this.phone,
        required this.email,
        required this.lastRev,
        required this.sigRev,
        required this.documents,
    });

    final String id;
    final String name;
    final String phone;
    final String email;
    final String lastRev;
    final String sigRev;
    final String documents;

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        lastRev: json["last_rev"],
        sigRev: json["sig_rev"],
        documents: json["documents"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "email": email,
        "last_rev": lastRev,
        "sig_rev": sigRev,
        "documents": documents,
    };
}
