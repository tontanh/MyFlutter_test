// To parse this JSON data, do
//
//     final userTeacher = userTeacherFromJson(jsonString);

import 'dart:convert';

UserTeacher userTeacherFromJson(String str) => UserTeacher.fromJson(json.decode(str));

String userTeacherToJson(UserTeacher data) => json.encode(data.toJson());

class UserTeacher {
    UserTeacher({
        this.state,
        this.flname,
        this.less,
        this.levels,
        this.id,
        this.proId,
        this.disId,
        this.villId,
        this.typeSchool,
        this.schoolId,
        this.uName,
        this.userId,
        this.pass,
        this.tel,
        this.fname,
        this.lname,
        this.sex,
        this.dob,
        this.uId,
        this.dateRe,
        this.pic,
        this.loginState,
        this.uPosition,
        this.tbState,
        this.adminId,
        this.tbId,
        this.tbRate,
        this.mgLevel,
        this.room,
        this.scanType,
        this.stateScan,
        this.useSystem,
        this.schoolName,
        this.typeName,
    });

    int state;
    String flname;
    List<Less> less;
    List<String> levels;
    int id;
    int proId;
    int disId;
    int villId;
    int typeSchool;
    int schoolId;
    String uName;
    String userId;
    String pass;
    String tel;
    String fname;
    String lname;
    String sex;
    DateTime dob;
    int uId;
    DateTime dateRe;
    String pic;
    int loginState;
    String uPosition;
    int tbState;
    dynamic adminId;
    int tbId;
    dynamic tbRate;
    int mgLevel;
    int room;
    int scanType;
    int stateScan;
    int useSystem;
    String schoolName;
    String typeName;

    factory UserTeacher.fromJson(Map<String, dynamic> json) => UserTeacher(
        state: json["state"],
        flname: json["flname"],
        less: List<Less>.from(json["less"].map((x) => Less.fromJson(x))),
        levels: List<String>.from(json["levels"].map((x) => x)),
        id: json["Id"],
        proId: json["pro_id"],
        disId: json["dis_id"],
        villId: json["vill_id"],
        typeSchool: json["type_school"],
        schoolId: json["school_id"],
        uName: json["u_name"],
        userId: json["user_id"],
        pass: json["pass"],
        tel: json["tel"],
        fname: json["fname"],
        lname: json["lname"],
        sex: json["sex"],
        dob: DateTime.parse(json["dob"]),
        uId: json["u_id"],
        dateRe: DateTime.parse(json["date_re"]),
        pic: json["pic"],
        loginState: json["login_state"],
        uPosition: json["u_position"],
        tbState: json["tb_state"],
        adminId: json["admin_id"],
        tbId: json["tb_id"],
        tbRate: json["tb_rate"],
        mgLevel: json["mg_level"],
        room: json["room"],
        scanType: json["scan_type"],
        stateScan: json["state_scan"],
        useSystem: json["use_system"],
        schoolName: json["school_name"],
        typeName: json["type_name"],
    );

    Map<String, dynamic> toJson() => {
        "state": state,
        "flname": flname,
        "less": List<dynamic>.from(less.map((x) => x.toJson())),
        "levels": List<dynamic>.from(levels.map((x) => x)),
        "Id": id,
        "pro_id": proId,
        "dis_id": disId,
        "vill_id": villId,
        "type_school": typeSchool,
        "school_id": schoolId,
        "u_name": uName,
        "user_id": userId,
        "pass": pass,
        "tel": tel,
        "fname": fname,
        "lname": lname,
        "sex": sex,
        "dob": "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
        "u_id": uId,
        "date_re": "${dateRe.year.toString().padLeft(4, '0')}-${dateRe.month.toString().padLeft(2, '0')}-${dateRe.day.toString().padLeft(2, '0')}",
        "pic": pic,
        "login_state": loginState,
        "u_position": uPosition,
        "tb_state": tbState,
        "admin_id": adminId,
        "tb_id": tbId,
        "tb_rate": tbRate,
        "mg_level": mgLevel,
        "room": room,
        "scan_type": scanType,
        "state_scan": stateScan,
        "use_system": useSystem,
        "school_name": schoolName,
        "type_name": typeName,
    };
}

class Less {
    Less({
        this.id,
        this.lessName,
        this.sortName,
        this.tbState,
        this.uId,
        this.lessCode,
        this.img,
        this.examp4,
        this.examp7,
    });

    String id;
    String lessName;
    String sortName;
    String tbState;
    String uId;
    String lessCode;
    String img;
    String examp4;
    String examp7;

    factory Less.fromJson(Map<String, dynamic> json) => Less(
        id: json["Id"],
        lessName: json["less_name"],
        sortName: json["sort_name"],
        tbState: json["tb_state"],
        uId: json["u_id"],
        lessCode: json["less_code"],
        img: json["img"],
        examp4: json["examp4"],
        examp7: json["examp7"],
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "less_name": lessName,
        "sort_name": sortName,
        "tb_state": tbState,
        "u_id": uId,
        "less_code": lessCode,
        "img": img,
        "examp4": examp4,
        "examp7": examp7,
    };
}
