import 'dart:async';

import 'package:flutter/material.dart';
import 'package:better_player_plus/better_player_plus.dart';
import 'package:flutter_svg/svg.dart';
import 'package:woow_social/core/constants/svg_constants.dart';
import 'package:woow_social/core/utils/font_style_constants.dart';

class VideoPlayerView extends StatefulWidget {
  final String videoUrl;
  const VideoPlayerView({Key? key, required this.videoUrl}) : super(key: key);

  @override
  _VideoPlayerViewState createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView>
    with SingleTickerProviderStateMixin {
  late BetterPlayerController _betterPlayerController;
  bool _isPlaying = true;
  bool _showPlayPauseIcon = true;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  Timer? _hideIconTimer;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _startHideIconTimer();

    BetterPlayerDataSource dataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      widget.videoUrl,
      cacheConfiguration: const BetterPlayerCacheConfiguration(
        useCache: true,
        preCacheSize: 10 * 1024 * 1024,
        maxCacheSize: 200 * 1024 * 1024,
        maxCacheFileSize: 20 * 1024 * 1024,
      ),
    );

    _betterPlayerController = BetterPlayerController(
      const BetterPlayerConfiguration(
        autoPlay: true,
        looping: true,
        aspectRatio: 7.5 / 16,
        fit: BoxFit.cover,
        controlsConfiguration: BetterPlayerControlsConfiguration(
          showControls: false,
        ),
        handleLifecycle: true,
        autoDetectFullscreenDeviceOrientation: true,
        allowedScreenSleep: false,
      ),
      betterPlayerDataSource: dataSource,
    );
  }

  @override
  void dispose() {
    _hideIconTimer?.cancel();
    _animationController.dispose();
    _betterPlayerController.dispose();
    super.dispose();
  }

  void _startHideIconTimer() {
    _hideIconTimer?.cancel();
    _hideIconTimer = Timer(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _showPlayPauseIcon = false;
        });
      }
    });
  }

  void _togglePlayPause() {
    setState(() {
      _isPlaying = _betterPlayerController.isPlaying() ?? false;
      _showPlayPauseIcon = true;

      if (_isPlaying) {
        _betterPlayerController.play();
      } else {
        _betterPlayerController.pause();
      }

      _animationController.forward().then((_) {
        _animationController.reverse();
      });
      _startHideIconTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _togglePlayPause,
      child: Stack(
        alignment: Alignment.center,
        children: [
          BetterPlayer(controller: _betterPlayerController),
          if (_showPlayPauseIcon)
            Transform.scale(
              scale: _scaleAnimation.value,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Icon(
                  _isPlaying ? Icons.pause : Icons.play_arrow,
                  size: 36,
                  color: Colors.white,
                ),
              ),
            ),
          Positioned(
            bottom: 70,
            left: 16,
            right: 16,
            child: SizedBox(
                child: Row(
              children: [
                Expanded(child: Container()),
                SizedBox(
                  width: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          print('Report');
                        },
                        icon: SvgPicture.asset(SvgConsstants.report),
                      ),
                      const SizedBox(height: 10),
                      _rightActionButtons(
                        iconPath: SvgConsstants.likeVideoUnselected,
                        title: '225.9K',
                      ),
                      const SizedBox(height: 10),
                      _rightActionButtons(
                        iconPath: SvgConsstants.comments,
                        title: '225.9K',
                      ),
                      const SizedBox(height: 10),
                      _rightActionButtons(
                        iconPath: SvgConsstants.saveVideo,
                        title: '225.9K',
                      ),
                      const SizedBox(height: 10),
                      _rightActionButtons(
                        iconPath: SvgConsstants.share,
                        title: '225.9K',
                      ),
                    ],
                  ),
                )
              ],
            )),
          ),
        ],
      ),
    );
  }

  Widget _rightActionButtons(
      {required String iconPath, required String title}) {
    return InkWell(
      onTap: () {
        print('Right action button pressed');
      },
      child: SizedBox(
        height: 56,
        width: 40,
        child: Center(
          child: Column(
            children: [
              SvgPicture.asset(iconPath, height: 30, width: 30),
              Text(
                title,
                style:
                    FontStyles.fontRegular(fontSize: 12, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
