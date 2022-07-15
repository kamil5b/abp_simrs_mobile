import 'package:abp_simrs_mobile/karyawan.dart';
import 'package:abp_simrs_mobile/obat.dart';
import 'package:abp_simrs_mobile/pasien.dart';
import 'package:abp_simrs_mobile/peralatan.dart';
import 'package:flutter/material.dart';
import 'package:abp_simrs_mobile/models/Pasien.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({Key? key}) : super(key: key);
  @override
  _DashboardWidgetState createState() => _DashboardWidgetState();
}


class _DashboardWidgetState extends State<DashboardWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late Future<List<Pasien>> futurePasien;
  /*
  List<Widget> _listPasien(List<Pasien> myObjects) {
    var list = myObjects.map<List<Widget>>(
          (data) {
        var widgetList = <Widget>[];

        widgetList.add(Padding(
          padding: EdgeInsetsDirectional.fromSTEB(
              16, 8, 16, 0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFFF1F4F8),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  8, 8, 12, 8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment:
                CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child:
                    ElevatedButton(
                      onPressed: () {
                        print('Button-Login pressed ...');
                      },
                      child: Text(data.nama_lengkap),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(130, 40),
                        primary: Color(0x004B39EF),
                        textStyle:TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                        ),
                        elevation: 3,
                        side: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
        //widgetList.add(Text("Text 2"));
        return widgetList;
      },
    ).toList();
    var flat = list.expand((i) => i).toList();
    return flat;
  }*/
  String name="";
  @override
  void initState() {
    super.initState();
    _loadUserData();
  }
  _loadUserData() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user')!);

    if(user != null) {
      setState(() {
        name = user['name'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Dashboard '+ name,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: DefaultTabController(
                  length: 4,
                  initialIndex: 0,
                  child: Column(
                    children: [
                      TabBar(
                        isScrollable: true,
                        labelColor: Color(0xFF4B39EF),
                        unselectedLabelColor: Color(0xFF57636C),
                        labelStyle:
                        TextStyle(
                          fontFamily: 'Outfit',
                          color: Color(0xFF1D2429),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        indicatorColor: Color(0xFF4B39EF),
                        tabs: [
                          Tab(
                            text: 'Pasien',
                          ),
                          Tab(
                            text: 'Karyawan',
                          ),
                          Tab(
                            text: 'Obat',
                          ),
                          Tab(
                            text: 'Peralatan',
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            PasienPageWidget(),
                            KaryawanPageWidget(),
                            ObatPageWidget(),
                            PeralatanPageWidget(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
