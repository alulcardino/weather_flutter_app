import 'package:flutter/material.dart';

class ForecastItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String units;

  const ForecastItem({
    super.key,
    required this.icon,
    required this.value,
    required this.units,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.black87,
          size: 28,
        ),
        const SizedBox(height: 10.0),
        Text(
          value,
          style: const TextStyle(fontSize: 20, color: Colors.black87),
        ),
        const SizedBox(height: 10.0),
        Text(
          units,
          style: const TextStyle(fontSize: 15, color: Colors.black87),
        ),
      ],
    );
  }
}
