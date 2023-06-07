import 'package:flutter/material.dart';


Widget customContainer({
  required String time,
  required String title,
  required VoidCallback func,
  required IconData icon,
  Color color = Colors.green,
}) {
  return GestureDetector(
    onTap: func,
    child: Container(
      width: 150,
      height: 60,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blueGrey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 4),
              Text(
                time,
                style: const TextStyle(color: Colors.white),
              )
            ],
          )
        ],
      ),
    ),
  );
}

Widget customButton({required String buttonText, required VoidCallback func}) {
  return GestureDetector(
    onTap: func,
    child: Container(
      alignment: Alignment.center,
      width: 340,
      height: 56,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Text(
        buttonText,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
