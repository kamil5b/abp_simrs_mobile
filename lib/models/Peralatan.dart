import 'dart:convert';

import 'package:abp_simrs_mobile/api.dart';

class Peralatan {
  int id;
  String nama_peralatan;
  String kode_peralatan;
  String lokasi;
  bool dipakai;

  Peralatan(
     this.id,
     this.nama_peralatan,
     this.kode_peralatan,
     this.lokasi,
     this.dipakai
  );

}
Future<List<Peralatan>> getAllPeralatan() async{
  var res = await Network().getData('/peralatan');
  var body = jsonDecode(res.body);
  List<Peralatan> peralatan = [];
  if(body['success']){
    var datas = body['data'];
    datas.forEach( (data) =>
        peralatan.add(
            Peralatan(
              data['id'],
              data['nama_peralatan'],
              data['kode_peralatan'],
              data['lokasi'],
              data['dipakai'] == 0 ? false : true,
            )
        )
    );
  }
  return peralatan;
}