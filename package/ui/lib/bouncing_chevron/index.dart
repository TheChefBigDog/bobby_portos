import 'package:flutter/material.dart';

class BouncingChevron extends StatefulWidget {
  final VoidCallback? onPressed;
  const BouncingChevron({super.key, this.onPressed});

  @override
  State<BouncingChevron> createState() => _BouncingChevronState();
}

class _BouncingChevronState extends State<BouncingChevron> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 800),
  )..repeat(reverse: true);

  late final Animation<double> _offset = Tween<double>(
    begin: 0,
    end: 12,
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _offset,
      builder: (context, _) => Transform.translate(
        offset: Offset(0, -_offset.value),
        child: IconButton(
          onPressed: widget.onPressed,
          icon: const Icon(Icons.keyboard_arrow_down, size: 48, color: Colors.red),
        ),
      ),
    );
  }
}
