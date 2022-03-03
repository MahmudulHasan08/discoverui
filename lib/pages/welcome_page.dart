import 'package:discoverui/reuseablewidget/BigTextApp.dart';
import 'package:discoverui/reuseablewidget/app_button.dart';
import 'package:discoverui/reuseablewidget/app_text.dart';
import 'package:discoverui/util/appcolor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/" + images[index],
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                padding: EdgeInsets.only(top: 100, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigTextApp(text: "Trips"),
                        AppText(
                          text: "Mountain",
                          size: 30,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 250,
                          child: AppText(
                            text:
                                "Mountain hikes give you an incridble sense of freedom along with endurence tests ",
                            color: AppColor.textColor2,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        AppButton(
                          width: 120,
                        ),
                      ],
                    ),
                    Column(
                      children: List.generate(
                          3,
                          (indexDots) => Container(
                                margin: EdgeInsets.only(bottom: 2),
                                height: index == indexDots ? 24 : 8,
                                width: 8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: indexDots == index
                                      ? AppColor.mainColor
                                      : AppColor.mainColor.withOpacity(0.5),
                                ),
                              )),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
