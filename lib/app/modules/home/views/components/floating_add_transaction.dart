import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../style/colors.dart';
import '../../../../style/gradient.dart';

class FloatingAddTransaction extends StatelessWidget {
  final Function()? onTap;
  const FloatingAddTransaction({
    super.key,
    required this.onTap,
  });


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 74,
      width: 84,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10, right: 20),
        child: FloatingActionButton(
          splashColor: darker,
          backgroundColor: dark,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          elevation: 0,
          onPressed: onTap,
          child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                gradient: primary,
                borderRadius: BorderRadius.circular(50),
              ),
              child: SvgPicture.asset(
                'assets/icons/plus.svg',
              )),
        ),
      ),
    );
  }
}
