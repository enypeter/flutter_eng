import 'package:flutter/material.dart';
import 'package:flutter_engr/core/const.dart';
import 'package:flutter_engr/views/widgets/button.dart';
import 'package:flutter_engr/core/color.dart';
import 'package:flutter_engr/views/widgets/custom_appbar.dart';
import 'package:flutter_engr/views/widgets/general_widgets.dart';

class Receipt extends StatelessWidget {
  const Receipt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(children: [
            const CustomAppBar(title: ''),
            Expanded(
                child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 30),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 30),
                  decoration: BoxDecoration(
                      color: AppColor.backgroundColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      tinyVerticalSpace(),
                      const Text('RECEIPT',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: 23,
                              fontWeight: FontWeight.w700)),
                      smallVerticalSpace(),
                      smallerVerticalSpace(),
                      item('Amount', '₦2,500,000'),
                      tinyVerticalSpace(),
                      item('Fee', '₦500'),
                      tinyVerticalSpace(),
                      item('Transaction ID', '7832467563966B1818'),
                      tinyVerticalSpace(),
                      item('Status', 'SUCCESS', isSuccess: true),
                      tinyVerticalSpace(),
                      item('Description', 'Fund transfer to Amulua Ezekiel'),
                      tinyVerticalSpace(),
                      item('Date', '20th Dec., 2022'),
                      tinyVerticalSpace(),
                      item('Time', '12:00AM'),
                      verticalSpace(0.05),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: DefaultButton(
                            onTap: () => openButtomSheet(context),
                            title: 'Share Receipt'),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 120,
                  left: 0,
                  right: 0,
                  child: Row(
                    children: [
                      const Icon(Icons.circle,
                          color: AppColor.primaryColor, size: 35),
                      Expanded(
                          child: Container(
                              color: AppColor.primaryColor, height: 2)),
                      const Icon(Icons.circle,
                          color: AppColor.primaryColor, size: 35),
                    ],
                  ),
                )
              ],
            )),
            smallVerticalSpace(),
          ]),
        ),
      ),
    );
  }

  openButtomSheet(context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(15))),
                height: MediaQuery.of(context).size.height * 0.4,
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      closeButton(),
                      smallVerticalSpace(),
                      const Center(
                          child:
                              Text('Share as', style: TextStyle(fontSize: 18))),
                      smallVerticalSpace(),
                      settingCard(
                        image: 'assets/images/imaging.png',
                        title: 'Image',
                        onTap: () async {},
                      ),
                      smallerVerticalSpace(),
                      settingCard(
                          image: 'assets/images/filepdf.png',
                          title: 'PDF',
                          onTap: () async {}),
                    ]),
              ),
            ));
  }


  Padding item(title, value, {isSuccess}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Text(title,
                style:
                    const TextStyle(color: AppColor.textColor, fontSize: 15)),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: TextStyle(
                  color:
                      isSuccess == true ? AppColor.green : AppColor.textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
