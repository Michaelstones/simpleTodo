import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo/utils/app_colours.dart';

class Fab extends StatelessWidget {
  const Fab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        log('Floating Button Clicked');
      },
      child: Material(
        borderRadius: BorderRadius.circular(10.0),
        elevation: 10.0,
        child: Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: AppColours.primaryColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
