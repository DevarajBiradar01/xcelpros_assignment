import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xcelpros_assignment/constants/StringConstants.dart';
import 'package:xcelpros_assignment/view/loading_screen.dart';
import 'package:xcelpros_assignment/view/signup.dart';
import 'package:xcelpros_assignment/widgets/ButtonWidget.dart';
import 'package:xcelpros_assignment/widgets/TextFieldWidget.dart';

class Login extends StatefulWidget {
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  final loginFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.topRight,
                  scale: 1,
                  image: AssetImage(
                    StringConstants.strLoginBackgroundImagePath,
                  ),
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              child: Container(
                padding: EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.25,
                    ),
                    Text(
                      StringConstants.strUnderScore,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      StringConstants.strWelcome,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 5),
                    Flexible(
                      child: Text(
                        StringConstants.strRoomControl,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Form(
                  key: loginFormKey,
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
                          bIsObscureText: true,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        GestureDetector(
                          child: ButtonWidget(
                            StringConstants.strSignIn,
                          ),
                          onTap: () => {
                            if (loginFormKey.currentState!.validate())
                              {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext oContext) =>
                                        LoadingScreen(),
                                  ),
                                )
                              }
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              StringConstants.strDontHaveAccount,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              child: Text(
                                StringConstants.strSignUp,
                                style: TextStyle(
                                  color: Colors.teal,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onTap: () => {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext oContext) =>
                                        SignUp(),
                                  ),
                                )
                              },
                            ),
                          ],
                        )
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
