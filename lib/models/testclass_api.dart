// To parse this JSON data, do
//
//     final testModelApi = testModelApiFromJson(jsonString);

import 'dart:convert';

List<TestModelApi> testModelApiFromJson(String str) => List<TestModelApi>.from(json.decode(str).map((x) => TestModelApi.fromJson(x)));

String testModelApiToJson(List<TestModelApi> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TestModelApi {
    TestModelApi({
        this.id,
        this.name,
        this.email,
        this.password,
        this.address,
        this.created,
    });

    String id;
    String name;
    String email;
    String password;
    String address;
    DateTime created;

    factory TestModelApi.fromJson(Map<String, dynamic> json) => TestModelApi(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        address: json["address"],
        created: DateTime.parse(json["created"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "password": password,
        "address": address,
        "created": created.toIso8601String(),
    };
}
