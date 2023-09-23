import 'package:flutter/material.dart';

class RefreshButtonWidget extends StatelessWidget {
  const RefreshButtonWidget({
    super.key,
    required this.onTap,
  });

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: double.infinity,
      child: Icon(Icons.refresh_outlined),
    );
  }
}
