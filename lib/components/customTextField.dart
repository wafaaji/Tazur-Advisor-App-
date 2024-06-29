import 'package:advisor_graduation_project/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final InputDecoration decoration;
  final String? defaultText;
  final Color hintColor;
  final double hintSize;
  final bool useEnabledBorder;

  CustomTextField({
    required this.controller,
    required this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.onSaved,
    this.validator,
    required this.decoration,
    this.defaultText,
    this.hintColor = primaryBlackColor,
    this.hintSize = 16,
    this.useEnabledBorder = true,
  }) : assert(obscureText == false || defaultText == null,
  "Cannot set defaultText when obscureText is true.");

  @override
  Widget build(BuildContext context) {

    final isMultiline = keyboardType == TextInputType.multiline;

    if (defaultText != null && controller.text.isEmpty) {
      controller.text = defaultText!;
    }

    return Container(
      decoration: BoxDecoration(
        color: primaryWhiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            obscureText: obscureText,
            onSaved: onSaved,
            validator: validator,
            decoration: decoration.copyWith(
              hintText: decoration.hintText,
              hintStyle: TextStyle(
                  color: hintColor,
                fontFamily: 'Roboto',
                fontSize: hintSize,
              ),
              enabledBorder: useEnabledBorder ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(
                  color: primaryBlackColor.withOpacity(0.50),
                ),
              ): InputBorder.none,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(
                    color: primaryGreenColor,
                    width: 2.0
                ),
              ),
              contentPadding: isMultiline
                  ? EdgeInsets.symmetric(vertical: 10.0, horizontal: 10)
                  : null,
              alignLabelWithHint: isMultiline,
            ),
            cursorColor: primaryGreenColor,
            maxLines: isMultiline ? null : 1,
          ),

      ),
    );
  }
}
