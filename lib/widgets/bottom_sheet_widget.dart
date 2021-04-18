import 'package:flutter/material.dart';
import 'package:xcelpros_assignment/constants/StringConstants.dart';

class BottomSheetWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            StringConstants.strBulbAssetPath,
            height: 40,
          ),
          Image.asset(
            StringConstants.strHomeAssetPath,
            height: 40,
          ),
          Image.asset(
            StringConstants.strSettingsAssetPath,
            height: 40,
          ),
        ],
      ),
    );
  }
}
