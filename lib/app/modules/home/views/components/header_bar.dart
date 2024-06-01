import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../style/colors.dart';
import '../../../../style/text_style.dart';
import '../../../../utils/date_format.dart';

class HeaderBar extends StatelessWidget {
  final Widget avatar;
  const HeaderBar({
    super.key,
    required this.avatar,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 26,
              backgroundColor: lighter,  
              child: ClipOval(
                child: avatar,
              )
            ),
            Text(
              appBarDate(
                DateTime.now(),
              ),
              style: medium.copyWith(fontSize: 24),
            ),
            SvgPicture.asset(
              'assets/icons/setting.svg',width: 32,
            )
          ]),
    );
  }
}
