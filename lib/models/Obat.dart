import 'dart:convert';

import 'package:abp_simrs_mobile/api.dart';

class Obat {
  int id;
  String nama_obat;
  String kode_obat;
  String kandungan;
  int kuantitas;
  String tipe_kuantitas;
  int harga;

  Obat(
     this.id,
     this.nama_obat,
     this.kode_obat,
     this.kandungan,
     this.kuantitas,
      this.tipe_kuantitas,
      this.harga
  );

}
Future<List<Obat>> getAllObat() async{
  var res = await Network().getData('/obat');
  var body = jsonDecode(res.body);
  List<Obat> obat = [];
  if(body['success']){
    var datas = body['data'];
    datas.forEach( (data) =>
        obat.add(
            Obat(
              data['id'],
              data['nama_obat'],
              data['kode_obat'],
              data['kandungan'],
              data['kuantitas'],
              data['tipe_kuantitas'],
              data['harga'],
            )
        )
    );
  }
  return obat;
}