import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stock/core/constants/app_asset.dart';
import 'package:stock/ui/features/home/presentation/pages/home_screen.dart';
import 'package:stock/ui/features/home/presentation/widgets/bottom_navbar.dart';

class TabView extends StatefulWidget {
  final TabViewParams? params;
  const TabView({Key? key, this.params}) : super(key: key);
  @override
  _TabViewState createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  int? _selectedIndex;
  Widget? child;

  void _onItemTapped(int? index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    setState(() {
      widget.params?.index == null
          ? _selectedIndex = 0
          : _selectedIndex = widget.params?.index;
      widget.params?.child == null
          ? child = null
          : child = widget.params?.child;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _widgetOptions = <Widget?>[
      (child == null && _selectedIndex == 0) ? const HomeScreen() : child,
      (child == null && _selectedIndex == 1) ? const HomeScreen() : child,
      (child == null && _selectedIndex == 2) ? const HomeScreen() : child,
      (child == null && _selectedIndex == 3) ? const HomeScreen() : child,
      (child == null && _selectedIndex == 4) ? const HomeScreen() : child,
    ];
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: Center(child: _widgetOptions.elementAt(_selectedIndex!)),
        bottomNavigationBar: FABBottomAppBar(
          notchedShape: const CircularNotchedRectangle(),
          onTabSelected: _onItemTapped,
          currentIndex: _selectedIndex,
          items: [
            FABBottomAppBarItem(
              activeIcon: AppAsset.homeActiveIcon,
              inActiveIcon: AppAsset.homeInactiveIcon,
            ),
            FABBottomAppBarItem(
              activeIcon: AppAsset.mapInactiveIcon,
              inActiveIcon: AppAsset.mapInactiveIcon,
            ),
            FABBottomAppBarItem(
              activeIcon: AppAsset.tradeActiveIcon,
              inActiveIcon: AppAsset.tradeActiveIcon,
            ),
            FABBottomAppBarItem(
              activeIcon: AppAsset.marketActiveIcon,
              inActiveIcon: AppAsset.marketInactiveIcon,
            ),
            FABBottomAppBarItem(
              activeIcon: AppAsset.accountActiveIcon,
              inActiveIcon: AppAsset.accountInactiveIcon,
            ),
          ],
        ),
      ),
    );
  }
}

class TabViewParams {
  final int? index;
  final Widget? child;
  TabViewParams({this.child, this.index});
}
