import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../style/colors.dart';
import '../../controllers/home_controller.dart';


class DateFilterHome extends StatelessWidget {
  const DateFilterHome({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final selectdate = await showDatePicker(
          locale: const Locale('id', 'ID'),
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2021),
          lastDate: DateTime(2050),
          builder: (context, child) {
            return Theme(
                data: ThemeData.dark().copyWith(
                  colorScheme: ColorScheme.dark(
                    primary: dark,
                    onPrimary: white,
                    surface: white,
                    onSurface: dark,
                    onBackground: white,
                  ),
                  primaryColor: dark,
                  textSelectionTheme:
                      TextSelectionThemeData(
                          cursorColor: error),
                  buttonTheme: ButtonThemeData(
                    buttonColor: error,
                    textTheme:
                        ButtonTextTheme.primary,
                  ),
                ),
                child: child!);
          },
        );
        if (selectdate != null) {
          controller.selectedDate(selectdate);
        }
      },
      child: SvgPicture.asset(
        'assets/icons/calendar.svg',
        height: 34,
      ),
    );
  }
}
