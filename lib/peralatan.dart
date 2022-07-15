import 'package:abp_simrs_mobile/models/Peralatan.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class PeralatanPageWidget extends StatefulWidget {
  const PeralatanPageWidget({Key? key}) : super(key: key);

  @override
  _PeralatanPageWidgetState createState() => _PeralatanPageWidgetState();
}

class _PeralatanPageWidgetState extends State<PeralatanPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late Future<List<Peralatan>> _peralatans;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _peralatans = getAllPeralatan();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false, // set it to false
        body:  FutureBuilder(
            future: _peralatans,
            builder:(context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Container(
                    child: ListView.builder(
                        itemCount: snapshot.data.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
                              child:
                              InkWell(
                                onTap: () async {

                                },
                                child:Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: const Color(0xFF088454),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child:
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 10, 10, 10),
                                    child: Text(
                                      '${snapshot.data[index].kode_peralatan}',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              )

                          );
                        }
                    )
                );
              }
            }
        )
    );
  }
}


/*
* Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 16, 0, 0),
                                    child: Text(
                                      'Peralatan',
                                      style: TextStyle(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF1D2429),
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                  FutureBuilder<List<Peralatan>>(
                                    future:futurePeralatan,
                                    builder: (context,snapshot){
                                      if (snapshot.connectionState==ConnectionState.done) {
                                        if(snapshot.hasData) {
                                          var data = snapshot.data;
                                          return ListView.builder(
                                              itemCount: data!.length,
                                              itemBuilder: (_, index) {
                                                  print(data[index].nama_lengkap);
                                                 return Padding(
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
                                                                child: Text("${data[index].nama_lengkap}"),
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
                                                  );
                                            }
                                          );
                                        }
                                        return Text("No DATA");
                                      }
                                      return const Center(child: CircularProgressIndicator());
                                    }
                                  ),
                                  *
                                  Padding(
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
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  print('Button-Login pressed ...');
                                                },
                                                child: Text('Peralatan 1'),
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
                                  ),
* */