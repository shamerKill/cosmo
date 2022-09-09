import 'package:flutter/material.dart';

class LKeepAliveWrapper extends StatefulWidget {
  final Widget child;
  final bool alive;

  const LKeepAliveWrapper({Key? key, required this.child, required this.alive})
      : super(key: key);

  @override
  _LKeepAliveWrapperState createState() => _LKeepAliveWrapperState();
}

class _LKeepAliveWrapperState extends State<LKeepAliveWrapper>
    with AutomaticKeepAliveClientMixin {
  bool get alive => widget.alive;
  _LKeepAliveWrapperState();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => alive;
}
