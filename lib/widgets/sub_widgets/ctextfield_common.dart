// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

bool obSecure = false;

class cTextFieldCommon extends StatefulWidget {
  final TextEditingController? controller;
  final String? label, hint;
  String? errorText;
  TextInputType? textInputType = TextInputType.text;
  bool? obscureText;
  Function()? validate;
  bool? btnValidate = false;
  Color? fontColor;
  int? maxLines;
  int? maxLength;
  Function()? onTap;
  Color? cursorColor;
  List<TextInputFormatter>? textInputFormatter;
  Function()? onEditingComplete;
  TextCapitalization textCapitalization;

  cTextFieldCommon(
      {super.key,
      this.controller,
      this.label,
      this.hint,
      this.textInputType,
      this.errorText,
      this.obscureText = false,
      this.validate,
      this.btnValidate,
      this.onTap,
      this.maxLines,
      this.maxLength,
      this.cursorColor,
      this.onEditingComplete,
      this.textInputFormatter,
      this.textCapitalization = TextCapitalization.none,
      this.fontColor});

  @override
  State<cTextFieldCommon> createState() => _cTextFieldCommonState();
}

class _cTextFieldCommonState extends State<cTextFieldCommon> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextField(
        onTap: widget.onTap,
        onEditingComplete: widget.onEditingComplete,
        onChanged: (value) {
          if (widget.btnValidate == null) {
            null;
          } else {
            widget.btnValidate! ? widget.validate : null;
          }
        },
        maxLength: widget.maxLength,
        maxLines: widget.maxLines,
        cursorColor: widget.cursorColor,
        maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
        controller: widget.controller,
        keyboardType: widget.textInputType,
        obscureText: obSecure,
        inputFormatters: widget.textInputFormatter,
        textCapitalization: widget.textCapitalization,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: widget.fontColor ?? Colors.black,
        ),
        decoration: InputDecoration(
            errorText: widget.errorText,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0),
                borderSide:
                    const BorderSide(width: 0, color: Colors.transparent)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0),
                borderSide:
                    const BorderSide(width: 0, color: Colors.transparent)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0),
                borderSide:
                    const BorderSide(width: 0, color: Colors.transparent)),
            isCollapsed: true,
            suffixIcon: widget.obscureText!
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        obSecure = !obSecure;
                      });
                    },
                    child: Icon(
                      obSecure ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                  )
                : null,
            labelText: widget.label,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Colors.black,
            ),
            hintText: widget.hint,
            hintStyle: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: Colors.black,
            )),
      ),
    );
  }
}
