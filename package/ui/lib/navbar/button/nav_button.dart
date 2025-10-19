import 'package:flutter/material.dart';

class NavButton extends StatefulWidget {
  final String title;
  final VoidCallback? onTap;

  const NavButton({super.key, required this.title, this.onTap});

  @override
  State<NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: _hovering ? Colors.red : Colors.grey[300],
          ),
          child: Text(widget.title),
        ),
      ),
    );
  }
}
