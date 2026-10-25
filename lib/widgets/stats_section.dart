import 'package:flutter/material.dart';

import '../portfolio_copy.dart';
import 'portfolio_ui.dart';

class StatsSection extends StatelessWidget {
  const StatsSection({
    super.key,
    required this.copy,
    required this.compact,
    required this.onInstagram,
    required this.onTikTok,
  });
  final PortfolioCopy copy;
  final bool compact;
  final VoidCallback onInstagram;
  final VoidCallback onTikTok;

  @override
  Widget build(BuildContext context) => Center(
    child: Container(
      constraints: const BoxConstraints(maxWidth: 1120),
      padding: EdgeInsets.symmetric(
        horizontal: compact ? 18 : 30,
        vertical: 18,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              '${copy.statsEyebrow}  /  ${copy.statsTitle}',
              style: TextStyle(
                color: PortfolioPalette.text(context),
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              _socialButton(
                context,
                label: copy.instagram,
                icon: Icons.camera_alt_rounded,
                color: portfolioPink,
                onTap: onInstagram,
              ),
              _socialButton(
                context,
                label: copy.tiktok,
                icon: Icons.music_note_rounded,
                color: portfolioCyan,
                onTap: onTikTok,
              ),
            ],
          ),
          const SizedBox(height: 14),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: compact ? 2 : 4,
            mainAxisSpacing: 14,
            crossAxisSpacing: 14,
            childAspectRatio: compact ? 1.25 : 1.65,
            children: [
              _stat(
                context,
                '5.8K',
                copy.instagram,
                copy.followers,
                portfolioOrange,
              ),
              _stat(
                context,
                '517K',
                copy.instagram,
                copy.topVideo,
                portfolioPink,
              ),
              _stat(
                context,
                '19K',
                copy.tiktok,
                copy.followers,
                portfolioLime,
              ),
              _stat(context, '250K', copy.tiktok, copy.likes, portfolioCyan),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
            decoration: BoxDecoration(
              color: PortfolioPalette.panel(context),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: portfolioPink.withOpacity(.35)),
            ),
            child: Row(
              children: [
                const Icon(Icons.trending_up_rounded, color: portfolioPink),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    copy.tiktokDetail,
                    style: TextStyle(
                      color: PortfolioPalette.muted(context),
                      fontSize: 13,
                      height: 1.6,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );

  Widget _socialButton(
    BuildContext context, {
    required String label,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) => Material(
    color: PortfolioPalette.panel(context),
    borderRadius: BorderRadius.circular(24),
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: color.withOpacity(.55)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 18, color: color),
            const SizedBox(width: 7),
            Text(
              label,
              style: TextStyle(
                color: PortfolioPalette.text(context),
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    ),
  );

  Widget _stat(
    BuildContext context,
    String value,
    String platform,
    String label,
    Color color,
  ) => Container(
    padding: EdgeInsets.all(compact ? 12 : 18),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: PortfolioPalette.light(context)
            ? [Colors.white, const Color(0xFFF2EEF8)]
            : [Colors.white.withOpacity(.09), Colors.white.withOpacity(.025)],
      ),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: color.withOpacity(.5)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          platform.toUpperCase(),
          style: TextStyle(
            color: color,
            fontSize: 10,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
          ),
        ),
        SizedBox(height: compact ? 5 : 8),
        Text(
          value,
          style: TextStyle(
            color: color,
            fontSize: compact ? 24 : 34,
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(height: compact ? 2 : 4),
        Text(
          label,
          style: TextStyle(
            color: PortfolioPalette.muted(context),
            fontSize: compact ? 11 : 12,
          ),
        ),
      ],
    ),
  );
}
