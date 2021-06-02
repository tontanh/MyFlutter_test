import 'dart:convert';

List<StudentInfo> studentInfoFromJson(String str) => List<StudentInfo>.from(
    json.decode(str).map((x) => StudentInfo.fromJson(x)));

String studentInfoToJson(List<StudentInfo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StudentInfo {
  StudentInfo({
    this.id,
    this.stId,
    this.stCode,
    this.proId,
    this.disId,
    this.villId,
    this.typeSchool,
    this.schoolId,
    this.typeLevel,
    this.levels,
    this.room,
    this.uName,
    this.pass,
    this.passC,
    this.sex,
    this.fname,
    this.lname,
    this.sortChar,
    this.dtNow,
    this.uId,
    this.statusExamp,
    this.statuss,
    this.img,
    this.stateLogin,
    this.lessIdExam,
    this.userLogin,
    this.remark,
    this.dob,
    this.score,
    this.proIdB,
    this.disIdB,
    this.villIdB,
    this.proIdL,
    this.disIdL,
    this.villIdL,
    this.ethnicId,
    this.examPro,
    this.faId,
    this.moId,
    this.st16,
    this.tbScan,
    this.stPosition,
    this.statusAb,
    this.abQty1,
    this.abQty2,
    this.carNo,
    this.typeVi,
    this.sortName,
    this.tbStateFirst,
    this.printSign,
    this.payMonth,
    this.money,
  });

  String id;
  String stId;
  String stCode;
  String proId;
  String disId;
  String villId;
  String typeSchool;
  String schoolId;
  String typeLevel;
  String levels;
  String room;
  String uName;
  String pass;
  String passC;
  String sex;
  String fname;
  String lname;
  String sortChar;
  DateTime dtNow;
  String uId;
  String statusExamp;
  String statuss;
  String img;
  String stateLogin;
  String lessIdExam;
  String userLogin;
  String remark;
  String dob;
  String score;
  String proIdB;
  String disIdB;
  String villIdB;
  String proIdL;
  String disIdL;
  String villIdL;
  String ethnicId;
  String examPro;
  String faId;
  String moId;
  String st16;
  String tbScan;
  String stPosition;
  String statusAb;
  String abQty1;
  String abQty2;
  String carNo;
  String typeVi;
  String sortName;
  String tbStateFirst;
  String printSign;
  dynamic payMonth;
  String money;

  factory StudentInfo.fromJson(Map<String, dynamic> json) => StudentInfo(
    
        id: json["Id"],
        stId: json["st_id"],
        stCode: json["st_code"],
        proId: json["pro_id"],
        disId: json["dis_id"],
        villId: json["vill_id"],
        typeSchool: json["type_school"],
        schoolId: json["school_id"],
        typeLevel: json["type_level"],
        levels: json["levels"],
        room: json["room"],
        uName: json["u_name"],
        pass: json["pass"],
        passC: json["pass_c"],
        sex: json["sex"],
        fname: json["fname"],
        lname: json["lname"],
        sortChar: json["sort_char"],
        dtNow: DateTime.parse(json["dt_now"]),
        uId: json["u_id"],
        statusExamp: json["status_examp"],
        statuss: json["statuss"],
        img: json["img"],
        stateLogin: json["state_login"],
        lessIdExam: json["less_id_exam"],
        userLogin: json["user_login"],
        remark: json["remark"],      
        dob:json["dob"],
        score: json["score"],
        proIdB: json["pro_id_b"],
        disIdB: json["dis_id_b"],
        villIdB: json["vill_id_b"],
        proIdL: json["pro_id_l"],
        disIdL: json["dis_id_l"],
        villIdL: json["vill_id_l"],
        ethnicId: json["ethnic_id"],
        examPro: json["exam_pro"],
        faId: json["fa_id"],
        moId: json["mo_id"],
        st16: json["st_16"],
        tbScan: json["tb_scan"],
        stPosition: json["st_position"],
        statusAb: json["status_ab"],
        abQty1: json["ab_qty1"],
        abQty2: json["ab_qty2"],
        carNo: json["car_no"],
        typeVi: json["type_vi"],
        sortName: json["sort_name"],
        tbStateFirst: json["tb_state_first"],
        printSign: json["printSign"],
        payMonth: json["payMonth"],
        money: json["money"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "st_id": stId,
        "st_code": stCode,
        "pro_id": proId,
        "dis_id": disId,
        "vill_id": villId,
        "type_school": typeSchool,
        "school_id": schoolId,
        "type_level": typeLevel,
        "levels": levels,
        "room": room,
        "u_name": uName,
        "pass": pass,
        "pass_c": passC,
        "sex": sex,
        "fname": fname,
        "lname": lname,
        "sort_char": sortChar,
        "dt_now": dtNow.toIso8601String(),
        "u_id": uId,
        "status_examp": statusExamp,
        "statuss": statuss,
        "img": img,
        "state_login": stateLogin,
        "less_id_exam": lessIdExam,
        "user_login": userLogin,
        "remark": remark,
        "dob":
            dob,
        "score": score,
        "pro_id_b": proIdB,
        "dis_id_b": disIdB,
        "vill_id_b": villIdB,
        "pro_id_l": proIdL,
        "dis_id_l": disIdL,
        "vill_id_l": villIdL,
        "ethnic_id": ethnicId,
        "exam_pro": examPro,
        "fa_id": faId,
        "mo_id": moId,
        "st_16": st16,
        "tb_scan": tbScan,
        "st_position": stPosition,
        "status_ab": statusAb,
        "ab_qty1": abQty1,
        "ab_qty2": abQty2,
        "car_no": carNo,
        "type_vi": typeVi,
        "sort_name": sortName,
        "tb_state_first": tbStateFirst,
        "printSign": printSign,
        "payMonth": payMonth,
        "money": money,
      };
}
