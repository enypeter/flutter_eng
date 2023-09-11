import 'package:flutter/material.dart';
import 'package:flutter_engr/core/color.dart';
import 'package:flutter_engr/core/const.dart';
import 'package:flutter_engr/views/widgets/general_widgets.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              smallerVerticalSpace(),
              Expanded(
                child: Column(
                  children: [
                    smallVerticalSpace(),
                    Row(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColor.secondaryColor),
                                  shape: BoxShape.circle,
                                  image: const DecorationImage(
                                    image: AssetImage(
                                        'assets/images/payble-mark.png'),
                                    fit: BoxFit.fill,
                                  )),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColor.white),
                                  child: const Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Icon(
                                      Icons.camera_alt,
                                      color: AppColor.primaryColor,
                                      size: 20,
                                    ),
                                  )),
                            )
                          ],
                        ),
                        smallHorizontalSpace(),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Damilare Peter",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700),
                              ),
                              const Row(
                                children: [
                                  Text("007696688",
                                      style: TextStyle(fontSize: 15)),
                                  Padding(
                                    padding: EdgeInsets.all(3.0),
                                    child: Icon(
                                      Icons.copy_all,
                                      size: 15,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 5),
                              Container(
                                  decoration: BoxDecoration(
                                      color: AppColor.secondaryColor,
                                      borderRadius: BorderRadius.circular(4)),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 2.0, horizontal: 15),
                                    child: Text("Tear 3",
                                        style: TextStyle(
                                            color: AppColor.white,
                                            fontSize: 13)),
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                    smallVerticalSpace(),
                    settingCard(
                        image: 'assets/images/user(1).png',
                        title: 'Profile',
                        onTap: () async {}),
                    smallerVerticalSpace(),
                    settingCard(
                        image: 'assets/images/setting_line.png',
                        title: 'Settings',
                        onTap: () async {}),
                    smallerVerticalSpace(),
                    settingCard(
                        image: 'assets/images/headset.png',
                        title: 'Support',
                        onTap: () async {}),
                    smallerVerticalSpace(),
                    settingCard(
                        image: 'assets/images/referal.png',
                        title: 'Referral',
                        onTap: () async {}),
                    smallerVerticalSpace(),
                    settingCard(
                        image: 'assets/images/Shield Done.png',
                        title: 'Privacy',
                        onTap: () async {}),
                    smallerVerticalSpace(),
                    settingCard(
                        image: 'assets/images/logout.png',
                        title: 'Logout',
                        color: AppColor.red,
                        isLogout: true,
                        onTap: () async {}),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
