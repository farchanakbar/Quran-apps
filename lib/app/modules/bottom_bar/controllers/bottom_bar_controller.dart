import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BottomBarController extends GetxController {
  final PersistentTabController controller =
      PersistentTabController(initialIndex: 0);
}
