import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xcelpros_assignment/constants/StringConstants.dart';
import 'package:xcelpros_assignment/view/loading_screen.dart';
import 'package:xcelpros_assignment/widgets/ButtonWidget.dart';
import 'package:xcelpros_assignment/widgets/TextFieldWidget.dart';

class SignUp extends StatefulWidget {
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  final signUpFormKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  bool bIsSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF012024),
              Color(0xFF013F47),
              Color(0xFF035863),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  alignment: Alignment.topRight,
                  image: AssetImage(
                    StringConstants.strSignUpBackgroundImagePath,
                  ),
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width,
              child: Container(
                padding: EdgeInsets.only(
                  top: 40,
                  left: 20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Row(
                        children: [
                          Icon(
                            CupertinoIcons.back,
                            color: Colors.white,
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            StringConstants.strBack,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        StringConstants.strCreateNewAccount,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Form(
                  key: signUpFormKey,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        TextFieldWidget(
                          StringConstants.strUserName,
                          StringConstants.strUserNameAssetPath,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFieldWidget(
                          StringConstants.strPassword,
                          StringConstants.strPasswordAssetPath,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFieldWidget(
                          StringConstants.strEmail,
                          StringConstants.strEmailAssetPath,
                          strValidationType: "EmailValidation",
                          nIconSize: 16,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: bIsSelected,
                              onChanged: (value) => {
                                if (this.bIsSelected)
                                  setState(() => this.bIsSelected = false)
                                else
                                  setState(() => this.bIsSelected = true)
                              },
                            ),
                            Text(
                              StringConstants.strAccepted,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Flexible(
                                child: Text(
                              StringConstants.strTermsAndConditions,
                              style: TextStyle(
                                color: Colors.teal,
                                fontWeight: FontWeight.w400,
                              ),
                            )),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () => {
                            if (signUpFormKey.currentState!.validate())
                              {
                                if (bIsSelected)
                                  {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (BuildContext oContext) =>
                                            LoadingScreen(),
                                      ),
                                    )
                                  }
                                else
                                  scaffoldKey.currentState!.showSnackBar(
                                    new SnackBar(
                                      backgroundColor: Colors.red,
                                      content: Text(
                                        StringConstants
                                            .strSelectTermsAndConditionError,
                                      ),
                                    ),
                                  )
                              }
                          },
                          child: ButtonWidget(StringConstants.strSignUp),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
