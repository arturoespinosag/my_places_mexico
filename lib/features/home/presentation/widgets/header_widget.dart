import 'package:flutter/material.dart';
import 'package:myplaces_mexico/core/core.dart';
import 'package:myplaces_mexico/features/features.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    required this.isList,
    super.key,
  });

  final bool isList;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: edgeInsetsSymmetricH30,
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Palette.lightGrey,
            border: Border.all(
              width: 0.1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(children: [
                ListIconWidget(
                  icon: Icons.list_sharp,
                  isSelected: isList,
                  onTap: () {},
                ),
              ]),
            ],
          ),
        ),
      ],
    );
  }
}
