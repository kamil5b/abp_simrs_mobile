import 'dart:convert';

import 'package:abp_simrs_mobile/api.dart';
import 'package:abp_simrs_mobile/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:abp_simrs_mobile/register.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({Key? key}) : super(key: key);

  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  late TextEditingController emailAddressController;
  late TextEditingController passwordController;
  late bool passwordVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  late String nomor_hp,password;
  @override
  void initState() {
    super.initState();
    emailAddressController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF4B39EF),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          color: Color(0xFFEEEEEE),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 70, 0, 90),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Icon(
                          Icons.medical_services,
                          color: Color(0xFFF8446C),
                          size: 175,
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: emailAddressController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Nomor HP',
                            labelStyle:
                              MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
                                final Color color = states.contains(
                                    MaterialState.error)
                                    ? Theme
                                    .of(context)
                                    .errorColor
                                    : Color(0xFF95A1AC);
                                return TextStyle(
                                  fontFamily: 'Lexend Deca',
                                  color: color,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                );
                              }),
                            hintText: 'Enter your phone number here...',
                            hintStyle:
                            MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
                              final Color color = states.contains(
                                  MaterialState.error)
                                  ? Theme
                                  .of(context)
                                  .errorColor
                                  : Color(0xFF95A1AC);
                              return TextStyle(
                                fontFamily: 'Lexend Deca',
                                color: color,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              );
                            }),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFDBE2E7),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFDBE2E7),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                            EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
                          ),
                          style:
                          MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
                            final Color color = states.contains(
                                MaterialState.error)
                                ? Theme
                                .of(context)
                                .errorColor
                                : Color(0xFF95A1AC);
                            return TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: color,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            );
                          }),
                          validator: (noHP){
                            if(noHP!.isEmpty){
                              return 'Please enter your Phone number';
                            }
                            nomor_hp = noHP;
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: !passwordVisibility,
                          validator: (pass){
                          if(pass!.isEmpty){
                            return 'Please enter your Password';
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
                                    : Color(0xFF95A1AC);
                                return TextStyle(
                                  fontFamily: 'Lexend Deca',
                                  color: color,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                );
                              }),
                            hintText: 'Enter your password here...',
                            hintStyle:
                            MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
                                final Color color = states.contains(
                                    MaterialState.error)
                                    ? Theme
                                    .of(context)
                                    .errorColor
                                    : Color(0xFF95A1AC);
                                return TextStyle(
                                  fontFamily: 'Lexend Deca',
                                  color: color,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                );
                              }),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFDBE2E7),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFDBE2E7),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                            EdgeInsetsDirectional.fromSTEB(16, 24, 24, 24),
                            suffixIcon: InkWell(
                              onTap: () => setState(
                                    () => passwordVisibility = !passwordVisibility,
                              ),
                              focusNode: FocusNode(skipTraversal: true),
                              child: Icon(
                                passwordVisibility
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: Color(0xFF95A1AC),
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
                                : Color(0xFF2B343A);
                            return TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: color,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              _login();
                            }
                          },
                          child: Text('Login'),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(130, 60),
                            primary: Color(0xFF090F13),
                            textStyle:
                            MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
                              final Color color = states.contains(
                                  MaterialState.error)
                                  ? Theme
                                  .of(context)
                                  .errorColor
                                  : Colors.white;
                              return TextStyle(
                                fontFamily: 'Lexend Deca',
                                color: color,
                                fontSize: 14,
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 24),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account? ',
                        style:
                        MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
                          final Color color = states.contains(
                              MaterialState.error)
                              ? Theme
                              .of(context)
                              .errorColor
                              : Color(0xFF5B5B5B);
                          return TextStyle(
                            fontFamily: 'Lexend Deca',
                            color: color,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          );
                        }),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterPageWidget(),
                            ),
                          );
                        },
                        child: Text('Register'),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(90, 30),
                          primary: Color(0xFF090F13),
                          textStyle:
                          MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
                            final Color color = states.contains(
                                MaterialState.error)
                                ? Theme
                                .of(context)
                                .errorColor
                                : Color(0xFF39D2C0);
                            return TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: color,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            );
                          }),
                          elevation: 0,
                          side: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void _login() async{
    var data = {
      'nomor_hp' : nomor_hp,
      'password' : password
    };

    var res = await Network().post(data, '/login');
    var body = jsonDecode(res.body);
    if(body['success']){
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['token']));
      localStorage.setString('user', json.encode(body['user']));
      Navigator.pushReplacement(
        context,
        new MaterialPageRoute(
            builder: (context) => DashboardWidget()
        ),
      );
    }
  }
}
