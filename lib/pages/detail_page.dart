import 'package:discoverui/reuseablewidget/BigTextApp.dart';
import 'package:discoverui/reuseablewidget/app_button.dart';
import 'package:discoverui/reuseablewidget/app_text.dart';
import 'package:discoverui/reuseablewidget/reuseable_app_button.dart';
import 'package:discoverui/util/appcolor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

int selectedIndex = 0;

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              child: Container(
                height: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/mountain.jpeg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 50,
              left: 5,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 290),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.more_vert,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 310,
              child: Container(
                padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          BigTextApp(text: "Yosemite"),
                          Expanded(child: Container()),
                          BigTextApp(
                            text: "\$250",
                            color: AppColor.mainColor,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.black54,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          AppText(
                            text: "USA, Columbia",
                            color: AppColor.mainColor.withOpacity(0.6),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      child: Row(
                        children: [
                          Row(
                            children: List.generate(
                                4,
                                (index) => Icon(
                                      Icons.star,
                                      color: Colors.orangeAccent.shade200,
                                    )),
                          ),
                          Icon(
                            Icons.star_border_outlined,
                            color: AppColor.starColor,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          AppText(text: "(4.0)"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    BigTextApp(
                      text: "People",
                      color: Colors.black.withOpacity(0.8),
                      size: 22,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    AppText(text: "Number of people in your group"),
                    SizedBox(
                      height: 10,
                    ),
                    Wrap(
                      children: List.generate(5, (index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: ReuseableAppButton(
                            size: 50,
                            backgroundColor: selectedIndex == index
                                ? Colors.black
                                : AppColor.buttonBackground,
                            borderColor: selectedIndex == index
                                ? Colors.black
                                : AppColor.buttonBackground,
                            text: (index + 1).toString(),
                            color: selectedIndex == index
                                ? Colors.white
                                : Colors.black,
                          ),
                        );
                      }),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    BigTextApp(
                      text: "Description",
                      color: Colors.black.withOpacity(0.8),
                      size: 22,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AppText(
                      text:
                          "Yosemite national park is located in central serria nevada in the US star of Callefonia . It is located near the wild protected areas",
                      color: AppColor.textColor2,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ReuseableAppButton(
                    color: AppColor.textColor1,
                    size: 60,
                    backgroundColor: Colors.white,
                    borderColor: AppColor.textColor1,
                    isIcon: true,
                    icon: Icons.favorite_border_outlined,
                  ),
                  AppButton(
                    isResponsive: true,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

// don't need it because of List.genarate
class RoundMaterialButton extends StatelessWidget {
  final String text;
  final void Function()? onpressed;
  final Color color;
  RoundMaterialButton(
      {required this.text, this.onpressed, required this.color});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onpressed,
      child: Text(text),
      elevation: 2.0,
      constraints: BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),
      fillColor: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    );
  }
}
