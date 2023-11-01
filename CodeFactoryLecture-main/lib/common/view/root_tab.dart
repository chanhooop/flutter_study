import 'package:api_example/common/const/colors.dart';
import 'package:api_example/common/layout/default_layout.dart';
import 'package:api_example/restaurant/view/restaurant_screen.dart';
import 'package:flutter/material.dart';

class RootTab extends StatefulWidget {
  const RootTab({Key? key}) : super(key: key);

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  int index = 0;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 4, vsync: this);
    controller.addListener(tabListener);
  }

  void tabListener(){
    setState(() {
      index = controller
          .index;
    });
  }

  @override
  void dispose() {
    controller.removeListener(tabListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '코팩 딜리버리',
      child: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller:controller,
        children: [
          RestaurantScreen(),
          Container(
            child: Text("음식"),
          ),
          Container(),
          Container(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
      selectedItemColor: PRIMARY_COLOR,
      unselectedItemColor: BODY_TEXT_COLOR,
      selectedFontSize: 10,
      unselectedFontSize: 10,
      type: BottomNavigationBarType.shifting,
      onTap: (int i) {
        controller.animateTo(i);
      },
      currentIndex: index,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
        BottomNavigationBarItem(icon: Icon(Icons.fastfood), label: '음식'),
        BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: '주문'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: '프로필'),
      ],
    ),);
  }
}
