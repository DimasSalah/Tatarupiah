import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../style/text_style.dart';
import '../controllers/category_controller.dart';
import 'component/expense_add_category.dart';
import 'component/income_add_category.dart';

class AddCategory extends GetView<CategoryController> {
  const AddCategory({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: SvgPicture.asset(
              'assets/icons/arrow_left.svg',
              width: 12,
            ),
            onPressed: () {
              controller.closeAddCategory();
              Get.back();
            },
          ),
          title: Text(
            'Tambah Kategori',
            style: semiBold.copyWith(fontSize: 20),
          ),
        ),
        body: controller.categoryType.value == 'Pemasukan'
            ? IncomeAddCategoryTab(
                controller: controller,
              )
            : ExpanseAddCategoryTab(
                controller: controller,
              ),
      ),
    );
  }
}
