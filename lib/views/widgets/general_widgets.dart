import 'package:flutter/material.dart';
import 'package:flutter_engr/core/color.dart';
import 'package:flutter_engr/core/const.dart';

settingCard({image, title, onTap,color,isLogout= false}) {
  return Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: AppColor.lightGrey, width: 0.8)),
    child: InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Image.asset(
              image,
              height: 25,
              width: 25,
              color:color?? AppColor.primaryColor,
            ),
          ),
          smallHorizontalSpace(),
          Expanded(
            child: Text(title,
                style:  TextStyle(
                    color:color?? AppColor.textColor,
                    fontWeight: FontWeight.w500)),
          ),
          tinyHorizontalSpace(),
         if(!isLogout) const Icon(Icons.chevron_right, color: AppColor.grey)
        ],
      ),
    ),
  );
}
