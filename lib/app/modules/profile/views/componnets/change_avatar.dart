import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../style/colors.dart';
import '../../../../style/text_style.dart';


class changeAvatar extends StatelessWidget {
  const changeAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: lightHover,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  dense: true,
                  trailing: Icon(Icons.camera_alt),
                  title: Text(
                    'Camera',
                    style: medium.copyWith(fontSize: 13),
                  ),
                  onTap: () {
                    Get.back();
                  },
                ),
                Divider(
                  color: dark.withOpacity(0.5),
                ),
                ListTile(
                  dense: true,
                  trailing: Icon(Icons.image),
                  title: Text(
                    'Gallery',
                    style: medium.copyWith(fontSize: 13),
                  ),
                  onTap: () {
                    Get.back();
                  },
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                  vertical: 12),
              margin: const EdgeInsets.symmetric(
                  horizontal: 23),
              width: double.infinity,
              decoration: BoxDecoration(
                color: dark,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Center(
                child: Text(
                  'batal',
                  style: regular.copyWith(
                      color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ),
          const Gap(14),
        ],
      ),
    );
  }
}