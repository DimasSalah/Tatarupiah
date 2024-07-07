import 'package:flutter/material.dart';

import '../../../../style/colors.dart';


class LoadingCircular extends StatelessWidget {
  const LoadingCircular({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        alignment: Alignment.center,
        width: 100,
        height: 100,
        child: CircularProgressIndicator(
          color: dark,
        ),
      ),
    );
  }
}
