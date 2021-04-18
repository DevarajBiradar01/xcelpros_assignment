import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xcelpros_assignment/constants/StringConstants.dart';
import 'package:xcelpros_assignment/widgets/bottom_sheet_widget.dart';

class Room extends StatefulWidget {
  var oRoomProperties;
  Room(this.oRoomProperties);
  RoomState createState() => RoomState();
}

class RoomState extends State<Room> {
  Color oSelectedColor = Colors.red.shade300;
  double nIntensity = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: BottomSheetWidget(),
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
              height: MediaQuery.of(context).size.height * 0.32,
              width: MediaQuery.of(context).size.width,
              child: SizedBox(
                child: buildHeaderContainer(context),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        StringConstants.strIntensity,
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF012024),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(StringConstants.strSolutionAssetPath),
                          Slider(
                            min: 0.1,
                            max: 100.0,
                            value: nIntensity,
                            onChanged: (value) {
                              setState(() {
                                nIntensity = value;
                              });
                            },
                          ),
                          Image.asset(StringConstants.strSurface2AssetPath)
                        ],
                      ),
                      SizedBox(height: 30),
                      Text(
                        StringConstants.strColors,
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF012024),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildColorContainer(Colors.pink.shade300),
                          buildColorContainer(Colors.green.shade300),
                          buildColorContainer(Colors.blue.shade300),
                          buildColorContainer(Colors.deepPurple.shade300),
                          buildColorContainer(Colors.purple.shade300),
                          buildColorContainer(Colors.orange.shade300),
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              child: Icon(Icons.add),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Text(
                        StringConstants.strScnes,
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF012024),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        height: 300,
                        child: GridView(
                          shrinkWrap: false,
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 2.2 / 1.0,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                          ),
                          children: [
                            buildGradientMenu(
                              StringConstants.strBirthday,
                              Colors.red.shade400,
                              Colors.red.shade300,
                              Colors.red.shade200,
                            ),
                            buildGradientMenu(
                              StringConstants.strParty,
                              Colors.deepPurple.shade400,
                              Colors.deepPurple.shade300,
                              Colors.deepPurple.shade200,
                            ),
                            buildGradientMenu(
                              StringConstants.strRelax,
                              Colors.blue.shade400,
                              Colors.blue.shade300,
                              Colors.blue.shade200,
                            ),
                            buildGradientMenu(
                              StringConstants.strFun,
                              Colors.green.shade400,
                              Colors.green.shade300,
                              Colors.green.shade200,
                            ),
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
    );
  }

  buildGradientMenu(String strMenuName, Color oBeginColor, Color oMiddleColor,
      Color oEndColor) {
    return Container(
      alignment: Alignment.center,
      height: 30,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        gradient: LinearGradient(
          colors: [
            oBeginColor,
            oMiddleColor,
            oEndColor,
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            StringConstants.strSurface1AssetPath,
          ),
          Flexible(
            child: Text(
              strMenuName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildColorContainer(Color oColor) {
    return GestureDetector(
      onTap: () => {
        setState(() {
          oSelectedColor = oColor;
        })
      },
      child: CircleAvatar(
        radius: 20,
        child: Container(
          decoration: BoxDecoration(
            color: oColor,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
      ),
    );
  }

  Container buildHeaderContainer(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 35, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: buildHeader(),
                  ),
                  Container(
                    child: Text(
                      StringConstants.strRoom,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: Text(
                      widget.oRoomProperties['lights'],
                      style: TextStyle(
                        color: Colors.amber.shade400,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Image.asset(
                    StringConstants.strLampAssetPath,
                    height: 80,
                    width: 200,
                    fit: BoxFit.contain,
                    color: Colors.white70,
                  ),
                  Container(
                    width: 20,
                    height: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40.0),
                          bottomRight: Radius.circular(40.0)),
                      color: oSelectedColor.withOpacity(nIntensity / 100),
                      boxShadow: [
                        BoxShadow(
                          color: oSelectedColor,
                          blurRadius: 20.8,
                        ), //BoxShadow
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 80,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                buildMenuContainer(
                  StringConstants.strSurface2AssetPath,
                  StringConstants.strMainLight,
                ),
                buildMenuContainer(
                  StringConstants.strFurnitureAssetPath,
                  StringConstants.strDeskLights,
                  bIsWhiteBackground: false,
                ),
                buildMenuContainer(
                  StringConstants.strBed1AssetPath,
                  StringConstants.strBedLights,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container buildMenuContainer(String strAssetImage, String strMenuName,
      {bool bIsWhiteBackground = true}) {
    return Container(
      margin: EdgeInsets.only(top: 20, right: 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: bIsWhiteBackground ? Colors.white : Colors.teal,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(
        children: [
          Image.asset(strAssetImage),
          SizedBox(width: 10),
          Text(
            strMenuName,
            style: TextStyle(
              color: bIsWhiteBackground ? Colors.teal : Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Row buildHeader() {
    return Row(
      children: [
        Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 25,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          StringConstants.strBed,
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ],
    );
  }
}
