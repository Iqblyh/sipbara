import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sipbara/controller/auth.dart';
import 'package:sipbara/helper/validator.dart';
import 'package:sipbara/page/forgot_password.dart';
import 'package:sipbara/style/color.dart';
import 'package:sipbara/widget/input_widget.dart';

import '../widget/button_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height * 1,
            decoration: BoxDecoration(
              color: Color(0xFF14181B),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset('assets/images/candi1.png').image,
              ),
            ),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Color(0x990F1113),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 70, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 20),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/logo1.png',
                            width: 160,
                            height: 105,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        child: DefaultTabController(
                          length: 2,
                          initialIndex: 0,
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment(0, 0),
                                child: TabBar(
                                  isScrollable: true,
                                  labelColor: SIPColor.secondaryColor,
                                  unselectedLabelColor: SIPColor.infoColor,
                                  labelStyle: TextStyle(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  indicatorColor: SIPColor.secondaryColor,
                                  tabs: [
                                    Tab(
                                      text: 'Sign In',
                                    ),
                                    Tab(
                                      text: 'Sign Up',
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: TabBarView(
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          44, 0, 44, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 20, 0, 0),
                                            child: SIPTextInput(
                                              controller: emailController,
                                              label: 'Alamat Email',
                                              passVisible: false,
                                            ),
                                          ), //teksinput email
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 20, 0, 0),
                                            child: SIPTextInput(
                                              controller: _passwordController,
                                              label: 'Sandi',
                                              passVisible: true,
                                            ),
                                          ), //teksinput pass
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 20, 0, 0),
                                            child: SIPEleButton(
                                                textButton: 'Masuk',
                                                colorBg:
                                                    SIPColor.secondaryColor,
                                                onPressed: () => signIn(
                                                    context,
                                                    emailController.text,
                                                    _passwordController.text)),
                                          ), //button masuk
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 20, 0, 0),
                                            child: TextButton(
                                              onPressed: () =>
                                                  Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ForgotPasswordPage(),
                                                ),
                                              ),
                                              child: Text(
                                                'Lupa Sandi ?',
                                                style: TextStyle(
                                                  color: SIPColor.infoColor,
                                                  fontFamily: 'Readex Pro',
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          44, 0, 44, 0),
                                      child: SingleChildScrollView(
                                        child: Form(
                                          key: formKey,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 20, 0, 0),
                                                child: SIPTextInput(
                                                  label: 'Alamat Email',
                                                  controller: emailController,
                                                  validator: emailValidator,
                                                  passVisible: false,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 20, 0, 0),
                                                child: SIPTextInput(
                                                  label: 'Sandi',
                                                  controller:
                                                      _passwordController,
                                                  validator: passValidator,
                                                  passVisible: true,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 20, 0, 0),
                                                child: SIPTextInput(
                                                  label: 'Konfirmasi Sandi',
                                                  controller:
                                                      confirmPasswordController,
                                                  validator: (value) => value !=
                                                              null &&
                                                          value !=
                                                              _passwordController
                                                                  .text
                                                      ? 'Sandi tidak sama'
                                                      : null,
                                                  passVisible: true,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 20, 0, 0),
                                                child: SIPEleButton(
                                                  onPressed: () => signUp(
                                                      context,
                                                      emailController.text,
                                                      _passwordController.text,
                                                      formKey),
                                                  textButton: 'Daftar',
                                                  colorBg:
                                                      SIPColor.secondaryColor,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
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
            ),
          ),
        ),
      ),
    );
  }
}
