import 'dart:convert';

import 'package:abp_simrs_mobile/api.dart';
import 'package:intl/intl.dart';

class Pasien {
  int id;
  String nama_lengkap;
  String nomorHP;
  DateTime tanggal_lahir;
  String kelamin;
  String alamat;

  Pasien(
     this.id,
     this.nama_lengkap,
     this.nomorHP,
     this.tanggal_lahir,
     this.kelamin,
     this.alamat,
  );

}
Future<List<Pasien>> getAllPasien() async{
  var res = await Network().getData('/pasien');
  var body = jsonDecode(res.body);
  List<Pasien> pasien = [];
  if(body['success']){
    var datas = body['data'];
    datas.forEach( (data) =>
        pasien.add(
            Pasien(
              data['id'],
              data['nama_lengkap'],
              data['nomor_hp'],
              DateFormat("yyyy-MM-dd").parse(data['tanggal_lahir']),
              data['kelamin'],
              data['alamat'],
            )
        )
    );
  }
  return pasien;
}