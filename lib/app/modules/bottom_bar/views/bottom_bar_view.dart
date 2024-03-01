import 'package:alquran/app/constants/color.dart';
import 'package:alquran/app/modules/pages/doa/doa_harian/controllers/doa_harian_controller.dart';
import 'package:alquran/app/modules/pages/doa/doa_harian/views/doa_harian_view.dart';
import 'package:alquran/app/modules/pages/alquran/home/controllers/home_controller.dart';
import 'package:alquran/app/modules/pages/alquran/home/views/home_view.dart';
import 'package:alquran/app/modules/pages/sholat/jadwal_sholat/controllers/jadwal_sholat_controller.dart';
import 'package:alquran/app/modules/pages/sholat/jadwal_sholat/views/jadwal_sholat_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../controllers/bottom_bar_controller.dart';

class BottomBarView extends GetView<BottomBarController> {
  const BottomBarView({Key? key}) : super(key: key);

  List<Widget> _buildScreens() {
    return [const HomeView(), const JadwalSholatView(), const DoaHarianView()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: ("Al-Quran"),
        activeColorPrimary: colorEmpat,
        inactiveColorPrimary: colorTiga,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.access_time_filled),
        title: ("Jadwal Sholat"),
        activeColorPrimary: colorEmpat,
        inactiveColorPrimary: colorTiga,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.library_books),
        title: ("Doa Harian"),
        activeColorPrimary: colorEmpat,
        inactiveColorPrimary: colorTiga,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    Get.put(JadwalSholatController());
    Get.put(DoaHarianController());
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: controller.controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: colorDua, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows:
            true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: colorDua,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style1, // Choose the nav bar style with this property.
      ),
    );
  }
}
