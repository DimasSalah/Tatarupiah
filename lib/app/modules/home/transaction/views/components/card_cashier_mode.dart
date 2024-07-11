import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/route_manager.dart';
import 'package:tatarupiah/app/utils/currency_format.dart';

import '../../../../../style/colors.dart';
import '../../../../../style/text_style.dart';

class CardCashierMode extends StatelessWidget {
  final String title;
  final String price;
  final int countOrder;
  final String icon;
  final void Function()? increment;
  final void Function()? decrement;
  const CardCashierMode({
    super.key,
    required this.title,
    required this.price,
    required this.countOrder,
    required this.icon,
    this.increment,
    this.decrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 17, right: 17, bottom: 10),
      padding: const EdgeInsets.only(left: 8, right: 16, top: 8, bottom: 8),
      decoration: BoxDecoration(
        color: light,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                  height: 50,
                  width: 50,
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: dark,
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: SvgPicture.asset(
                    icon,
                  )),
              const SizedBox(
                width: 17.5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: Get.width * 0.4),
                    child: Text(
                      title,
                      style: medium.copyWith(fontSize: 13, color: normal),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Gap(2),
                  Text(
                    currencyViewFormatter(price),
                    style: regular.copyWith(fontSize: 13, color: success),
                  )
                ],
              )
            ],
          ),
          Row(
            children: [
              Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: lightHover,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: decrement,
                    icon: Icon(
                      Icons.remove,
                      color: darkActive,
                      size: 20,
                    ),
                  )),
              Container(
                alignment: Alignment.center,
                width: 30,
                child: Text(
                  countOrder.toString(),
                  style: medium.copyWith(fontSize: 16, color: normal),
                ),
              ),
              Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: lightHover,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: increment,
                    icon: Icon(
                      Icons.add,
                      color: darkActive,
                      size: 20,
                    ),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
