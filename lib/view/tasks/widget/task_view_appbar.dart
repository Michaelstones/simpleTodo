import 'package:flutter/material.dart';

class TaskViewAppbar extends StatelessWidget implements PreferredSizeWidget {
  const TaskViewAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 150,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: GestureDetector(
                onTap: () {
                  // Correct: Call Navigator.pop inside a function
                  Navigator.pop(context);
                },
                child: const Icon(
                    Icons.arrow_back_ios_new_rounded), // Added const for Icon
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(150);
}
