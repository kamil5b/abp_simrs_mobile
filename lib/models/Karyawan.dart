import 'dart:convert';

import 'package:abp_simrs_mobile/api.dart';
import 'package:intl/intl.dart';

class Karyawan {
  int id;
  String nama_lengkap;
  String nomorHP;
  DateTime tanggal_lahir;
  String kelamin;
  String alamat;
  String gaji_pokok;
  String role;

  Karyawan(
      this.id,
      this.nama_lengkap,
      this.nomorHP,
      this.tanggal_lahir,
      this.kelamin,
      this.alamat,
      this.gaji_pokok,
      this.role,
      );

}
Future<List<Karyawan>> getAllKaryawan() async{
  var res = await Network().getData('/karyawan');
  var body = jsonDecode(res.body);
  List<Karyawan> karyawan = [];
  if(body['success']){
    var datas = body['data'];
    datas.forEach( (data) =>
        karyawan.add(
            Karyawan(
              data['id'],
              data['nama_lengkap'],
              data['nomor_hp'],
              DateFormat("yyyy-MM-dd").parse(data['tanggal_lahir']),
              data['kelamin'],
              data['alamat'],
              data['gaji_pokok'],
              data['role'],
            )
        )
    );
  }
  return karyawan;
}