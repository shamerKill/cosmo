import 'package:flutter/material.dart';

class LKeepAliveWrapper extends StatefulWidget {
  final Widget child;
  final bool alive;

  const LKeepAliveWrapper({Key? key, required this.child, required this.alive}) : super(key: key);

  @override
  _LKeepAliveWrapperState createState() => _LKeepAliveWrapperState(alive: alive);
}

class _LKeepAliveWrapperState extends State<LKeepAliveWrapper> with AutomaticKeepAliveClientMixin {
  _LKeepAliveWrapperState({
    required this.alive,
  });

  final bool alive;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => alive;
}