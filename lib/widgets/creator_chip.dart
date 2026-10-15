import 'package:flutter/material.dart';

/// Small white chip: "(avatar) Zuha · Creator".
class CreatorChip extends StatelessWidget {
  final String name;

  const CreatorChip({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(4, 3, 10, 3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 8,
            backgroundColor: Colors.deepPurple.shade200,
            child: const Icon(Icons.person, size: 10, color: Colors.white),
          ),
          const SizedBox(width: 5),
          Text(
            '$name · Creator',
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}