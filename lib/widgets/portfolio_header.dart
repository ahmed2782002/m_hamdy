import 'package:flutter/material.dart';

import '../portfolio_copy.dart';
import 'portfolio_ui.dart';

class PortfolioHeader extends StatelessWidget {
  const PortfolioHeader({
    super.key,
    required this.copy,
    required this.compact,
    required this.onLanguage,
    required this.isLight,
    required this.onThemeToggle,
    required this.scrollTo,
    required this.onContact,
  });
  final PortfolioCopy copy;
  final bool compact;
  final VoidCallback onLanguage;
  final bool isLight;
  final VoidCallback onThemeToggle;
  final ValueChanged<String> scrollTo;
  final VoidCallback onContact;

  @override
  Widget build(BuildContext context) => Center(
    child: Container(
      constraints: const BoxConstraints(maxWidth: 1180),
      margin: EdgeInsets.fromLTRB(compact ? 16 : 34, 22, compact ? 16 : 34, 0),
      padding: EdgeInsets.symmetric(
        horizontal: compact ? 16 : 24,
        vertical: 14,
      ),
      decoration: BoxDecoration(
        color: isLight ? const Color(0xF7FFFFFF) : const Color(0xCC1B1B34),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: PortfolioPalette.border(context)),
      ),
      child: Row(
        children: [
          Text(
            copy.name,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w800,
              color: portfolioOrange,
            ),
          ),
          const Spacer(),
          if (!compact) ...[
            _link(context, copy.works, 'works'),
            const SizedBox(width: 18),
            _link(context, copy.about, 'about'),
            const SizedBox(width: 18),
            _link(context, copy.contact, 'contact'),
            const SizedBox(width: 22),
          ],
          TextButton(
            onPressed: onLanguage,
            child: Text(
              copy.en ? 'عربي' : 'English',
              style: TextStyle(color: PortfolioPalette.text(context)),
            ),
          ),
          IconButton(
            onPressed: onThemeToggle,
            tooltip: isLight ? 'Switch to dark mode' : 'التبديل للوضع الفاتح',
            icon: Icon(
              isLight ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
              color: PortfolioPalette.text(context),
              size: 20,
            ),
          ),
          if (!compact) ...[
            const SizedBox(width: 8),
            GradientButton(
              label: copy.reachOut,
              icon: Icons.rocket_launch_rounded,
              onTap: onContact,
            ),
          ],
        ],
      ),
    ),
  );

  Widget _link(BuildContext context, String label, String target) => TextButton(
    onPressed: () => scrollTo(target),
    child: Text(
      label,
      style: TextStyle(color: PortfolioPalette.muted(context)),
    ),
  );
}
