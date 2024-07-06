import 'package:flutter/material.dart';

import '../../../../style/colors.dart';

class DividerLine extends StatelessWidget {
  final double? indent;
  final double? endIndent;
  const DividerLine({
    super.key,
    this.indent,
    this.endIndent,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: lighter,
      thickness: 1,
      indent: indent,
      endIndent: endIndent,
    );
  }
}
