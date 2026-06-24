import 'dart:async';

import 'package:audioplayers/audioplayers.dart';

class AudioService {
  AudioService() : _player = AudioPlayer();

  final AudioPlayer _player;

  Future<void> play(String assetPath) async {
    await _player.stop();
    final normalizedPath = assetPath.startsWith('assets/')
        ? assetPath.replaceFirst('assets/', '')
        : assetPath;
    await _player.play(AssetSource(normalizedPath));
  }

  void dispose() {
    unawaited(_player.dispose());
  }
}
