import 'package:flutter/material.dart';

import '../portfolio_copy.dart';
import 'portfolio_ui.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({
    super.key,
    required this.copy,
    required this.compact,
    required this.onEmail,
    required this.onWhatsApp,
    required this.onFacebook,
    required this.onTelegram,
    required this.onInstagram,
  });

  final PortfolioCopy copy;
  final bool compact;
  final VoidCallback onEmail;
  final VoidCallback onWhatsApp;
  final VoidCallback onFacebook;
  final VoidCallback onTelegram;
  final VoidCallback onInstagram;

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
          const SizedBox(height: 22),
          Wrap(
            spacing: 14,
            runSpacing: 14,
            children: [
              _ContactButton(
                label: 'WhatsApp',
                detail: '+20 15 50055904',
                icon: Icons.chat_bubble_rounded,
                color: const Color(0xFF25D366),
                compact: compact,
                onTap: onWhatsApp,
              ),
              _ContactButton(
                label: 'Facebook',
                icon: Icons.facebook_rounded,
                color: const Color(0xFF1877F2),
                compact: compact,
                onTap: onFacebook,
              ),
              _ContactButton(
                label: 'Telegram',
                icon: Icons.send_rounded,
                color: const Color(0xFF26A5E4),
                compact: compact,
                onTap: onTelegram,
              ),
              _ContactButton(
                label: 'Instagram',
                icon: Icons.camera_alt_rounded,
                color: portfolioPink,
                compact: compact,
                onTap: onInstagram,
              ),
            ],
          ),
          const SizedBox(height: 18),
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

class _ContactButton extends StatelessWidget {
  const _ContactButton({
    required this.label,
    required this.icon,
    required this.color,
    required this.onTap,
    required this.compact,
    this.detail,
  });

  final String label;
  final String? detail;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  final bool compact;

  @override
  Widget build(BuildContext context) => Material(
    color: PortfolioPalette.panel(context),
    borderRadius: BorderRadius.circular(16),
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: compact ? 132 : 158,
        height: 132,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: PortfolioPalette.border(context)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 38, color: color),
            const SizedBox(height: 10),
            Text(label, style: const TextStyle(fontWeight: FontWeight.w700)),
            if (detail != null) ...[
              const SizedBox(height: 4),
              Text(
                detail!,
                style: TextStyle(
                  fontSize: 10,
                  color: PortfolioPalette.muted(context),
                ),
              ),
            ],
          ],
        ),
      ),
    ),
  );
}
