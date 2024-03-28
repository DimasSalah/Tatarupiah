import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:tatarupiah/app/modules/profile/views/edit_profile_view.dart';
import 'package:tatarupiah/app/modules/profile/views/profile_view.dart';

import 'app/routes/app_pages.dart';
import 'app/style/themes.dart';

Future<void> main() async {
  await initializeDateFormatting();
  Intl.defaultLocale = 'id_ID';
  runApp(
    GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
<<<<<<< HEAD
      initialRoute: Routes.PROFILE,
=======
      initialRoute: AppPages.INITIAL,
>>>>>>> efd4d41d45dab2a50346d6a90702726f34ed523e
      getPages: AppPages.routes,
      theme: AppTheme.themeData,
    ),
  );
}
