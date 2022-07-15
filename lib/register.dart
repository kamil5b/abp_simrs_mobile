import 'dart:convert';

import 'package:abp_simrs_mobile/api.dart';
import 'package:abp_simrs_mobile/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPageWidget extends StatefulWidget {
  const RegisterPageWidget({Key? key}) : super(key: key);

  @override
  _RegisterPageWidgetState createState() => _RegisterPageWidgetState();
}

class _RegisterPageWidgetState extends State<RegisterPageWidget> {


  late TextEditingController alamatController;
  late TextEditingController nameController;
  late TextEditingController nomorHpController;
  late TextEditingController passwordController;
  late bool passwordVisibility;
  late TextEditingController password2Controller;
  late bool password2Visibility;
  late TextEditingController gajiPokokController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  late String name, nomor_hp, password,password2,alamat,kelaminValue,roleValue;
  late int gaji;
  late DateTime datePicked;

  @override
  void initState() {
    super.initState();
    alamatController = TextEditingController();
    nameController = TextEditingController();
    nomorHpController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;
    password2Controller = TextEditingController();
    password2Visibility = false;
    gajiPokokController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: Color(0xFFF1F4F8),
          automaticallyImplyLeading: false,
          flexibleSpace: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                      child: IconButton(
                        //borderColor: Colors.transparent,
                        //borderRadius: 30,
                        //borderWidth: 1,
                        //buttonSize: 50,
                        icon: Icon(
                          Icons.arrow_back_rounded,
                          color: Color(0xFF0F1113),
                          size: 24,
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                      child: Text(
                        'Back',
                        style:
                        MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
                          final Color color = states.contains(
                              MaterialState.error)
                              ? Theme
                              .of(context)
                              .errorColor
                              : Color(0xFF0F1113);
                          return TextStyle(
                            fontFamily: 'Outfit',
                            color: color,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24, 10, 0, 0),
                child: Text(
                  'Create Account',
                  style:
                  MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
                    final Color color = states.contains(
                        MaterialState.error)
                        ? Theme
                        .of(context)
                        .errorColor
                        : Color(0xFF0F1113);
                    return TextStyle(
                      fontFamily: 'Outfit',
                      color: color,
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                    );
                  }),
                ),
              ),
            ],
          ),
          actions: [],
          elevation: 0,
        ),
      ),
      backgroundColor: Color(0xFFF1F4F8),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                child: Text(
                                  'Create your account by filling in the information below to access the app.',
                                  style:
                                  MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
                                    final Color color = states.contains(
                                        MaterialState.error)
                                        ? Theme
                                        .of(context)
                                        .errorColor
                                        : Color(0xFF57636C);
                                    return TextStyle(
                                      fontFamily: 'Outfit',
                                      color: color,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    );
                                  }),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 14, 24, 0),
                        child: Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5,
                                color: Color(0x4D101213),
                                offset: Offset(0, 2),
                              )
                            ],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextFormField(
                            controller: nomorHpController,
                            obscureText: false,
                            validator: (noHP){
                              if(noHP!.isEmpty){
                                return 'Please enter your Phone number';
                              }
                              nomor_hp = noHP;
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Nomor HP',
                              labelStyle:
                              MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
                                final Color color = states.contains(
                                    MaterialState.error)
                                    ? Theme
                                    .of(context)
                                    .errorColor
                                    : Color(0xFF57636C);
                                return TextStyle(
                                  fontFamily: 'Outfit',
                                  color: color,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                );
                              }),

                              hintText: 'Nomor HP',
                              hintStyle:
                              MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
                                final Color color = states.contains(
                                    MaterialState.error)
                                    ? Theme
                                    .of(context)
                                    .errorColor
                                    : Color(0xFF57636C);
                                return TextStyle(
                                  fontFamily: 'Outfit',
                                  color: color,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                );
                              }),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 0,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 0,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  24, 24, 20, 24),
                            ),
                            style:
                            MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
                              final Color color = states.contains(
                                  MaterialState.error)
                                  ? Theme
                                  .of(context)
                                  .errorColor
                                  : Color(0xFF57636C);
                              return TextStyle(
                                fontFamily: 'Outfit',
                                color: color,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              );
                            }),
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 12, 24, 0),
                        child: Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5,
                                color: Color(0x4D101213),
                                offset: Offset(0, 2),
                              )
                            ],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextFormField(
                            controller: passwordController,
                            obscureText: !passwordVisibility,
                            validator: (pass){
                            if(pass!.isEmpty){
                              return 'Please enter your password';
                            }
                            password = pass;
                            return null;
                          },
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle:
                              MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
                                final Color color = states.contains(
                                    MaterialState.error)
                                    ? Theme
                                    .of(context)
                                    .errorColor
                                    : Color(0xFF57636C);
                                return TextStyle(
                                  fontFamily: 'Outfit',
                                  color: color,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                );
                              }),
                              hintText: 'Please enter your password...',
                              hintStyle:
                              MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
                                final Color color = states.contains(
                                    MaterialState.error)
                                    ? Theme
                                    .of(context)
                                    .errorColor
                                    : Color(0xFF57636C);
                                return TextStyle(
                                  fontFamily: 'Outfit',
                                  color: color,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                );
                              }),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 0,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 0,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  24, 24, 20, 24),
                              suffixIcon: InkWell(
                                onTap: () => setState(
                                      () =>
                                  passwordVisibility = !passwordVisibility,
                                ),
                                focusNode: FocusNode(skipTraversal: true),
                                child: Icon(
                                  passwordVisibility
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: Color(0xFF57636C),
                                  size: 22,
                                ),
                              ),
                            ),
                            style:
                            MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
                              final Color color = states.contains(
                                  MaterialState.error)
                                  ? Theme
                                  .of(context)
                                  .errorColor
                                  : Color(0xFF0F1113);
                              return TextStyle(
                                fontFamily: 'Outfit',
                                color: color,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              );
                            }),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 12, 24, 0),
                        child: Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5,
                                color: Color(0x4D101213),
                                offset: Offset(0, 2),
                              )
                            ],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextFormField(
                            controller: password2Controller,
                            obscureText: !password2Visibility,
                            validator: (pass2){
                              if(pass2!.isEmpty){
                                return 'Please enter your Phone number';
                              }
                              password2 = pass2;
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Confirm Password',
                              labelStyle:
                              MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
                                final Color color = states.contains(
                                    MaterialState.error)
                                    ? Theme
                                    .of(context)
                                    .errorColor
                                    : Color(0xFF57636C);
                                return TextStyle(
                                  fontFamily: 'Outfit',
                                  color: color,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                );
                              }),
                              hintText: 'Please enter your password...',
                              hintStyle:
                              MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
                                final Color color = states.contains(
                                    MaterialState.error)
                                    ? Theme
                                    .of(context)
                                    .errorColor
                                    : Color(0xFF57636C);
                                return TextStyle(
                                  fontFamily: 'Lexend Deca',
                                  color: color,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                );
                              }),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 0,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 0,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  24, 24, 20, 24),
                              suffixIcon: InkWell(
                                onTap: () => setState(
                                      () => password2Visibility =
                                  !password2Visibility,
                                ),
                                focusNode: FocusNode(skipTraversal: true),
                                child: Icon(
                                  password2Visibility
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: Color(0xFF57636C),
                                  size: 22,
                                ),
                              ),
                            ),
                            style:MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
                              final Color color = states.contains(
                                  MaterialState.error)
                                  ? Theme
                                  .of(context)
                                  .errorColor
                                  : Color(0xFF0F1113);
                              return TextStyle(
                                fontFamily: 'Outfit',
                                color: color,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              );
                            }),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 14, 24, 0),
                        child: Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5,
                                color: Color(0x4D101213),
                                offset: Offset(0, 2),
                              )
                            ],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextFormField(
                            controller: nameController,
                            obscureText: false,
                            validator: (nama){
                              if(nama!.isEmpty){
                                return 'Please enter your Phone number';
                              }
                              name = nama;
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Nama Lengkap',
                              labelStyle:
                              MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
                                final Color color = states.contains(
                                    MaterialState.error)
                                    ? Theme
                                    .of(context)
                                    .errorColor
                                    : Color(0xFF57636C);
                                return TextStyle(
                                  fontFamily: 'Outfit',
                                  color: color,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                );
                              }),
                              hintText: 'Nama Lengkap',
                              hintStyle: MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
                                final Color color = states.contains(
                                    MaterialState.error)
                                    ? Theme
                                    .of(context)
                                    .errorColor
                                    : Color(0xFF57636C);
                                return TextStyle(
                                  fontFamily: 'Outfit',
                                  color: color,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                );
                              }),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 0,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 0,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  24, 24, 20, 24),
                            ),
                            style:
                            MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
                              final Color color = states.contains(
                                  MaterialState.error)
                                  ? Theme
                                  .of(context)
                                  .errorColor
                                  : Color(0xFF0F1113);
                              return TextStyle(
                                fontFamily: 'Outfit',
                                color: color,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              );
                            }),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 14, 24, 0),
                        child: Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5,
                                color: Color(0x4D101213),
                                offset: Offset(0, 2),
                              )
                            ],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextFormField(
                            controller: alamatController,
                            obscureText: false,
                            validator: (alm){
                              if(alm!.isEmpty){
                                return 'Please enter your Address';
                              }
                              alamat = alm;
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Alamat',
                              labelStyle:
                              MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
                                final Color color = states.contains(
                                    MaterialState.error)
                                    ? Theme
                                    .of(context)
                                    .errorColor
                                    : Color(0xFF57636C);
                                return TextStyle(
                                  fontFamily: 'Outfit',
                                  color: color,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                );
                              }),
                              hintText: 'Alamat',
                              hintStyle:
                              MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
                                final Color color = states.contains(
                                    MaterialState.error)
                                    ? Theme
                                    .of(context)
                                    .errorColor
                                    : Color(0xFF57636C);
                                return TextStyle(
                                  fontFamily: 'Outfit',
                                  color: color,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                );
                              }),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 0,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 0,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  24, 24, 20, 24),
                            ),
                            style:
                            MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
                              final Color color = states.contains(
                                  MaterialState.error)
                                  ? Theme
                                  .of(context)
                                  .errorColor
                                  : Color(0xFF0F1113);
                              return TextStyle(
                                fontFamily: 'Outfit',
                                color: color,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              );
                            }),
                            keyboardType: TextInputType.streetAddress,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 14, 24, 0),
                        child: Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5,
                                color: Color(0x4D101213),
                                offset: Offset(0, 2),
                              )
                            ],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child:

                          DropdownButton<String>(
                            items: <String>['Pria', 'Wanita'] .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child:Container(
                                  width:180,
                                  height:50,             //expand here
                                  child:Text(value),
                                ),
                              );
                            }).toList(),
                            onChanged: (val) =>
                                setState(() => kelaminValue = val!),
                            hint :
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(12, 20, 12, 4),
                                  child: Container(
                                    width: 180,
                                    height: 50,
                                    color: Colors.white,
                                    child: Text(
                                      "Kelamin",
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                            elevation: 2,
                            /*
                            borderColor: Colors.transparent,
                            borderWidth: 0,
                            borderRadius: 0,
                            margin:
                            EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),*/
                            underline: SizedBox(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 14, 24, 0),
                        child: Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5,
                                color: Color(0x4D101213),
                                offset: Offset(0, 2),
                              )
                            ],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 10, 10, 10),
                                  child:
                                  TextButton(
                                      onPressed: () {
                                        DatePicker.showDatePicker(context,
                                            showTitleActions: true,
                                            onConfirm: (date) {
                                              datePicked = date;
                                            }, currentTime: DateTime.now(), locale: LocaleType.id);
                                      },
                                      child: Text(
                                        'Tanggal Lahir',
                                        style: MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
                                          final Color color = states.contains(
                                              MaterialState.error)
                                              ? Theme
                                              .of(context)
                                              .errorColor
                                              : Color(0xFF0F1113);
                                          return TextStyle(
                                            fontFamily: 'Outfit',
                                            color: color,
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          );
                                        }),
                                      ),
                                  ),
                                ),
                              ),
                          ),
                        ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 14, 24, 0),
                        child: Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5,
                                color: Color(0x4D101213),
                                offset: Offset(0, 2),
                              )
                            ],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextFormField(
                            controller: gajiPokokController,
                            obscureText: false,
                            validator: (gj){
                              if(gj!.isEmpty){
                                return 'Please enter your Phone number';
                              }
                              gaji = int.parse(gj);
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Gaji Pokok',
                              labelStyle:
                              MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
                                final Color color = states.contains(
                                    MaterialState.error)
                                    ? Theme
                                    .of(context)
                                    .errorColor
                                    : Color(0xFF57636C);
                                return TextStyle(
                                  fontFamily: 'Outfit',
                                  color: color,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                );
                              }),
                              hintText: 'Gaji Pokok',
                              hintStyle: MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
                                final Color color = states.contains(
                                    MaterialState.error)
                                    ? Theme
                                    .of(context)
                                    .errorColor
                                    : Color(0xFF57636C);
                                return TextStyle(
                                  fontFamily: 'Outfit',
                                  color: color,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                );
                              }),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 0,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 0,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  24, 24, 20, 24),
                            ),
                            style:
                            MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
                              final Color color = states.contains(
                                  MaterialState.error)
                                  ? Theme
                                  .of(context)
                                  .errorColor
                                  : Color(0xFF0F1113);
                              return TextStyle(
                                fontFamily: 'Outfit',
                                color: color,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              );
                            }),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 14, 24, 0),
                        child: Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5,
                                color: Color(0x4D101213),
                                offset: Offset(0, 2),
                              )
                            ],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child:

                          DropdownButton<String>(
                            items: <String>['Dokter', 'Apoteker', 'Dokter', 'Admin'] .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child:Container(
                                  width:180,
                                  height:50,             //expand here
                                  child:Text(value),
                                ),
                              );
                            }).toList(),
                            onChanged: (val) => setState(() => roleValue = val!),
                            hint :
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(12, 20, 12, 4),
                              child: Container(
                                width: 180,
                                height: 50,
                                color: Colors.white,
                                child: Text(
                                  "Role",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),

                            elevation: 2,
                            underline: SizedBox(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                        child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              _register();
                            }
                          },
                          child: Text('Create Account'),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(270,50),
                            primary: Color(0xFF0F1113),
                            textStyle:
                            MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
                              final Color color = states.contains(
                                  MaterialState.error)
                                  ? Theme
                                  .of(context)
                                  .errorColor
                                  : Colors.white;
                              return TextStyle(
                                fontFamily: 'Outfit',
                                color: color,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              );
                            }),
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
          ],
        ),
      ),
    );
  }

  void _register() async{
    var data = {
      'name' : name,
      'nomor_hp' : nomor_hp,
      'role':roleValue,
      'password' : password,
      'password2' : password2,
      'tanggal_lahir' : datePicked.toString(),
      'alamat' : alamat,
      'kelamin' : kelaminValue,
      'gaji_pokok' : gaji
    };
    print(data);
    print("REGSITERED");
    var res = await Network().post(data, '/register');
    var body = jsonDecode(res.body);
    print(res.body);
    if(body != null) {
      print(body['message']);
      if (body['success']) {
        print("SUCCESS");
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setString('token', json.encode(body['token']));
        localStorage.setString('user', json.encode(body['user']));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DashboardWidget()),
        );
      }
    }

  }

}
