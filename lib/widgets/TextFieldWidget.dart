import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xcelpros_assignment/constants/StringConstants.dart';

class TextFieldWidget extends StatelessWidget {
  String strHintText;
  String strAssetIcon;
  String strValidationType;
  bool bIsObscureText;
  double nIconSize;

  TextFieldWidget(
    this.strHintText,
    this.strAssetIcon, {
    this.strValidationType = "RequiredFieldValidator",
    this.bIsObscureText = false,
    this.nIconSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          strAssetIcon,
          height: nIconSize,
          fit: BoxFit.fill,
        ),
        SizedBox(
          width: 40,
        ),
        Flexible(
          child: TextFormField(
            obscureText: bIsObscureText,
            validator: (value) {
              if (value == "" || value == null) {
                return StringConstants.strRequiredFieldError;
              } else if (strValidationType == "EmailValidation") {
                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                    .hasMatch(value)) return StringConstants.strEmailFieldError;
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: strHintText,
              hintStyle: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
