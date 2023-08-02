import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../style/color.dart';

class SIPTextInput extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  SIPTextInput(
      {super.key,
      required this.label,
      required this.controller,
      this.validator});

  @override
  State<SIPTextInput> createState() => _SIPTextInputState();
}

class _SIPTextInputState extends State<SIPTextInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: false,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: TextStyle(
          fontFamily: 'Lexend Deca',
          color: Color(0xFF95A1AC),
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        hintStyle: TextStyle(
          fontFamily: 'Lexend Deca',
          color: SIPColor.primaryColor,
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0x00000000),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0x00000000),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0x00000000),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0x00000000),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
      ),
      style: TextStyle(
        fontFamily: 'Readex Pro',
        color: Color(0xFF0F1113),
      ),
      maxLines: null,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator,
    );
  }
}

class TextFieldController extends ChangeNotifier {}
