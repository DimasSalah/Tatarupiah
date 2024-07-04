import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';


class SkeletonCategory extends StatelessWidget {
  const SkeletonCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (context, index) {
          return const Skeletonizer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Loading'),
                    Icon(Icons.delete)
                  ],
                ),
                Gap(10),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.grey,
                    ),
                    Gap(15),
                    Text('Loading...'),
                    Spacer(),
                    Icon(Icons.delete)
                  ],
                )
              ],
            ),
          );
        });
  }
}
