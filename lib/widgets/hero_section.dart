import 'package:flutter/material.dart';

import '../portfolio_copy.dart';
import 'portfolio_ui.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
    required this.copy,
    required this.compact,
    required this.onContact,
    required this.onDownload,
  });
  final PortfolioCopy copy;
  final bool compact;
  final VoidCallback onContact;
  final VoidCallback onDownload;

  @override
  Widget build(BuildContext context) => Center(
    child: Container(
      constraints: const BoxConstraints(maxWidth: 1180),
      padding: EdgeInsets.fromLTRB(
        compact ? 22 : 54,
        compact ? 58 : 82,
        compact ? 22 : 54,
        40,
      ),
      child: Flex(
        direction: compact ? Axis.vertical : Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            fit: FlexFit.loose,
            flex: compact ? 0 : 11,
            child: _textBlock(context),
          ),
          if (compact) const SizedBox(height: 38),
          Flexible(
            fit: FlexFit.loose,
            flex: compact ? 0 : 9,
            child: _portrait(context),
          ),
        ],
      ),
    ),
  );

  Widget _textBlock(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: portfolioOrange.withOpacity(.12),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: portfolioOrange.withOpacity(.35)),
        ),
        child: Text(
          copy.role,
          style: const TextStyle(
            color: portfolioOrange,
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      const SizedBox(height: 25),
      Text(
        copy.headline,
        textAlign: copy.en ? TextAlign.left : TextAlign.right,
        style: TextStyle(
          fontSize: compact ? 42 : 58,
          height: 1.25,
          fontWeight: FontWeight.w900,
          color: PortfolioPalette.text(context),
        ),
      ),
      const SizedBox(height: 16),
      Text(
        copy.intro,
        style: TextStyle(
          color: PortfolioPalette.muted(context),
          fontSize: 16,
          height: 1.9,
        ),
      ),
      const SizedBox(height: 26),
      Wrap(
        spacing: 14,
        runSpacing: 12,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          GradientButton(
            label: copy.projectCta,
            icon: Icons.arrow_forward_rounded,
            onTap: onContact,
          ),
          TextButton.icon(
            onPressed: onDownload,
            icon: Icon(
              Icons.download_rounded,
              color: PortfolioPalette.muted(context),
            ),
            label: Text(
              copy.downloadCv,
              style: TextStyle(color: PortfolioPalette.muted(context)),
            ),
          ),
        ],
      ),
      const SizedBox(height: 25),
      Wrap(
        spacing: 18,
        runSpacing: 8,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.location_on_outlined,
                color: portfolioOrange,
                size: 18,
              ),
              const SizedBox(width: 5),
              Text(
                copy.en
                    ? 'Al-Kharj, Riyadh, Saudi Arabia'
                    : 'الخرج، الرياض، السعودية',
                style: TextStyle(
                  color: PortfolioPalette.muted(context),
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.circle, color: portfolioLime, size: 9),
              const SizedBox(width: 7),
              Text(
                copy.en ? 'Available for freelance' : 'متاح للعمل الحر',
                style: TextStyle(
                  color: PortfolioPalette.muted(context),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );

  Widget _portrait(BuildContext context) => Container(
    width: compact ? 330 : 390,
    height: compact ? 360 : 450,
    margin: EdgeInsetsDirectional.only(start: compact ? 0 : 48),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 300,
          height: 340,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(42),
            boxShadow: [
              BoxShadow(
                color: portfolioPink.withOpacity(.2),
                blurRadius: 80,
                spreadRadius: 25,
              ),
            ],
          ),
        ),
        Transform.rotate(
          angle: -.045,
          child: Container(
            width: compact ? 260 : 318,
            height: compact ? 320 : 400,
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(38),
              gradient: const LinearGradient(
                colors: [portfolioOrange, portfolioPink],
              ),
              boxShadow: [
                BoxShadow(
                  color: portfolioOrange.withOpacity(.24),
                  blurRadius: 32,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(35),
              child: Transform.rotate(
                angle: .045,
                child: Image.asset(
                  'asstes/my image/WhatsApp Image 2026-10-20 at 4.21.33 AM.jpeg',
                  fit: BoxFit.cover,
                  alignment: const Alignment(0, -.15),
                ),
              ),
            ),
          ),
        ),
        _badge(
          Icons.play_arrow_rounded,
          const Color(0xFFFF3030),
          top: 53,
          right: 4,
        ),
        _badge(Icons.camera_alt_rounded, portfolioPink, bottom: 63, left: 2),
        Positioned(
          bottom: 12,
          right: 12,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
            decoration: BoxDecoration(
              color: PortfolioPalette.panel(context).withOpacity(.94),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: PortfolioPalette.border(context)),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.auto_awesome,
                  color: portfolioOrange,
                  size: 18,
                ),
                const SizedBox(width: 8),
                Text(
                  copy.en ? 'From concept to final cut' : 'من الفكرة إلى النشر',
                  style: TextStyle(
                    fontSize: 11,
                    color: PortfolioPalette.text(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );

  Widget _badge(
    IconData icon,
    Color color, {
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) => Positioned(
    top: top,
    bottom: bottom,
    left: left,
    right: right,
    child: Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xFF2B2B47),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(.8)),
        boxShadow: [BoxShadow(color: color.withOpacity(.25), blurRadius: 20)],
      ),
      child: Icon(icon, color: color),
    ),
  );
}
