import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTab extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController controller;

  final List<Tab> myTabs = <Tab>[
    Tab(
      iconMargin: EdgeInsets.all(2),
      text: 'All',
    ),
    Tab(
      text: 'Milk & Dairies',
    ),
    Tab(
      text: 'Coffees & Teas',
    ),
    Tab(
      text: 'Pet Foods',
    ),
    Tab(
      text: 'Meats',
    ),
    Tab(
      text: 'Vegetables',
    ),
    Tab(
      text: 'Fruits',
    ),
  ];
  @override
  void onInit() {
    controller = TabController(length: 7, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
