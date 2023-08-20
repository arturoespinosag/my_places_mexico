import 'package:flutter/material.dart';
import 'package:myplaces_mexico/core/core.dart';

class ListIconWidget extends StatelessWidget {
  const ListIconWidget({
    super.key,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final IconData icon;
  final bool isSelected;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: isSelected ? 1 : 0.1,
            color: isSelected ? Palette.mainBlue : Palette.lightGrey,
          ),
        ),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Icon(
          icon,
          size: 30,
          color: isSelected ? Palette.mainBlue : Colors.grey,
        ),
      ),
    );
  }
}
