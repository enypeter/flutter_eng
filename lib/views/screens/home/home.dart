import 'package:flutter/material.dart';
import 'package:flutter_engr/core/color.dart';
import 'package:flutter_engr/core/const.dart';
import 'package:flutter_engr/views/screens/home/receipt.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool isNew = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: GestureDetector(
        onTap: () => setState(() => isNew = !isNew),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
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
                              const SizedBox(width: 10),
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Hi!',
                                      style: TextStyle(
                                          color: AppColor.white, fontSize: 14),
                                    ),
                                    Text(
                                      'Abayomi',
                                      style: TextStyle(
                                          color: AppColor.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Stack(
                          children: [
                            SvgPicture.asset('assets/icons/notification.svg',
                                height: 25, color: AppColor.white),
                            const Icon(
                              Icons.circle,
                              size: 10,
                              color: AppColor.red,
                            )
                          ],
                        ),
                      ],
                    ),
                    smallerVerticalSpace(),
                    Container(
                      height: Get.height * 0.16,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.white,
                          boxShadow: [
                            BoxShadow(
                                color: AppColor.grey.withOpacity(0.1),
                                offset: const Offset(1, 1),
                                spreadRadius: 2,
                                blurRadius: 2),
                            BoxShadow(
                                color: AppColor.grey.withOpacity(0.1),
                                offset: const Offset(-1, 1),
                                spreadRadius: 2,
                                blurRadius: 2),
                          ]),
                      child: const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Available Balance',
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: AppColor.secondaryColor,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Icon(
                                        Icons.visibility_outlined,
                                        size: 18,
                                        color: AppColor.secondaryColor,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '₦50,000.00',
                                    style: TextStyle(
                                        fontSize: 24,
                                        color: AppColor.secondaryColor,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Spacer(),
                                  Text(
                                    'Total Balance',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColor.secondaryColor,
                                    ),
                                  ),
                                  Text(
                                    '₦58,000.00',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: AppColor.secondaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Spacer(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Account Number',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: AppColor.secondaryColor,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Icon(
                                      Icons.copy_all,
                                      color: AppColor.secondaryColor,
                                      size: 12,
                                    )
                                  ],
                                ),
                                Text(
                                  '007628834',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColor.secondaryColor,
                                  ),
                                ),
                              ],
                            ))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                topOptions(
                                    onTap: () {},
                                    title: 'Send Money',
                                    icon: 'assets/icons/send.svg'),
                                smallHorizontalSpace(),
                                topOptions(
                                  onTap: () {},
                                  turn: 2,
                                  title: 'Add Money',
                                  icon: 'assets/icons/send.svg',
                                )
                              ],
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 30),
                decoration: const BoxDecoration(
                    color: AppColor.backgroundColor,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30.0))),
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Transaction history',
                              style: TextStyle(
                                  color: AppColor.textColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'See all',
                              style: TextStyle(
                                  color: AppColor.primaryColor, fontSize: 14),
                            ),
                          ],
                        ),
                        Expanded(
                            child: ListView.separated(
                                padding: const EdgeInsets.only(top: 20),
                                shrinkWrap: true,
                                itemBuilder: (c, i) => historyItem(
                                    isCredit: i.isOdd ? false : true),
                                separatorBuilder: (c, i) => Column(
                                      children: [
                                        Row(
                                          children: [
                                            horizontalSpace(0.13),
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  vTinyHorizontalSpace(),
                                                  const Divider(),
                                                  vTinyHorizontalSpace(),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                itemCount: 5)),
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget historyItem({bool isCredit = true}) {
    return InkWell(
      onTap: () => Get.to(() => const Receipt()),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                    color: isCredit ? AppColor.green : AppColor.red,
                    width: 0.6),
                shape: BoxShape.circle),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                'assets/icons/${isCredit ? 'in' : 'out'}.svg',
                height: 20,
                width: 20,
                color: isCredit ? AppColor.green : AppColor.red,
              ),
            ),
          ),
          tinyHorizontal15Space(),
          const Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Transfer to bank',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              Text('9th Aug., 09:10 AM',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300)),
            ],
          )),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${isCredit ? '+' : '-'} ₦1,500.00',
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              const Text('Successful',
                  style: TextStyle(
                      fontSize: 13,
                      color: AppColor.green,
                      fontWeight: FontWeight.w300)),
            ],
          )),
        ],
      ),
    );
  }

  Widget topOptions({onTap, icon, title, int turn = 0}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: AppColor.primaryColor.withOpacity(0.1),
              border: Border.all(color: AppColor.white),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RotatedBox(
                    quarterTurns: turn,
                    child: SvgPicture.asset(icon,
                        height: 25, color: AppColor.white)),
                const SizedBox(width: 5),
                Text(
                  title,
                  style: const TextStyle(color: AppColor.white, fontSize: 14),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
