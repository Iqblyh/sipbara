import 'package:flutter/material.dart';

import '../style/color.dart';

class SIPEleButton extends StatefulWidget {
  final void Function() onPressed;
  final Color? colorBg;
  final String textButton;

  SIPEleButton(
      {super.key,
      required this.onPressed,
      required this.textButton,
      this.colorBg});

  @override
  State<SIPEleButton> createState() => _SIPEleButtonState();
}

class _SIPEleButtonState extends State<SIPEleButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.colorBg,
        minimumSize: Size(230, 50),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
      child: Text(
        widget.textButton,
        style: const TextStyle(
            fontWeight: FontWeight.w600, fontFamily: 'Readex Pro'),
      ),
    );
  }
}

class SIPEleButton_Large_Icon extends StatefulWidget {
  final void Function() onPressed;
  final Color? colorBg;
  final String textButton;
  final IconData icon;

  SIPEleButton_Large_Icon(
      {super.key,
      required this.onPressed,
      this.colorBg,
      required this.textButton,
      required this.icon});

  @override
  State<SIPEleButton_Large_Icon> createState() =>
      _SIPEleButton_Large_IconState();
}

class _SIPEleButton_Large_IconState extends State<SIPEleButton_Large_Icon> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(widget.icon),
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.colorBg,
        minimumSize: const Size(double.infinity, 50),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
      label: Text(
        widget.textButton,
        style: const TextStyle(
            fontWeight: FontWeight.w600, fontFamily: 'Readex Pro'),
      ),
    );
  }
}
