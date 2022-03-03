import 'package:discoverui/util/appcolor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_text.dart';

class AppButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  AppButton({this.width = 120, this.isResponsive});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        height: 60,
        width: isResponsive == true ? double.maxFinite : width,
        decoration: BoxDecoration(
          color: AppColor.mainColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: isResponsive == true
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            isResponsive == true
                ? Container(
                    margin: EdgeInsets.only(left: 20),
                    child: AppText(text: "Book trip now"),
                  )
                : Container(),
            Image.asset("assets/images/button-one.png"),
          ],
        ),
      ),
    );
  }
}
