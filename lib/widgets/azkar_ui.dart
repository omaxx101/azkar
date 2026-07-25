import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AzkarPageScaffold extends StatelessWidget {
  const AzkarPageScaffold({
    super.key,
    required this.title,
    required this.subtitle,
    required this.accentColor,
    required this.itemCount,
    required this.itemBuilder,
    this.onHomePressed,
    this.audioAssetPath,
  });

  final String title;
  final String subtitle;
  final Color accentColor;
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final VoidCallback? onHomePressed;
  final String? audioAssetPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _BackgroundPattern(accentColor: accentColor),
          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final horizontalPadding =
                    constraints.maxWidth >= 900 ? 32.0 : 16.0;
                final contentWidth =
                    constraints.maxWidth >= 900 ? 860.0 : double.infinity;

                return Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: contentWidth),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                            horizontalPadding,
                            12,
                            horizontalPadding,
                            12,
                          ),
                          child: _PageHeader(
                            title: title,
                            subtitle: subtitle,
                            onHomePressed: onHomePressed,
                          ),
                        ),
                        if (audioAssetPath != null)
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                              horizontalPadding,
                              0,
                              horizontalPadding,
                              16,
                            ),
                            child: AzkarAudioControlCard(
                              audioAssetPath: audioAssetPath!,
                              accentColor: accentColor,
                            ),
                          ),
                        Expanded(
                          child: CustomScrollView(
                            slivers: [
                              SliverPadding(
                                padding: EdgeInsets.fromLTRB(
                                  horizontalPadding,
                                  0,
                                  horizontalPadding,
                                  32,
                                ),
                                sliver: SliverList.separated(
                                  itemCount: itemCount,
                                  itemBuilder: itemBuilder,
                                  separatorBuilder: (_, __) =>
                                      const SizedBox(height: 14),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AzkarContentCard extends StatelessWidget {
  const AzkarContentCard({
    super.key,
    required this.indexLabel,
    required this.arabicText,
    required this.englishText,
    required this.amharicText,
    required this.repeatCount,
    required this.accentColor,
  });

  final String indexLabel;
  final String arabicText;
  final String englishText;
  final String amharicText;
  final int repeatCount;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  indexLabel,
                  style: theme.textTheme.labelLarge,
                ),
                const Spacer(),
                Text(
                  '${repeatCount}x',
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: accentColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Text(
                arabicText,
                textAlign: TextAlign.right,
                style: theme.textTheme.titleLarge?.copyWith(
                  height: 1.8,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            if (englishText.isNotEmpty) ...[
              const SizedBox(height: 12),
              Text(englishText),
            ],
            if (amharicText.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(
                amharicText,
                style: TextStyle(
                  color: accentColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class AzkarHomeTile extends StatelessWidget {
  const AzkarHomeTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.accentColor,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Color accentColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(28),
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          gradient: LinearGradient(
            colors: [
              accentColor.withOpacity(.22),
              accentColor.withOpacity(.08),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              icon,
              color: accentColor,
              size: 32,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}

class _BackgroundPattern extends StatelessWidget {
  const _BackgroundPattern({
    required this.accentColor,
  });

  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            accentColor.withOpacity(.20),
            const Color(0xFF071410),
            const Color(0xFF05100D),
          ],
        ),
      ),
      child: const SizedBox.expand(),
    );
  }
}

class _PageHeader extends StatelessWidget {
  const _PageHeader({
    required this.title,
    required this.subtitle,
    required this.onHomePressed,
  });

  final String title;
  final String subtitle;
  final VoidCallback? onHomePressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: onHomePressed ?? () => Navigator.maybePop(context),
              icon: const Icon(Icons.arrow_back_rounded),
            ),
            Expanded(
              child: Text(
                title,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
        Text(
          subtitle,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}

class AzkarAudioControlCard extends StatefulWidget {
  const AzkarAudioControlCard({
    super.key,
    required this.audioAssetPath,
    required this.accentColor,
  });

  final String audioAssetPath;
  final Color accentColor;

  @override
  State<AzkarAudioControlCard> createState() => _AzkarAudioControlCardState();
}

class _AzkarAudioControlCardState extends State<AzkarAudioControlCard> {
  final AudioPlayer _player = AudioPlayer();

  StreamSubscription<PlayerState>? _stateSubscription;
  StreamSubscription<Duration>? _positionSubscription;
  StreamSubscription<Duration>? _durationSubscription;
  StreamSubscription<void>? _completionSubscription;

  PlayerState _playerState = PlayerState.stopped;
  Duration _position = Duration.zero;
  Duration _duration = Duration.zero;
  bool _isPreparing = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();

    _stateSubscription = _player.onPlayerStateChanged.listen((state) {
      if (!mounted) {
        return;
      }

      setState(() {
        _playerState = state;
        if (state == PlayerState.playing ||
            state == PlayerState.paused ||
            state == PlayerState.stopped ||
            state == PlayerState.completed) {
          _isPreparing = false;
        }
      });
    });

    _positionSubscription = _player.onPositionChanged.listen((position) {
      if (!mounted) {
        return;
      }

      setState(() {
        _position = position;
      });
    });

    _durationSubscription = _player.onDurationChanged.listen((duration) {
      if (!mounted) {
        return;
      }

      setState(() {
        _duration = duration;
      });
    });

    _completionSubscription = _player.onPlayerComplete.listen((_) {
      if (!mounted) {
        return;
      }

      setState(() {
        _playerState = PlayerState.completed;
        _position = _duration;
        _isPreparing = false;
      });
    });
  }

  @override
  void dispose() {
    unawaited(_stateSubscription?.cancel());
    unawaited(_positionSubscription?.cancel());
    unawaited(_durationSubscription?.cancel());
    unawaited(_completionSubscription?.cancel());
    unawaited(_player.dispose());
    super.dispose();
  }

  String _normalizeAssetPath(String assetPath) {
    return assetPath.startsWith('assets/')
        ? assetPath.replaceFirst('assets/', '')
        : assetPath;
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  String _statusText() {
    if (_errorMessage != null) {
      return _errorMessage!;
    }

    if (_isPreparing) {
      return 'Preparing audio...';
    }

    switch (_playerState) {
      case PlayerState.playing:
        return 'Audio is playing';
      case PlayerState.paused:
        return 'Audio paused';
      case PlayerState.stopped:
        return 'Ready to play';
      case PlayerState.completed:
        return 'Playback finished';
      case PlayerState.disposed:
        return 'Audio unavailable';
    }
  }

  bool get _hasDuration => _duration.inMilliseconds > 0;

  Future<void> _playFromStart() async {
    final normalizedPath = _normalizeAssetPath(widget.audioAssetPath);

    setState(() {
      _errorMessage = null;
      _isPreparing = true;
      _position = Duration.zero;
      _duration = Duration.zero;
    });

    try {
      await _player.play(AssetSource(normalizedPath));
    } catch (_) {
      if (!mounted) {
        return;
      }

      setState(() {
        _isPreparing = false;
        _errorMessage = 'Could not prepare audio.';
      });
    }
  }

  Future<void> _togglePlayback() async {
    if (_isPreparing) {
      return;
    }

    try {
      if (_playerState == PlayerState.playing) {
        await _player.pause();
        return;
      }

      if (_playerState == PlayerState.paused) {
        await _player.resume();
        return;
      }

      await _playFromStart();
    } catch (_) {
      if (!mounted) {
        return;
      }

      setState(() {
        _isPreparing = false;
        _errorMessage = 'Could not play audio.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final progressValue = _hasDuration
        ? (_position.inMilliseconds / _duration.inMilliseconds)
            .clamp(0.0, 1.0)
        : null;
    final buttonIcon = _playerState == PlayerState.playing
        ? Icons.pause_rounded
        : Icons.play_arrow_rounded;
    final buttonLabel = _playerState == PlayerState.playing
        ? 'Pause'
        : (_playerState == PlayerState.paused ? 'Resume' : 'Play');

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                final isCompact = constraints.maxWidth < 420;

                final statusRow = Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: _isPreparing
                          ? SizedBox(
                              key: const ValueKey('preparing-spinner'),
                              width: 22,
                              height: 22,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.2,
                                color: widget.accentColor,
                              ),
                            )
                          : Icon(
                              key: const ValueKey('audio-icon'),
                              Icons.graphic_eq_rounded,
                              color: widget.accentColor,
                            ),
                    ),
                    const SizedBox(width: 12),
                    Flexible(
                      child: Text(
                        _statusText(),
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                );

                if (isCompact) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      statusRow,
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton.icon(
                          onPressed: _togglePlayback,
                          icon: Icon(buttonIcon),
                          label: Text(buttonLabel),
                        ),
                      ),
                    ],
                  );
                }

                return Row(
                  children: [
                    Expanded(child: statusRow),
                    const SizedBox(width: 8),
                    TextButton.icon(
                      onPressed: _togglePlayback,
                      icon: Icon(buttonIcon),
                      label: Text(buttonLabel),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 14),
            ClipRRect(
              borderRadius: BorderRadius.circular(999),
              child: LinearProgressIndicator(
                minHeight: 8,
                value: progressValue,
                backgroundColor: Colors.white.withOpacity(0.08),
                valueColor: AlwaysStoppedAnimation<Color>(widget.accentColor),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  _formatDuration(_position),
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: Colors.white70,
                  ),
                ),
                const Spacer(),
                Text(
                  _hasDuration ? _formatDuration(_duration) : '--:--',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
