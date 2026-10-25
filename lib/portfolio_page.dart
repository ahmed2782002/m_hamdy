import 'dart:html' as html;
import 'dart:ui_web' as ui;

import 'package:flutter/material.dart';

import 'portfolio_copy.dart';
import 'widgets/about_section.dart';
import 'widgets/contact_section.dart';
import 'widgets/hero_section.dart';
import 'widgets/portfolio_header.dart';
import 'widgets/portfolio_ui.dart';
import 'widgets/stats_section.dart';
import 'widgets/work_section.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({
    super.key,
    required this.isLight,
    required this.onThemeToggle,
  });
  final bool isLight;
  final VoidCallback onThemeToggle;
  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  bool _english = false;
  final _worksKey = GlobalKey();
  final _aboutKey = GlobalKey();
  final _contactKey = GlobalKey();
  final _videos = const [
    PortfolioVideo.youtube('TwLypOHoMJc', portfolioOrange),
    PortfolioVideo.youtube('bx3DhIYTG7M', portfolioPink),
    PortfolioVideo.youtube('VVRG8wy44ic', portfolioCyan),
    PortfolioVideo.drive('1X40wwIypBCqxjLiyEXrJxNIWihRyNXpu', portfolioLime),
    PortfolioVideo.drive('15yyHIZrC_vgXEjMvbYCmmVfq-_CcuOiC', portfolioOrange),
    PortfolioVideo.drive('1GYrWSGvVpQ6PWD4csbefZP6uBN_7WsKq', portfolioCyan),
  ];

  void _scrollTo(String section) {
    final key = switch (section) {
      'works' => _worksKey,
      'about' => _aboutKey,
      _ => _contactKey,
    };
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _email() =>
      html.AnchorElement(href: 'mailto:mrmody572002@gmail.com').click();

  void _downloadCv() {
    html.AnchorElement(href: 'assets/asstes/CV_English_260925_235303.pdf')
      ..download = 'Mahmoud_Hamdy_Agamy_CV.pdf'
      ..click();
  }

  void _playVideo(PortfolioVideo video) {
    final id = 'portfolio-video-${DateTime.now().microsecondsSinceEpoch}';
    ui.platformViewRegistry.registerViewFactory(id, (int viewId) {
      if (video.driveId != null || video.youtubeId != null) {
        return html.IFrameElement()
          ..src = video.youtubeId != null
              ? 'https://www.youtube.com/embed/${video.youtubeId}?autoplay=1'
              : 'https://drive.google.com/file/d/${video.driveId}/preview'
          ..allow = 'autoplay; encrypted-media; fullscreen; picture-in-picture'
          ..setAttribute('allowfullscreen', 'true')
          ..style.width = '100%'
          ..style.height = '100%'
          ..style.border = '0'
          ..style.backgroundColor = '#080812';
      }
      throw StateError('Unsupported video source');
    });
    showDialog<void>(
      context: context,
      barrierColor: Colors.black87,
      builder: (_) => Dialog(
        backgroundColor: widget.isLight
            ? const Color(0xFFF7F5FB)
            : const Color(0xFF111222),
        insetPadding: const EdgeInsets.all(20),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Stack(
            children: [
              HtmlElementView(viewType: id),
              Positioned(
                top: 4,
                left: 4,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final compact = MediaQuery.sizeOf(context).width < 760;
    final copy = PortfolioCopy(_english);
    return Directionality(
      textDirection: _english ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment(0.78, -0.65),
              radius: 1.15,
              colors: widget.isLight
                  ? const [
                      Color(0xFFFFE8D9),
                      Color(0xFFF7F5FB),
                      Color(0xFFF7F5FB),
                    ]
                  : const [Color(0xFF281147), portfolioBg, portfolioBg],
            ),
          ),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: PortfolioHeader(
                  copy: copy,
                  compact: compact,
                  onLanguage: () => setState(() => _english = !_english),
                  isLight: widget.isLight,
                  onThemeToggle: widget.onThemeToggle,
                  scrollTo: _scrollTo,
                  onContact: () => _scrollTo('contact'),
                ),
              ),
              SliverToBoxAdapter(
                child: HeroSection(
                  copy: copy,
                  compact: compact,
                  onContact: () => _scrollTo('contact'),
                  onDownload: _downloadCv,
                ),
              ),
              SliverToBoxAdapter(
                child: StatsSection(copy: copy, compact: compact),
              ),
              SliverToBoxAdapter(
                key: _worksKey,
                child: WorkSection(
                  copy: copy,
                  compact: compact,
                  videos: _videos,
                  onPlay: _playVideo,
                ),
              ),
              SliverToBoxAdapter(
                key: _aboutKey,
                child: AboutSection(copy: copy, compact: compact),
              ),
              SliverToBoxAdapter(
                key: _contactKey,
                child: Column(
                  children: [
                    ContactSection(
                      copy: copy,
                      compact: compact,
                      onEmail: _email,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 30),
                      child: Center(
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 22,
                          runSpacing: 8,
                          children: [
                            Text(
                              '01562340729',
                              style: TextStyle(
                                color: PortfolioPalette.muted(context),
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              'mrmody572002@gmail.com',
                              style: TextStyle(
                                color: PortfolioPalette.muted(context),
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              'linkedin.com/in/mahmoud-hamdi-555152346',
                              style: TextStyle(
                                color: PortfolioPalette.muted(context),
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              _english
                                  ? '© Mahmoud Hamdy Agamy'
                                  : '© محمود حمدي عجمي',
                              style: TextStyle(
                                color: PortfolioPalette.muted(context),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
