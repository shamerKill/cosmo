import 'package:flutter/material.dart';
import 'package:plug/app/ui/theme/theme.dart';

class LSwitchView extends StatelessWidget {
  const LSwitchView({
    Key? key,
    required this.selectList,
    required this.change,
    this.selected = 0,
    this.directionRow = true,
  }) : super(key: key);
  // 选项列表
  final Iterable<String> selectList;
  // 默认选项
  final int selected;
  // 选项更改
  final void Function(int type) change;
  // 纵向还是横向
  final bool directionRow;

  @override
  Widget build(BuildContext context) {
    Widget baseBox(List<Widget> children) {
      if (directionRow) {
        return Row(children: children);
      } else {
        return Column(children: children);
      }
    }

    var selectListArr = selectList.toList();

    return baseBox([
      for (var txt in selectListArr)
        Row(
          children: [
            Text(txt, style: TextStyle(color: appTheme.colors.textGrayBig)),
            Transform.scale(
              scale: 0.8,
              child: SizedBox(
                width: appTheme.sizes.fontSize * 1.8,
                child: Radio(
                  value: selectListArr.indexOf(txt),
                  groupValue: selected,
                  fillColor: MaterialStateColor.resolveWith(
                      (states) => appTheme.colors.primaryColor),
                  onChanged: (int? value) {
                    if (value != null) change(value);
                  },
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(right: appTheme.sizes.fontSizeSmall)),
          ],
        ),
    ]);
  }
}
