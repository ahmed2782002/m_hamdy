import 'package:flutter/material.dart';

import '../portfolio_copy.dart';
import 'portfolio_ui.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key, required this.copy, required this.compact});
  final PortfolioCopy copy;
  final bool compact;

  @override
  Widget build(BuildContext context) => Center(
    child: Container(
      constraints: const BoxConstraints(maxWidth: 1120),
      padding: EdgeInsets.fromLTRB(
        compact ? 18 : 30,
        68,
        compact ? 18 : 30,
        28,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeading(
            eyebrow: copy.aboutEyebrow,
            title: copy.aboutTitle,
            description: copy.aboutText,
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              _detail(context, Icons.school_outlined, copy.education),
              _detail(context, Icons.translate_rounded, copy.languages),
            ],
          ),
          const SizedBox(height: 22),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: copy.skills
                .map(
                  (skill) => Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: PortfolioPalette.panel(context),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: PortfolioPalette.border(context),
                      ),
                    ),
                    child: Text(
                      skill,
                      style: TextStyle(
                        fontSize: 12,
                        color: PortfolioPalette.text(context),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 25),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: PortfolioPalette.panel(context),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: portfolioOrange.withOpacity(.38)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  copy.projectTitle,
                  style: const TextStyle(
                    color: portfolioOrange,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 9),
                Text(
                  copy.projectText,
                  style: TextStyle(
                    color: PortfolioPalette.muted(context),
                    height: 1.8,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );

  Widget _detail(BuildContext context, IconData icon, String text) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
    decoration: BoxDecoration(
      color: PortfolioPalette.panel(context),
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: PortfolioPalette.border(context)),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: portfolioOrange),
        const SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(color: PortfolioPalette.text(context), fontSize: 12),
        ),
      ],
    ),
  );
}
