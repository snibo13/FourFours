import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

class Audio {
  AudioCache audioCache = AudioCache(prefix: 'audio/');

  /// Plays a single run of the given [file]
  Future<AudioPlayer> play(String file, {volume = 1.0}) {
    return audioCache.play(file, volume: volume, mode: PlayerMode.LOW_LATENCY);
  }


  /// Prefetch an audio in the cache
  Future<File> load(String file) {
    return audioCache.load(file);
  }

  /// Clears all the audios in the cache
  void clearAll() {
    audioCache.clearCache();
  }
}