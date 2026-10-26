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
  final _aiVideos = const [
    PortfolioVideo.asset(
      'asstes/ai_videos/gemini_generated_video_341f7387.mp4',
      portfolioOrange,
    ),
    PortfolioVideo.asset('asstes/ai_videos/ai_video_2.mp4', portfolioPink),
    PortfolioVideo.asset('asstes/ai_videos/ai_video_3.mp4', portfolioCyan),
    PortfolioVideo.asset('asstes/ai_videos/ai_video_4.mp4', portfolioLime),
    PortfolioVideo.asset('asstes/ai_videos/ai_video_5.mp4', portfolioOrange),
  ];
  List<PortfolioVideo> get _allVideos => [..._videos, ..._aiVideos];

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

  void _openInstagram() => html.window.open(
    'https://www.instagram.com/quran_k.7229?exln=MXdrODZiN3l3Z2Rjbw==',
    '_blank',
  );

  void _openTikTok() => html.window.open(
    'https://www.tiktok.com/@mody_5577?_r=1&_t=ZS-9Ar7lttH9Zk',
    '_blank',
  );

  void _downloadCv() {
    html.AnchorElement(href: 'assets/asstes/CV_English_260925_235303.pdf')
      ..download = 'Mahmoud_Hamdy_Agamy_CV.pdf'
      ..click();
  }

  String _registerVideoPlayer(PortfolioVideo video) {
    final id = 'portfolio-video-${DateTime.now().microsecondsSinceEpoch}';
    ui.platformViewRegistry.registerViewFactory(id, (int viewId) {
      if (video.assetPath != null) {
        return html.VideoElement()
          ..src = 'assets/${video.assetPath!}'
          ..controls = true
          ..autoplay = true
          ..preload = 'metadata'
          ..setAttribute('playsinline', 'true')
          ..style.width = '100%'
          ..style.height = '100%'
          ..style.backgroundColor = '#080812';
      }
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
    return id;
  }

  void _playVideo(PortfolioVideo video) {
    final copy = PortfolioCopy(_english);
    var selectedIndex = _allVideos.indexOf(video);
    var viewType = _registerVideoPlayer(video);
    showDialog<void>(
      context: context,
      barrierColor: Colors.black87,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, setDialogState) => Dialog(
          backgroundColor: widget.isLight
              ? const Color(0xFFF7F5FB)
              : const Color(0xFF111222),
          insetPadding: const EdgeInsets.all(20),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Stack(
              children: [
                Positioned.fill(
                  child: HtmlElementView(
                    key: ValueKey(viewType),
                    viewType: viewType,
                  ),
                ),
                Positioned(
                  top: 4,
                  right: 4,
                  child: IconButton(
                    tooltip: copy.closeVideo,
                    onPressed: () => Navigator.pop(dialogContext),
                    icon: const Icon(Icons.close, color: Colors.white),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.black54,
                    ),
                  ),
                ),
                Positioned(
                  left: 4,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: IconButton.filled(
                      tooltip: copy.previousVideo,
                      onPressed: selectedIndex == 0
                          ? null
                          : () => setDialogState(() {
                              selectedIndex--;
                              viewType = _registerVideoPlayer(
                                _allVideos[selectedIndex],
                              );
                            }),
                      icon: const Icon(Icons.chevron_left_rounded),
                    ),
                  ),
                ),
                Positioned(
                  right: 4,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: IconButton.filled(
                      tooltip: copy.nextVideo,
                      onPressed: selectedIndex == _allVideos.length - 1
                          ? null
                          : () => setDialogState(() {
                              selectedIndex++;
                              viewType = _registerVideoPlayer(
                                _allVideos[selectedIndex],
                              );
                            }),
                      icon: const Icon(Icons.chevron_right_rounded),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: const Color(0xA6000000),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 5,
                        ),
                        child: Text(
                          '${selectedIndex + 1} / ${_allVideos.length}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
                child: StatsSection(
                  copy: copy,
                  compact: compact,
                  onInstagram: _openInstagram,
                  onTikTok: _openTikTok,
                ),
              ),
              SliverToBoxAdapter(
                key: _worksKey,
                child: WorkSection(
                  copy: copy,
                  compact: compact,
                  videos: _videos,
                  aiVideos: _aiVideos,
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
                              '0545590706',
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
