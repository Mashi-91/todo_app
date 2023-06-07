import 'dart:ffi';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

Widget buildTextFormField(
    {required String hintText,
    bool email = true,
      required TextEditingController controller,
    required Color color,
    bool obsecure = true,
    Function? func
    }) {
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
            cursorColor: Colors.black54,
            obscureText: obsecure,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 14),
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: const TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
        GestureDetector(
          onTap: ()=>func!(),
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: email
                ? Container()
                : obsecure ? const Icon(
                    UniconsSolid.lock,
                    color: Colors.black45,
                  ) : const Icon(
              UniconsSolid.unlock,
              color: Colors.black45,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildTopSection({required VoidCallback func}) {
  return Container(
    margin: const EdgeInsets.only(left: 28),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Hey,\nLogin Now.',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Text('If you are new /  ',
                style: TextStyle(
                    color: Colors.grey.withOpacity(0.5),
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.2,
                    fontSize: 14)),
            GestureDetector(
              onTap: func,
              child: const Text('Create New',
                  style: TextStyle(
                    color: Colors.black,
                    letterSpacing: 0.1,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  )),
            ),
          ],
        )
      ],
    ),
  );
}

Widget buildBottomSection({required VoidCallback func}) {
  return Container(
    margin: const EdgeInsets.only(left: 28),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        RichText(
            text: TextSpan(children: [
          TextSpan(
              text: 'Forgot Password? /  ',
              style: TextStyle(
                  color: Colors.grey.withOpacity(0.5),
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.2)),
          const TextSpan(
              text: 'Reset',
              style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 0.1,
                  fontWeight: FontWeight.normal,
                  fontSize: 16)),
        ])),
        const SizedBox(height: 40),
        GestureDetector(
          onTap: func,
          child: Container(
            alignment: Alignment.center,
            width: 300,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xFF8acac0),
            ),
            child: const Text(
              'Login',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
        )
      ],
    ),
  );
}
