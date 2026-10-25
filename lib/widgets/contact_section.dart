import 'package:flutter/material.dart';

import '../portfolio_copy.dart';
import 'portfolio_ui.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({
    super.key,
    required this.copy,
    required this.compact,
    required this.onEmail,
  });
  final PortfolioCopy copy;
  final bool compact;
  final VoidCallback onEmail;

  @override
  Widget build(BuildContext context) => Center(
    child: Container(
      constraints: const BoxConstraints(maxWidth: 1120),
      margin: EdgeInsets.fromLTRB(compact ? 18 : 30, 58, compact ? 18 : 30, 30),
      padding: EdgeInsets.all(compact ? 23 : 38),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        gradient: LinearGradient(
          colors: [
            portfolioOrange.withOpacity(.2),
            portfolioPink.withOpacity(.13),
            PortfolioPalette.panel(context),
          ],
        ),
        border: Border.all(color: PortfolioPalette.border(context)),
      ),
      child: Flex(
        direction: compact ? Axis.vertical : Axis.horizontal,
        crossAxisAlignment: compact
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: [
          Flexible(
            fit: FlexFit.loose,
            flex: compact ? 0 : 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  copy.contactEyebrow,
                  style: const TextStyle(
                    color: portfolioOrange,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  copy.contactTitle,
                  style: TextStyle(
                    fontSize: compact ? 25 : 34,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  copy.contactText,
                  style: TextStyle(color: PortfolioPalette.muted(context)),
                ),
              ],
            ),
          ),
          if (compact) const SizedBox(height: 22),
          GradientButton(
            label: copy.emailMe,
            icon: Icons.mail_outline_rounded,
            onTap: onEmail,
          ),
        ],
      ),
    ),
  );
}
