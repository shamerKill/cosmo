import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/routes/routes.dart';
import 'package:plug/app/ui/theme/theme.dart';

class LBottomNavigation extends GetView {
  const LBottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LBottomNavigationController controller = Get.put(LBottomNavigationController());
    LBottomNavigationState state = controller.state;

    return Hero(
      tag: 'cosmo_bottom_navigation',
      child: Obx(() => BottomNavigationBar(
        items: state.tabItems.map<BottomNavigationBarItem>((_item) => BottomNavigationBarItem(
          icon: _item.icon,
          label: _item.label,
          activeIcon: _item.activeIcon,
        )).toList(),
        selectedIconTheme: IconThemeData(size: appTheme.sizes.iconSize * 0.8),
        unselectedIconTheme: IconThemeData(size: appTheme.sizes.iconSize * 0.9),
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(fontSize: appTheme.sizes.fontSize, height: 2),
        unselectedLabelStyle: TextStyle(fontSize: appTheme.sizes.fontSizeSmall, color: appTheme.colors.textGray),
        unselectedItemColor: appTheme.colors.textGray,
        backgroundColor: appTheme.colors.pageBackgroundColor,
        currentIndex: state.selectedIndex,
        fixedColor: appTheme.colors.primaryColor,
        onTap: controller.changeSelectd,
      ),
    ));
  }
}

class LBottomNavigationState {
  final Rx<int> _selectedIndex = 0.obs;
  int get selectedIndex => _selectedIndex.value;
  set selectedIndex (int value) => _selectedIndex.value = value;

  final List<_BottomItem> tabItems = [
    _BottomItem(
      icon: const Icon(IconData(0xe811, fontFamily: 'plugIcon')),
      activeIcon: const Icon(IconData(0xe813, fontFamily: 'plugIcon')),
      label: 'tabbarLabel_wallet'.tr,
      route: PlugRoutesNames.walletHome,
    ),
    _BottomItem(
      icon: const Icon(IconData(0xe812, fontFamily: 'plugIcon')),
      activeIcon: const Icon(IconData(0xe814, fontFamily: 'plugIcon')),
      label: 'tabbarLabel_market'.tr,
      route: PlugRoutesNames.chainExport,
    ),
    _BottomItem(
      icon: const Icon(IconData(0xe818, fontFamily: 'plugIcon')),
      activeIcon: const Icon(IconData(0xe819, fontFamily: 'plugIcon')),
      label: 'tabbarLabel_ecology'.tr,
      route: PlugRoutesNames.dappExhibition,
    ),
    _BottomItem(
      icon: const Icon(IconData(0xe81c, fontFamily: 'plugIcon')),
      activeIcon: const Icon(IconData(0xe81d, fontFamily: 'plugIcon')),
      label: 'tabbarLabel_my'.tr,
      route: PlugRoutesNames.userMy,
    ),
  ];
}

class LBottomNavigationController extends GetxController {
  LBottomNavigationController();
  LBottomNavigationState state = LBottomNavigationState();

  @override
  onInit() {
    super.onInit();
    for (var _item in state.tabItems) {
      if (RegExp('^${_item.route}').hasMatch(Get.currentRoute)) {
        state.selectedIndex = state.tabItems.indexOf(_item);
      }
    }
  }
  changeSelectd(int? type) {
    if (type != null && type != state.selectedIndex) {
      state.selectedIndex = type;
      Get.offAndToNamed(state.tabItems[type].route);
    }
  }
}

class _BottomItem {
  final Widget icon;
  final Widget activeIcon;
  final String label;
  final String route;
  _BottomItem({
    required this.activeIcon,
    required this.icon,
    required this.label,
    required this.route,
  });
}