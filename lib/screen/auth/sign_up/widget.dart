import 'package:flutter/material.dart';

Widget buildSignUpTextFormField(
    {required String hintText,
    bool email = true,
      bool obsecure = false,
    required TextEditingController controller,
    required Color color,
    Function? func}) {
  return Container(
    margin: const EdgeInsets.only(left: 28),
    alignment: Alignment.center,
    width: 300,
    height: 60,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: color,
    ),
    child: Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: controller,
            obscureText: obsecure,
            cursorColor: Colors.black54,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 14),
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: const TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
      ],
    ),
  );
}

Widget buildCustomButton({
  required VoidCallback func,
  required String text,
}) {
  return Container(
    margin: const EdgeInsets.only(left: 28),
    child: GestureDetector(
      onTap: func,
      child: Container(
        alignment: Alignment.center,
        width: 300,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xFF8acac0),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
    ),
  );
}

Widget buildSignUpTopSection() {
  return Container(
    margin: const EdgeInsets.only(left: 28),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Hey,\nCreate New.',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ],
    ),
  );
}

