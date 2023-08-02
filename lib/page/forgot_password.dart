import 'package:flutter/material.dart';
import 'package:sipbara/controller/auth.dart';
import 'package:sipbara/helper/validator.dart';
import 'package:sipbara/style/color.dart';
import 'package:sipbara/widget/button_widget.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: SIPColor.primaryBackground,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: SIPColor.primaryText),
          elevation: 0,
          title: const Text(
            'Lupa Sandi',
            style: TextStyle(
                color: SIPColor.primaryText, fontFamily: 'Lexend Deca'),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(44, 120, 44, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Text(
                  'Dapatkan email untuk\n mengatur ulang sandi kamu!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Lexend Deca',
                    color: SIPColor.primaryText,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: emailController,
                  cursorColor: SIPColor.primaryText,
                  decoration: const InputDecoration(
                    floatingLabelStyle: TextStyle(color: SIPColor.primaryText),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: SIPColor.primaryText)),
                    labelText: 'Alamat Email',
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: emailValidator,
                ),
                const SizedBox(
                  height: 20,
                ),
                SIPEleButton(
                  onPressed: () => resetPassword(context, emailController.text),
                  textButton: 'Atur Ulang Sandi',
                  colorBg: SIPColor.secondaryColor,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
