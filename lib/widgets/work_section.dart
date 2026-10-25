import 'dart:html' as html;
import 'dart:ui_web' as ui;

import 'package:flutter/material.dart';

import '../portfolio_copy.dart';
import 'portfolio_ui.dart';

final Set<String> _registeredRemoteThumbnailViews = {};

class PortfolioVideo {
  const PortfolioVideo.youtube(String id, this.color)
    : youtubeId = id,
      driveId = null;
  const PortfolioVideo.drive(String id, this.color)
    : youtubeId = null,
      driveId = id;
  final Color color;
  final String? youtubeId;
  final String? driveId;

  String get thumbnail => youtubeId != null
      ? 'https://img.youtube.com/vi/$youtubeId/hqdefault.jpg'
      : 'https://drive.google.com/thumbnail?id=$driveId&sz=w1000';
}

class WorkSection extends StatelessWidget {
  const WorkSection({
    super.key,
    required this.copy,
    required this.compact,
    required this.videos,
    required this.onPlay,
  });
  final PortfolioCopy copy;
  final bool compact;
  final List<PortfolioVideo> videos;
  final ValueChanged<PortfolioVideo> onPlay;

  @override
  Widget build(BuildContext context) => Center(
    child: Container(
      constraints: const BoxConstraints(maxWidth: 1120),
      padding: EdgeInsets.fromLTRB(
        compact ? 18 : 30,
        76,
        compact ? 18 : 30,
        28,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeading(
            eyebrow: copy.worksEyebrow,
            title: copy.worksTitle,
            description: copy.worksIntro,
          ),
          const SizedBox(height: 28),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: videos.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: compact ? 1 : 3,
              crossAxisSpacing: 18,
              mainAxisSpacing: 18,
              childAspectRatio: compact ? 1.28 : 1.13,
            ),
            itemBuilder: (context, i) => _videoCard(
              context,
              videos[i],
              copy.videoTitles[i],
              copy.videoDescriptions[i],
              () => onPlay(videos[i]),
            ),
          ),
        ],
      ),
    ),
  );

  Widget _videoCard(
    BuildContext context,
    PortfolioVideo video,
    String title,
    String description,
    VoidCallback play,
  ) => InkWell(
    onTap: play,
    borderRadius: BorderRadius.circular(22),
    child: Container(
      decoration: BoxDecoration(
        color: PortfolioPalette.panel(context),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: PortfolioPalette.border(context)),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                _thumbnail(video),
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(.48),
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    width: 58,
                    height: 58,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: video.color.withOpacity(.93),
                      boxShadow: [
                        BoxShadow(
                          color: video.color.withOpacity(.35),
                          blurRadius: 24,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.play_arrow_rounded,
                      size: 37,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  top: 14,
                  right: 14,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.play_circle_outline, size: 14),
                        const SizedBox(width: 5),
                        Text(copy.watch, style: const TextStyle(fontSize: 11)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(17, 14, 17, 16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: PortfolioPalette.muted(context),
                          fontSize: 12,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.north_west_rounded, size: 18, color: video.color),
              ],
            ),
          ),
        ],
      ),
    ),
  );

  Widget _thumbnail(PortfolioVideo video) {
    final fallback =
        (BuildContext context, Object error, StackTrace? stackTrace) =>
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    video.color.withOpacity(.4),
                    const Color(0xFF14152B),
                  ],
                ),
              ),
              child: const Center(
                child: Icon(
                  Icons.movie_creation_outlined,
                  size: 78,
                  color: Colors.white24,
                ),
              ),
            );
    if (video.youtubeId != null || video.driveId != null) {
      final viewType = 'portfolio-remote-thumbnail-${video.youtubeId ?? video.driveId}';
      if (_registeredRemoteThumbnailViews.add(viewType)) {
        ui.platformViewRegistry.registerViewFactory(viewType, (int viewId) {
          final container = html.DivElement()
            ..style.width = '100%'
            ..style.height = '100%'
            ..style.display = 'flex'
            ..style.alignItems = 'center'
            ..style.justifyContent = 'center'
            ..style.background =
                'linear-gradient(135deg, ${_toCssColor(video.color)}66, #14152B)';
          final image = html.ImageElement()
            ..src = video.thumbnail
            ..draggable = false
            ..style.width = '100%'
            ..style.height = '100%'
            ..style.objectFit = 'cover';
          image.onError.listen((_) {
            image.remove();
            final playIcon = html.DivElement()
              ..text = '▶'
              ..style.width = '58px'
              ..style.height = '58px'
              ..style.display = 'flex'
              ..style.alignItems = 'center'
              ..style.justifyContent = 'center'
              ..style.borderRadius = '50%'
              ..style.backgroundColor = _toCssColor(video.color)
              ..style.color = '#FFFFFF'
              ..style.fontSize = '28px';
            container.append(playIcon);
          });
          container.append(image);
          return container;
        });
      }
      return HtmlElementView(viewType: viewType);
    }
    return Image.asset(
      video.thumbnail,
      fit: BoxFit.cover,
      errorBuilder: fallback,
    );
  }

  String _toCssColor(Color color) =>
      '#${color.value.toRadixString(16).padLeft(8, '0').substring(2)}';
}
