import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myplaces_mexico/core/core.dart';
import 'package:myplaces_mexico/src/src.dart';

List<Category> _categories = [
  Category(
    iconPath: 'assets/pages/home_page/car_wash.svg',
    label: 'Autolavado',
  ),
  Category(
      iconPath: 'assets/pages/home_page/gas_station.svg', label: 'Gasolinería'),
  Category(
    iconPath: 'assets/pages/home_page/groceries.svg',
    label: 'Abarrotes',
  ),
  Category(
    iconPath: 'assets/pages/home_page/hotel.svg',
    label: 'Hotel',
  ),
  Category(
    iconPath: 'assets/pages/home_page/market.svg',
    label: 'Mercado',
  ),
  Category(
      iconPath: 'assets/pages/home_page/restaurant.svg', label: 'Restaurante'),
  Category(
    iconPath: 'assets/pages/home_page/school.svg',
    label: 'Escuela',
  ),
  Category(
    iconPath: 'assets/pages/home_page/stationery.svg',
    label: 'Papelería',
  ),
];

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          _categories.length,
          (index) {
            final category = _categories[index];
            return _CategoryButton(
              category: category,
              onPressed: () {},
            );
          },
        ),
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  const _CategoryButton({
    required this.category,
    required this.onPressed,
  });
  final Category category;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            border: Border.all(width: 0.3),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            SvgPicture.asset(
              category.iconPath,
              height: 46,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Text(
                category.label,
                style: FontStyles.regular.copyWith(
                  color: Colors.black,
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
