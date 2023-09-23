import 'package:flutter/material.dart';
import 'package:myplaces_mexico/core/core.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
        onChanged: (text) {},
        controller: _controller,
        decoration: const InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          hintText: 'Search',
          hintStyle: TextStyle(
            fontSize: 17,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
