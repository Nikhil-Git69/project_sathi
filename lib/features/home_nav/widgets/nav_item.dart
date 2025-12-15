import 'package:flutter/material.dart';

class NavItem extends StatelessWidget {
  final IconData icon;
  final int index;
  final int currentIndex;
  final Function(int) onTap;

  const NavItem({
    required this.icon,
    required this.index,
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = index == currentIndex;
    final color = Theme.of(context).colorScheme;

    return InkWell(
      onTap: () => onTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected
              ? color.primary.withOpacity(0.25) // more visible selected state
              : Colors.transparent,
        ),
        child: Icon(
          icon,
          color: isSelected
              ? color.primary
              : color.onSurface.withOpacity(0.6), // subtle unselected
          size: 26,
        ),
      ),
    );
  }
}
