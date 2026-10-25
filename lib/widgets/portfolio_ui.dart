import 'package:flutter/material.dart';

const portfolioBg = Color(0xFF0D0E20);
const portfolioPanel = Color(0xFF1B1C36);
const portfolioMuted = Color(0xFFA5A6C4);
const portfolioOrange = Color(0xFFFF8A3D);
const portfolioPink = Color(0xFFEC4899);
const portfolioLime = Color(0xFF84CC16);
const portfolioCyan = Color(0xFF38BDF8);

class PortfolioPalette {
  static bool light(BuildContext context) =>
      Theme.of(context).brightness == Brightness.light;
  static Color text(BuildContext context) =>
      light(context) ? const Color(0xFF211B31) : Colors.white;
  static Color muted(BuildContext context) =>
      light(context) ? const Color(0xFF6E687C) : portfolioMuted;
  static Color panel(BuildContext context) =>
      light(context) ? const Color(0xFFFFFEFF) : portfolioPanel;
  static Color border(BuildContext context) =>
      light(context) ? const Color(0xFFE2DDEB) : Colors.white12;
  static Color page(BuildContext context) =>
      light(context) ? const Color(0xFFF7F5FB) : portfolioBg;
}

class GradientButton extends StatelessWidget {
  const GradientButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
  });
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => DecoratedBox(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      gradient: const LinearGradient(colors: [portfolioOrange, portfolioPink]),
      boxShadow: [
        BoxShadow(color: portfolioOrange.withOpacity(.25), blurRadius: 20),
      ],
    ),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(30),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 17, color: Colors.white),
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class SectionHeading extends StatelessWidget {
  const SectionHeading({
    super.key,
    required this.eyebrow,
    required this.title,
    required this.description,
  });
  final String eyebrow;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        eyebrow,
        style: const TextStyle(
          color: portfolioOrange,
          fontSize: 13,
          fontWeight: FontWeight.w700,
        ),
      ),
      const SizedBox(height: 8),
      Text(
        title,
        style: const TextStyle(fontSize: 31, fontWeight: FontWeight.w900),
      ),
      const SizedBox(height: 9),
      Text(
        description,
        style: TextStyle(
          color: PortfolioPalette.muted(context),
          height: 1.8,
          fontSize: 14,
        ),
      ),
    ],
  );
}
