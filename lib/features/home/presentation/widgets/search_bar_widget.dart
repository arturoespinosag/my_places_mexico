import 'package:flutter/material.dart';
import 'package:myplaces_mexico/core/core.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key, this.onChanged, this.controller});

  final void Function(String)? onChanged;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: 45,
      width: width * 0.9,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: borderRadius4,
      ),
      child: TextField(
        onChanged: onChanged,
        controller: controller,
        decoration: const InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          hintText: 'Buscar',
          hintStyle: TextStyle(
            fontSize: 17,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
