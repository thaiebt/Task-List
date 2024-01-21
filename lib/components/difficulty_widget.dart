import 'package:flutter/material.dart';

class DifficultyWidget extends StatelessWidget {
  const DifficultyWidget({super.key, required this.difficult });

  final int difficult;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star, color: difficult >= 1 ? Colors.blue : Colors.blue[100], size: 16,),
        Icon(Icons.star, color: difficult >= 2 ? Colors.blue : Colors.blue[100], size: 16,),
        Icon(Icons.star, color: difficult >= 3 ? Colors.blue : Colors.blue[100], size: 16,),
        Icon(Icons.star, color: difficult >= 4 ? Colors.blue : Colors.blue[100], size: 16,),
        Icon(Icons.star, color: difficult >= 5 ? Colors.blue : Colors.blue[100], size: 16,)
      ],
    );
  }
}