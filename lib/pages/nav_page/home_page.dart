import 'package:discoverui/reuseablewidget/BigTextApp.dart';
import 'package:discoverui/reuseablewidget/app_text.dart';
import 'package:discoverui/util/appcolor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    "balloning.png": "Balloning",
    "hiking.png": "Hiking",
    "kayaking.png": "Kayaking",
    "snorkling.png": "Snorkling"
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Menubar&button
          Container(
            margin: EdgeInsets.only(top: 70, left: 20),
            child: Row(
              children: [
                Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.black,
                ),
                Expanded(child: Container()),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.mainColor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          //Dicover Text
          Container(
            margin: EdgeInsets.only(left: 20),
            child: BigTextApp(text: "Discover"),
          ),
          SizedBox(
            height: 20,
          ),
          //Tab_Bar
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                  labelPadding: EdgeInsets.only(left: 20, right: 20),
                  controller: _tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator:
                      CirclularIndicator(color: AppColor.mainColor, radius: 4),
                  tabs: [
                    Tab(
                      text: "Places",
                    ),
                    Tab(
                      text: "Inspiration",
                    ),
                    Tab(
                      text: "Emotions",
                    ),
                  ]),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            height: 300,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(right: 10, top: 10),
                      height: 300,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage("assets/images/mountain.jpeg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
                Text("there"),
                Text("bye"),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          //Explore more and see all Text
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: BigTextApp(
                    text: "Explore More",
                    size: 22,
                  ),
                ),
                Container(
                  child: AppText(
                    text: "See all",
                    color: AppColor.textColor1,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          //map's keys and values in ListVIew builder
          Container(
            height: 105,
            width: double.maxFinite,
            margin: EdgeInsets.only(left: 20),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (_, index) {
                  return Container(
                    margin: EdgeInsets.only(right: 30),
                    child: Column(
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/" +
                                      images.keys.elementAt(index),
                                ),
                                fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: AppText(
                            text: images.values.elementAt(index),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

//customize dot indicators
class CirclularIndicator extends Decoration {
  final Color color;
  double radius;
  CirclularIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CircularPaint(color: color, radius: radius);
  }
}

class _CircularPaint extends BoxPainter {
  final Color color;
  double radius;
  _CircularPaint({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    // TODO: implement paint
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}
