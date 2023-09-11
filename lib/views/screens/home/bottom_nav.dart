import 'package:flutter/material.dart';
import 'package:flutter_engr/core/color.dart';
import 'package:flutter_engr/core/const.dart';
import 'package:flutter_engr/views/screens/home/account.dart';
import 'package:flutter_engr/views/screens/home/home.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BottomNavMenu extends StatefulWidget {
  const BottomNavMenu({Key? key}) : super(key: key);

  @override
  State<BottomNavMenu> createState() => _BottomNavMenuState();
}

class _BottomNavMenuState extends State<BottomNavMenu> {
  final PageStorageBucket bucket = PageStorageBucket();
  int currentTab = 0;
  Widget currentScreen = const Dashboard();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget child = NavigationBar(currentScreen: currentScreen, bucket: bucket);

    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (context) => SingleChildScrollView(
                child: Container(
                  color: Colors.transparent,
                  width: width(),
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Column(
                    children: [
                      Container(
                          height: height() * 0.5,
                          padding: const EdgeInsets.all(BODY_PADDING),
                          margin: const EdgeInsets.all(BODY_PADDING),
                          decoration: BoxDecoration(
                              color: AppColor.backgroundColor,
                              borderRadius: BorderRadius.circular(30)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              smallerVerticalSpace(),

                            ],
                          )),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColor.primaryColor),
                          height: 65,
                          width: 65,
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      ),
                      verticalSpace(0.083),
                    ],
                  ),
                ),
              ),
            );
          },
          child: Container(
              decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  shape: BoxShape.circle,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: AppColor.secondaryColor.withOpacity(0.3),
                        offset: const Offset(-2, 2),
                        blurRadius: 2,
                        spreadRadius: 2),
                    BoxShadow(
                        color: AppColor.secondaryColor.withOpacity(0.3),
                        offset: const Offset(-2, 2),
                        blurRadius: 2,
                        spreadRadius: 2),
                    BoxShadow(
                        color: AppColor.secondaryColor.withOpacity(0.3),
                        offset: const Offset(-2, -2),
                        blurRadius: 2,
                        spreadRadius: 2),
                  ]),
              padding: const EdgeInsets.all(15),
              child: SvgPicture.asset('assets/icons/card.svg',
                  color: Colors.white, height: 40)),
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(35.0), topRight: Radius.circular(35.0)),
          child: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 10,
            elevation: 5,
            color: AppColor.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          currentScreen =
                              const Dashboard(); // if user taps on this dashboard tab will be active
                          currentTab = 0;
                        });
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/Home.svg',
                            height: 25,
                            width: 25,
                            color: currentTab == 0
                                ? AppColor.primaryColor
                                : AppColor.grey,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text('Home',
                                style: TextStyle(
                                  color: (currentTab == 0)
                                      ? AppColor.primaryColor
                                      : AppColor.grey,
                                  fontSize: 13,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          currentScreen =
                              const Account(); // if user taps on this dashboard tab will be active
                          currentTab = 1;
                        });
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/user.svg',
                              height: 25,
                              width: 25,
                              color: currentTab == 1
                                  ? AppColor.primaryColor
                                  : AppColor.grey,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Text('Account',
                                  style: TextStyle(
                                    color: (currentTab == 1)
                                        ? AppColor.primaryColor
                                        : AppColor.grey,
                                    fontSize: 13,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: child);
  }
}

class NavigationBar extends StatelessWidget {
  const NavigationBar({
    Key? key,
    required this.currentScreen,
    required this.bucket,
  }) : super(key: key);

  final Widget currentScreen;
  final PageStorageBucket bucket;

  @override
  Widget build(BuildContext context) {
    return PageStorage(
      bucket: bucket,
      child: currentScreen,
    );
  }
}
