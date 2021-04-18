import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xcelpros_assignment/constants/StringConstants.dart';
import 'package:xcelpros_assignment/view/room.dart';
import 'package:xcelpros_assignment/widgets/bottom_sheet_widget.dart';

class ControlPanel extends StatefulWidget {
  ControlPanelState createState() => ControlPanelState();
}

class ControlPanelState extends State<ControlPanel> {
  final List arrProducts = [
    {"icon": "assets/bed.png", "name": "Bed Room", "lights": "4 Lights"},
    {"icon": "assets/room.png", "name": "Living Room", "lights": "2 Lights"},
    {"icon": "assets/kitchen.png", "name": "Kitchen", "lights": "5 Lights"},
    {"icon": "assets/bathtube.png", "name": "Bathroom", "lights": "1 Light"},
    {"icon": "assets/house.png", "name": "Outdoor", "lights": "5 Lights"},
    {"icon": "assets/balcony.png", "name": "Balcont", "lights": "2 Lights"},
  ];

  @override
  Widget build(BuildContext context) {
    var header = Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width,
      child: Container(
        padding: EdgeInsets.all(30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  StringConstants.strControl,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 5),
                Flexible(
                    child: Text(
                  StringConstants.strPanel,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                )),
              ],
            ),
            Image.asset(StringConstants.strUserAssetPath)
          ],
        ),
      ),
    );

    return Scaffold(
      bottomSheet: BottomSheetWidget(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.contain,
            alignment: Alignment.topRight,
            image: AssetImage(
              StringConstants.strBackgroundAssetPath,
            ),
          ),
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
            header,
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 20, right: 20, top: 5),
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        StringConstants.strAllRooms,
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF012024),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: buildGridView(),
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

  GridView buildGridView() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 250,
        childAspectRatio: 2 / 1.8,
        crossAxisSpacing: 30,
        mainAxisSpacing: 30,
      ),
      itemCount: arrProducts.length,
      itemBuilder: (BuildContext ctx, index) {
        return buildRoomContainer(index);
      },
    );
  }

  GestureDetector buildRoomContainer(int index) {
    return GestureDetector(
      onTap: () => {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => Room(arrProducts[index]),
          ),
        ),
      },
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              arrProducts[index]['icon'],
              width: 40,
              alignment: Alignment.topLeft,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              arrProducts[index]['name'],
              style: TextStyle(
                color: Color(0xFF3B0E03),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Flexible(
              child: Text(
                arrProducts[index]['lights'],
                style: TextStyle(
                  color: Colors.amber.shade900,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
