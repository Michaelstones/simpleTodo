import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key, required this.drawerKey});
  final GlobalKey<SliderDrawerState> drawerKey;

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar>
    with SingleTickerProviderStateMixin {
  late AnimationController animecontroller;
  bool isOpen = false;
  @override
  void initState() {
    super.initState();
    animecontroller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    animecontroller.dispose();
    super.dispose();
  }

  void onDrawerButtonPressed() {
    setState(() {
      isOpen = !isOpen;
      if (isOpen) {
        animecontroller.forward();
        widget.drawerKey.currentState!.openSlider();
      } else {
        animecontroller.reverse();
        widget.drawerKey.currentState!.closeSlider();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        height: 130,
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: IconButton(
                    onPressed: onDrawerButtonPressed,
                    icon: AnimatedIcon(
                      icon: AnimatedIcons.menu_close,
                      progress: animecontroller,
                      size: 40,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      CupertinoIcons.trash_fill,
                      size: 40,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
