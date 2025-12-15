import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:project_sathi/features/home_nav/widgets/nav_item.dart';

class FloatingNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const FloatingNavBar({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Positioned(
      bottom: 24,
      left: 24,
      right: 24,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // frosted effect
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: color.surface.withOpacity(
                Theme.of(context).brightness == Brightness.light ? 0.95 : 0.85,
              ),
              borderRadius: BorderRadius.circular(32),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.12),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NavItem(icon: Icons.home, index: 0, currentIndex: currentIndex, onTap: onTap),
                NavItem(icon: Icons.manage_accounts, index: 1, currentIndex: currentIndex, onTap: onTap),
                NavItem(icon: Icons.settings, index: 2, currentIndex: currentIndex, onTap: onTap),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
