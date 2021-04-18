import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xcelpros_assignment/constants/StringConstants.dart';
import 'package:xcelpros_assignment/view/control_panel.dart';

class LoadingScreen extends StatefulWidget {
  LoadingScreenState createState() => LoadingScreenState();
}

class LoadingScreenState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController = AnimationController(
      duration: const Duration(milliseconds: 5000), vsync: this);

  @override
  void initState() {
    super.initState();
    animationController.repeat();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => ControlPanel()));
    });
  }

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
                  fit: BoxFit.cover,
                  alignment: Alignment.topRight,
                  scale: 1,
                  image: AssetImage(
                    StringConstants.strLoginBackgroundImagePath,
                  ),
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              child: Container(
                padding: EdgeInsets.all(0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RotationTransition(
                      turns: Tween(
                        begin: 0.0,
                        end: 0.7,
                      ).animate(animationController),
                      child: Image.asset(
                        StringConstants.strLoadingAssetPath,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      StringConstants.strGetStarted,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
