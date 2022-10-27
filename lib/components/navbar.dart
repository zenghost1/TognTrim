import 'package:flutter/material.dart';
import 'package:togandtrimapp/theme.dart';

class Navbar extends StatefulWidget {
  final Function(String) update;
  const Navbar({Key? key, required this.update}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: const Icon(
            Icons.menu_rounded,
            size: 30.0,
            color: Color.fromARGB(255, 74, 74, 74),
          ),
        ),
        Row(
          children: [
            InkWell(
              onTap: () {
                widget.update("search");
              },
              child: const Icon(
                Icons.search,
                size: 30.0,
                color: Color.fromARGB(255, 74, 74, 74),
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            InkWell(
              onTap: () {
                widget.update("wish");
              },
              child: const Icon(
                Icons.favorite_border,
                size: 30.0,
                color: Color.fromARGB(255, 74, 74, 74),
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            InkWell(
              onTap: () {
                widget.update("cart");
              },
              child: const Icon(
                Icons.shopping_bag_outlined,
                size: 30.0,
                color: Color.fromARGB(255, 74, 74, 74),
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            InkWell(
              onTap: () {
                widget.update("signup");
              },
              child: const Icon(
                Icons.account_circle_outlined,
                size: 30.0,
                color: authPrimaryColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
