import 'package:flutter/material.dart';
import 'package:myplaces_mexico/core/core.dart';
import 'package:myplaces_mexico/src/domain/domain.dart';

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
        SizedBox(
          height: 60,
          width: double.infinity,
          child: Row(
            children: [
              const SizedBox(width: 10),
              Expanded(
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  itemCount: PlaceKind.values.length,
                  itemBuilder: (context, index) => FilterChip(
                    label: Text(PlaceKind.values[index].query.capitalize),
                    disabledColor: const Color.fromARGB(255, 249, 249, 248),
                    selected: index.isOdd,
                    onSelected: (_) {
                      primaryFocus?.unfocus();
                    },
                    avatar: Icon(PlaceKind.values[index].getIcon()),
                    chipAnimationStyle: ChipAnimationStyle(
                      selectAnimation:
                          const AnimationStyle(curve: Curves.bounceIn),
                    ),
                    showCheckmark: false,
                  ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 10),
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
      ],
    );
  }
}
