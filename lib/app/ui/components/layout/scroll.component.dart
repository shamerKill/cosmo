import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/ui/theme/theme.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class LScrollView extends GetView<_ScrollViewController> {
  const LScrollView({
    Key? key,
    this.child,
    this.children,
    this.onLoading,
    this.onRefresh,
  }): super(key: key);

  final Future<void> Function()? onLoading;
  final Future<void> Function()? onRefresh;
  final List<Widget>? children;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    _ScrollViewController controller = Get.put(_ScrollViewController());
    RefreshController _refreshController = RefreshController(initialRefresh: false);
    controller.setLoading(onLoading);
    controller.setRefresh(onRefresh);

    return SmartRefresher(
      controller: _refreshController,
      enablePullUp: onLoading != null,
      enablePullDown: onRefresh != null,
      onRefresh: () => controller.onRefresh(_refreshController),
      onLoading: () => controller.onLoading(_refreshController),
      header: WaterDropMaterialHeader(distance: appTheme.sizes.titleBarHeight / 1.4),
      footer: CustomFooter(
        builder: (BuildContext context ,LoadStatus? mode){
          if (controller.isRefreshing.value) return Container();
          Widget body;
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
          return Container(
            height: 55.0,
            child: Center(child:body),
          );
        },
      ),
      child: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: children??[
          SliverToBoxAdapter(
            child: child,
          )
        ],
      ),
    );
  }
}

class _ScrollViewController extends GetxController {
  _ScrollViewController();
  Future<void> Function()? _onLoading;
  Future<void> Function()? _onRefresh;
  Rx<bool> isRefreshing = false.obs;

  setLoading(Future<void> Function()? _inputOnLoading) => _onLoading = _inputOnLoading;
  setRefresh(Future<void> Function()? _inputOnRefresh) => _onRefresh = _inputOnRefresh;

  void onRefresh(RefreshController _refreshController) async{
    if (_onRefresh != null) await _onRefresh!();
    _refreshController.refreshCompleted();
  }

  void onLoading(RefreshController _refreshController) async{
    if (_onLoading != null) await _onLoading!();
    _refreshController.loadComplete();
  }
}