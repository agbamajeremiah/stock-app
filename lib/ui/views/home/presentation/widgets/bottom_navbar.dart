import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FABBottomAppBar extends StatefulWidget {
  const FABBottomAppBar({
    Key? key,
    this.items,
    this.centerItemText,
    this.height = 70.0,
    this.iconSize = 20.0,
    this.backgroundColor,
    this.color,
    this.selectedColor,
    this.notchedShape,
    this.onTabSelected,
    this.currentIndex,
  }) : super(key: key);

  final List<FABBottomAppBarItem>? items;
  final String? centerItemText;
  final double height;
  final double iconSize;
  final Color? backgroundColor;
  final Color? color;
  final Color? selectedColor;
  final NotchedShape? notchedShape;
  final int? currentIndex;
  final ValueChanged<int?>? onTabSelected;

  @override
  State<StatefulWidget> createState() => FABBottomAppBarState();
}

class FABBottomAppBarState extends State<FABBottomAppBar> {
  int? _selectedIndex;

  _updateIndex(int? index) {
    widget.onTabSelected!(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    _selectedIndex = widget.currentIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var items = List<Widget>.generate(widget.items!.length, (int index) {
      return _buildTabItem(
        item: widget.items![index],
        index: index,
        onPressed: _updateIndex,
      );
    });
    // items.insert(items.length >> 1, _buildMiddleTabItem());

    return BottomAppBar(
      shape: widget.notchedShape,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items,
        ),
      ),
    );
  }

  Widget _buildTabItem({
    required FABBottomAppBarItem item,
    int? index,
    ValueChanged<int?>? onPressed,
  }) {
    var color = _selectedIndex == index ? widget.selectedColor : widget.color;
    var icon = _selectedIndex == index ? item.activeIcon : item.inActiveIcon;
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed!(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 21,
                  width: 21,
                  child: SvgPicture.asset(icon!, color: color),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FABBottomAppBarItem {
  FABBottomAppBarItem({
    required this.activeIcon,
    required this.inActiveIcon,
  });

  String? activeIcon;
  String? inActiveIcon;
}
