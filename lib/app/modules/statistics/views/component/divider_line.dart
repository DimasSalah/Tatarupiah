import 'package:flutter/material.dart';

import '../../../../style/colors.dart';

class DividerLine extends StatelessWidget {
  const DividerLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: lighter,
      thickness: 1,
      indent: 23,
      endIndent: 23,);
  }
}