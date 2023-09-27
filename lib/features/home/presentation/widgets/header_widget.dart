import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myplaces_mexico/core/core.dart';
import 'package:myplaces_mexico/features/features.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    required this.isList,
  });

  final bool isList;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: edgeInsetsAll25,
          child: Text(
            'Lugares cercanos',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          padding: edgeInsetsSymetricH30,
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Palette.lightGrey,
            border: Border.all(
              color: Colors.black,
              width: 0.1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(children: [
                ListIconWidget(
                  icon: Icons.expand_sharp,
                  isSelected: !isList,
                  onTap: isList
                      ? () => context.read<HomeBloc>().add(
                            const HomeEvent.switchHomeList(
                              isList: false,
                            ),
                          )
                      : () {},
                ),
                const SizedBox(
                  width: 20,
                ),
                ListIconWidget(
                  icon: Icons.list_sharp,
                  isSelected: isList,
                  onTap: !isList
                      ? () => context.read<HomeBloc>().add(
                            const HomeEvent.switchHomeList(
                              isList: true,
                            ),
                          )
                      : () {},
                ),
              ]),
              RefreshButtonWidget(
                onTap: () => context
                    .read<HomeBloc>()
                    .add(const HomeEvent.fetchNearbyPlaces()),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
