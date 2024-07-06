import 'package:flutter/material.dart';
import 'package:tatarupiah/app/style/colors.dart';

InputBorder enabledBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: BorderSide(
    color: lightActive,
  ),
);

InputBorder focusedBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: BorderSide(
    color: normal,
  ),
);
