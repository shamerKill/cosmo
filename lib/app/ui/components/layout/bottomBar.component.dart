import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/data/provider/data.account.dart';
import 'package:plug/app/routes/routes.dart';
import 'package:plug/app/ui/theme/theme.dart';

class LBottomNavigation extends GetView {
  const LBottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LBottomNavigationController controller =
        Get.put(LBottomNavigationController());
    LBottomNavigationState state = controller.state;
    if (state.selectedIndex >= state.tabItems.length) {
      state.selectedIndex = state.tabItems.length - 1;
    }
    return Hero(
        tag: 'pando_bottom_navigation',
        child: Obx(
          () => BottomNavigationBar(
            // 观察账户不显示dapp
            items: state.tabItems
                .map<BottomNavigationBarItem>(
                    (_item) => BottomNavigationBarItem(
                          icon: _item.icon,
                          label: _item.label.tr,
                          activeIcon: _item.activeIcon,
                        ))
                .toList(),
            selectedIconTheme:
                IconThemeData(size: appTheme.sizes.iconSize * 0.7),
            unselectedIconTheme:
                IconThemeData(size: appTheme.sizes.iconSize * 0.8),
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle:
                TextStyle(fontSize: appTheme.sizes.fontSizeSmall, height: 1.8),
            unselectedLabelStyle: TextStyle(
                fontSize: appTheme.sizes.fontSizeSmall,
                color: appTheme.colors.textGray),
            unselectedItemColor: appTheme.colors.textGray,
            backgroundColor: appTheme.colors.pageBackgroundColor,
            currentIndex: state.selectedIndex,
            fixedColor: appTheme.colors.primaryColor,
            onTap: controller.changeSwitch,
          ),
        ));
  }
}

class LBottomNavigationState {
  final Rx<int> _selectedIndex = 0.obs;
  int get selectedIndex => _selectedIndex.value;
  set selectedIndex(int value) => _selectedIndex.value = value;

  final List<_BottomItem> defaultTabItems = [
    _BottomItem(
      icon: const Icon(IconData(0xe811, fontFamily: 'plugIcon')),
      activeIcon: const Icon(IconData(0xe813, fontFamily: 'plugIcon')),
      label: 'tabBarLabel_wallet',
      route: PlugRoutesNames.walletHome,
    ),
    _BottomItem(
      icon: const Icon(IconData(0xe824, fontFamily: 'plugIcon')),
      activeIcon: const Icon(IconData(0xe824, fontFamily: 'plugIcon')),
      label: 'tabBarLabel_core',
      route: PlugRoutesNames.chainExport,
    ),
    _BottomItem(
      icon: const Icon(IconData(0xe818, fontFamily: 'plugIcon')),
      activeIcon: const Icon(IconData(0xe819, fontFamily: 'plugIcon')),
      label: 'tabBarLabel_extension',
      route: PlugRoutesNames.dappExhibition,
    ),
    _BottomItem(
      icon: const Icon(IconData(0xe81c, fontFamily: 'plugIcon')),
      activeIcon: const Icon(IconData(0xe81d, fontFamily: 'plugIcon')),
      label: 'tabBarLabel_setting',
      route: PlugRoutesNames.userMy,
    ),
  ];

  final RxList<_BottomItem> tabItems = RxList([
    _BottomItem(
      icon: const Icon(IconData(0xe811, fontFamily: 'plugIcon')),
      activeIcon: const Icon(IconData(0xe813, fontFamily: 'plugIcon')),
      label: 'tabBarLabel_wallet',
      route: PlugRoutesNames.walletHome,
    ),
    _BottomItem(
      icon: const Icon(IconData(0xe824, fontFamily: 'plugIcon')),
      activeIcon: const Icon(IconData(0xe824, fontFamily: 'plugIcon')),
      label: 'tabBarLabel_core',
      route: PlugRoutesNames.chainExport,
    ),
    _BottomItem(
      icon: const Icon(IconData(0xe818, fontFamily: 'plugIcon')),
      activeIcon: const Icon(IconData(0xe819, fontFamily: 'plugIcon')),
      label: 'tabBarLabel_extension',
      route: PlugRoutesNames.dappExhibition,
    ),
    _BottomItem(
      icon: const Icon(IconData(0xe81c, fontFamily: 'plugIcon')),
      activeIcon: const Icon(IconData(0xe81d, fontFamily: 'plugIcon')),
      label: 'tabBarLabel_setting',
      route: PlugRoutesNames.userMy,
    ),
  ]);
}

class LBottomNavigationController extends GetxController {
  LBottomNavigationController();
  LBottomNavigationState state = LBottomNavigationState();
  final DataAccountController dataAccountController = Get.find();

  @override
  onInit() {
    super.onInit();
    for (var _item in state.tabItems) {
      if (RegExp('^${_item.route}').hasMatch(Get.currentRoute)) {
        state.selectedIndex = state.tabItems.indexOf(_item);
      }
    }
    // 刷新状态情况下，保持
    if ([PlugRoutesNames.userLanguage, PlugRoutesNames.userNetwork]
        .contains(Get.currentRoute)) {
      state.selectedIndex = state.tabItems
          .indexWhere((element) => element.route == PlugRoutesNames.userMy);
    }

    // 监听是否是观察钱包
    dataAccountController.listenNowAccount(_watchAccountClass);
  }

  @override
  onClose() {
    super.onClose();
    dataAccountController.removeListenNowAccount(_watchAccountClass);
  }

  _watchAccountClass(AccountModel? account) {
    if (account == null) return;
    if (account.accountClass == EnumAccountClass.normal) {
      state.tabItems
        ..clear()
        ..addAll(state.defaultTabItems);
    } else {
      state.tabItems
        ..clear()
        ..addAll(state.defaultTabItems.where(
            (element) => element.route != PlugRoutesNames.dappExhibition));
    }
    state.tabItems.refresh();
  }

  changeSwitch(int type) {
    if (type != state.selectedIndex &&
        type < state.tabItems.length &&
        type >= 0) {
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
