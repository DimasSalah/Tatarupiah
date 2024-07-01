import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../../style/colors.dart';
import '../../../../../style/text_style.dart';

class DateRangeDialog extends StatelessWidget {
  final DateTime? startDate;
  final DateTime? endDate;
  final Function()? onSubmit;
  final Function(DateRangePickerSelectionChangedArgs args)? onSelectionChanged;
  const DateRangeDialog({
    super.key,
    required this.startDate,
    required this.endDate,
    this.onSubmit,
    this.onSelectionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      shadowColor: Colors.transparent,
      backgroundColor: white,
      surfaceTintColor: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SfDateRangePicker(
            headerStyle: DateRangePickerHeaderStyle(
              backgroundColor: white,
              textAlign: TextAlign.center,
              textStyle: medium.copyWith(fontSize: 16, color: dark),
            ),
            selectionTextStyle: regular.copyWith(
              fontSize: 14,
              color: white,
            ),
            rangeTextStyle: regular.copyWith(
              fontSize: 14,
              color: white,
            ),
            backgroundColor: white,
            todayHighlightColor: greenAccent,
            selectionColor: dark,
            startRangeSelectionColor: normal,
            endRangeSelectionColor: normal,
            rangeSelectionColor: lightActive,
            onSelectionChanged: onSelectionChanged,
            selectionMode: DateRangePickerSelectionMode.range,
            minDate:
                DateTime(2020), // controller.startDate.value ?? DateTime(2020),
            maxDate:
                DateTime(2030), // controller.maxDate.value ?? DateTime(2030),
            initialSelectedRange: PickerDateRange(
              startDate,
              endDate,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  'Kembali',
                  style: regular.copyWith(fontSize: 13, color: dark),
                ),
              ),
              TextButton(
                onPressed: onSubmit,
                child: Text(
                  'OK',
                  style: regular.copyWith(fontSize: 13, color: dark),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
