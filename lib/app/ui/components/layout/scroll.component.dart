import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:plug/app/ui/theme/theme.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class LScrollView extends GetView<_ScrollViewController>  {
  const LScrollView({
    Key? key,
    required this.refreshController,
    this.child,
    this.children,
    this.onLoading,
    this.onRefresh,
    this.disLoading,
    this.headerBackgroundColor,
    this.reKey,
  }): super(key: key);

  final Future<void> Function()? onLoading;
  final bool? disLoading;
  final Future<void> Function()? onRefresh;
  final List<Widget>? children;
  final Widget? child;
  final Color? headerBackgroundColor;
  final RefreshController refreshController;
  final Key? reKey;

  @override
  Widget build(BuildContext context) {
    _ScrollViewController controller = Get.put(_ScrollViewController());
    controller.setLoading(onLoading);
    controller.setRefresh(onRefresh);

    return SmartRefresher(
      key: reKey,
      controller: refreshController,
      enablePullUp: onLoading != null,
      enablePullDown: onRefresh != null,
      onRefresh: () => controller.onRefresh(refreshController),
      onLoading: () => controller.onLoading(refreshController),
      header: WaterDropMaterialHeader(
        distance: appTheme.sizes.titleBarHeight / 1.4,
        backgroundColor: headerBackgroundColor,
      ),
      footer: CustomFooter(
        builder: (BuildContext context ,LoadStatus? mode){
          if (controller.isRefreshing.value) return Container();
          Widget body;
          // TODO: 加载设置
          if(mode==LoadStatus.idle){
            body =  const Text("pull up load");
          }
          else if(mode==LoadStatus.loading){
            body =  const CupertinoActivityIndicator();
          }
          else if(mode == LoadStatus.failed){
            body = const Text("Load Failed!Click retry!");
          }
          else if(mode == LoadStatus.canLoading){
              body = const Text("release to load more");
          }
          else{
            body = const Text("No more Data");
          }
          return SizedBox(
            height: appTheme.sizes.basic * 55.0,
            child: Center(child:body),
          );
        },
      ),
      child: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: (children == null) ? [
          SliverToBoxAdapter(
            child: child,
          )
        ] : [
          for (var _item in children!)
            SliverToBoxAdapter(child: _item)
        ],
      ),
    );
  }
}

class ScrollFunc {
  Future<void> Function()? onLoading;
  Future<void> Function()? onRefresh;
}

class _ScrollViewController extends GetxController {
  _ScrollViewController();
  ScrollFunc scrollFunc = ScrollFunc();
  Rx<bool> isRefreshing = false.obs;

  setLoading(Future<void> Function()? _inputOnLoading) => scrollFunc.onLoading = _inputOnLoading;
  setRefresh(Future<void> Function()? _inputOnRefresh) => scrollFunc.onRefresh = _inputOnRefresh;

  void onRefresh(RefreshController _refreshController) async {
    if (scrollFunc.onRefresh != null) await scrollFunc.onRefresh!();
    _refreshController.refreshCompleted();
  }

  void onLoading(RefreshController _refreshController) async {
    if (scrollFunc.onLoading != null) await scrollFunc.onLoading!();
    _refreshController.loadComplete();
  }

}