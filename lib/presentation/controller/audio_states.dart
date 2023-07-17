import 'package:audioplayers/audioplayers.dart';

class AudioStates {
  const AudioStates(
      {required this.audioPlayer,
      this.isPlaying = false,
      this.duration = Duration.zero,
      this.position = Duration.zero,
      });

  final AudioPlayer audioPlayer;
  final bool isPlaying;
  final Duration duration;
  final Duration position;


  AudioStates copyWith({
    AudioPlayer? audioPlayer,
    bool? isPlaying,
    Duration? duration,
    Duration? position,

  }) {
    return AudioStates(
      audioPlayer: audioPlayer ?? this.audioPlayer,
      isPlaying: isPlaying ?? this.isPlaying,
      duration: duration ?? this.duration,
      position: position ?? this.position,
    );
  }
}
