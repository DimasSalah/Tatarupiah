import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../style/colors.dart';
import '../../../../../style/text_style.dart';
import 'category_list_card.dart';


class SkeletonTransaction extends StatelessWidget {
  const SkeletonTransaction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
        child: Column(
          children: [
            CategoryListCard(
              title: 'loading...',
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                  vertical: 4, horizontal: 23),
              color: light.withOpacity(0.4),
              child: ListTile(
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: lightActive,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                title: Text(
                  'loading...',
                  style: regular.copyWith(color: normal),
                ),
                subtitle: Text('loading...'),
                trailing: Text(
                  'loading...',
                  style:
                      bold.copyWith(color: dark, fontSize: 16),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                  vertical: 4, horizontal: 23),
              color: light.withOpacity(0.4),
              child: ListTile(
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: lightActive,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                title: Text(
                  'loading...',
                  style: regular.copyWith(color: normal),
                ),
                subtitle: Text('loading...'),
                trailing: Text(
                  'loading...',
                  style:
                      bold.copyWith(color: dark, fontSize: 16),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                  vertical: 4, horizontal: 23),
              color: light.withOpacity(0.4),
              child: ListTile(
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: lightActive,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                title: Text(
                  'loading...',
                  style: regular.copyWith(color: normal),
                ),
                subtitle: Text('loading...'),
                trailing: Text(
                  'loading...',
                  style:
                      bold.copyWith(color: dark, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      );
  }
}
