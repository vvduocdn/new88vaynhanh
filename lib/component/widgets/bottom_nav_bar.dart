import 'package:flutter/material.dart';
import 'package:new88_vaynow/component/theme.dart';
import 'tabbar_item.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, required this.icons, required this.activeIcons, required this.selectedIndex, required this.onTap});

  final List<TabbarItem> icons;
  final List<TabbarItem> activeIcons;
  final int selectedIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    int i = 0;
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            spreadRadius: 0,
            blurRadius: 20,
            offset: const Offset(0, -10), // changes position of shadow
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(16),
          topLeft: Radius.circular(16),
        ),
        child: BottomNavigationBar(
          backgroundColor: context.colors.white,
          elevation: 50,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          selectedLabelStyle: const TextStyle(height: 1.7, fontWeight: FontWeight.w400),
          unselectedLabelStyle: const TextStyle(height: 1.7, fontWeight: FontWeight.w400),
          items: [
            ...icons.map((item) {
              i++;
              return BottomNavigationBarItem(
                icon: item.icon,
                activeIcon: activeIcons[i - 1].icon,
                label: item.label,
              );
            })
          ],
          currentIndex: selectedIndex,
          selectedItemColor: context.colors.hF05D0E,
          unselectedItemColor: context.colors.main,
          onTap: onTap,
        ),
      ),
    );
  }
}
