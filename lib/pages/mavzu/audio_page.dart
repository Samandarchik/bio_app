// import 'package:bio_app/data/color.dart';
// import 'package:flutter/material.dart';
// import 'package:audioplayers/audioplayers.dart';

// // http://zoomedia.uz/media/theme/audio/relaxing-piano-310597.mp3
// class AudioPage extends StatefulWidget {
//   final double maxMin; // required max minute in seconds (e.g. 120.0 = 2min)
//   final String audioUrl;
//   const AudioPage({super.key, required this.maxMin, required this.audioUrl});

//   @override
//   State<AudioPage> createState() => _AudioPageState();
// }

// class _AudioPageState extends State<AudioPage> {
//   final AudioPlayer _audioPlayer = AudioPlayer();

//   Duration _duration = Duration.zero;
//   Duration _position = Duration.zero;
//   bool isPlaying = false;
//   bool isLooping = false;

//   @override
//   void initState() {
//     super.initState();
//     _audioPlayer.onDurationChanged.listen((Duration d) {
//       if (mounted) setState(() => _duration = d);
//     });

//     _audioPlayer.onPositionChanged.listen((Duration p) {
//       if (mounted) setState(() => _position = p);
//     });

//     _audioPlayer.onPlayerComplete.listen((event) {
//       if (mounted) {
//         setState(() {
//           _position = Duration.zero;
//           isPlaying = false;
//         });

//         if (isLooping) {
//           _audioPlayer.seek(Duration.zero);
//           _audioPlayer.resume();
//           setState(() => isPlaying = true);
//         }
//       }
//     });

//     _audioPlayer.setSourceUrl(widget.audioUrl).then((_) {
//       if (mounted) {
//         _audioPlayer.resume();
//         setState(() => isPlaying = true);
//       }
//     });
//     _audioPlayer.setReleaseMode(ReleaseMode.stop);
//   }

//   @override
//   void dispose() {
//     _audioPlayer.stop();
//     _audioPlayer.dispose();
//     super.dispose();
//   }

//   String _formatTime(Duration duration) {
//     String twoDigits(int n) => n.toString().padLeft(2, '0');
//     final minutes = twoDigits(duration.inMinutes.remainder(60));
//     final seconds = twoDigits(duration.inSeconds.remainder(60));
//     return '$minutes:$seconds';
//   }

//   void _togglePlayPause() {
//     if (isPlaying) {
//       _audioPlayer.pause();
//     } else {
//       _audioPlayer.resume();
//     }
//     setState(() => isPlaying = !isPlaying);
//   }

//   @override
//   Widget build(BuildContext context) {
//     // print(widget.audioUrl);
//     // Audio maksimal davomiyligi sifatida widget.maxMin va _duration.inSeconds qiymatidan eng kichigini olamiz
//     double maxSeconds = widget.maxMin;

//     // Audio haqiqiy davomiyligi agar maksimumdan kichik bo'lsa, shuni ishlatamiz
//     if (_duration.inSeconds > 0 && _duration.inSeconds < maxSeconds) {
//       maxSeconds = _duration.inSeconds.toDouble();
//     }

//     double currentSliderValue = _position.inSeconds.toDouble();

//     // Slider qiymati maksimumdan oshmasligi kerak
//     if (currentSliderValue > maxSeconds) {
//       currentSliderValue = maxSeconds;
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('🎵 Audio'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(24),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Icon(Icons.music_note, size: 100, color: kMainColor),
//             const SizedBox(height: 30),

//             // Slider
//             Slider(
//               value: currentSliderValue,
//               min: 0.0,
//               max: maxSeconds,
//               activeColor: kMainColor,
//               inactiveColor: kMainColor.withAlpha(100),
//               onChanged: (value) {
//                 final position = Duration(seconds: value.toInt());
//                 _audioPlayer.seek(position);
//                 setState(() => _position = position);
//               },
//             ),

//             // Time Labels + Control Buttons
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(_formatTime(_position)),
//                 Text(_formatTime(Duration(seconds: maxSeconds.toInt()))),
//               ],
//             ),

//             const SizedBox(height: 20),

//             // Control Buttons Row
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 // 10s Backward
//                 IconButton(
//                   icon:
//                       const Icon(Icons.replay_10, size: 36, color: kMainColor),
//                   onPressed: () {
//                     final newPosition = _position - const Duration(seconds: 10);
//                     _audioPlayer.seek(newPosition > Duration.zero
//                         ? newPosition
//                         : Duration.zero);
//                   },
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.restart_alt,
//                       size: 36, color: kMainColor),
//                   onPressed: () {
//                     _audioPlayer.seek(Duration.zero);
//                     if (!isPlaying) _audioPlayer.resume();
//                     setState(() => isPlaying = true);
//                   },
//                 ),

//                 // Play / Pause
//                 IconButton(
//                   iconSize: 70,
//                   icon: Icon(
//                     isPlaying
//                         ? Icons.pause_circle_filled
//                         : Icons.play_circle_fill,
//                     color: kMainColor,
//                   ),
//                   onPressed: _togglePlayPause,
//                 ),

//                 // Loop toggle
//                 IconButton(
//                   icon: Icon(
//                     isLooping ? Icons.repeat_one : Icons.repeat,
//                     size: 36,
//                     color: kMainColor,
//                   ),
//                   onPressed: () {
//                     setState(() => isLooping = !isLooping);
//                     _audioPlayer.setReleaseMode(
//                         isLooping ? ReleaseMode.loop : ReleaseMode.stop);
//                   },
//                 ),

//                 // 10s Forward
//                 IconButton(
//                   icon:
//                       const Icon(Icons.forward_10, size: 36, color: kMainColor),
//                   onPressed: () {
//                     final newPosition = _position + const Duration(seconds: 10);
//                     final maxPosition = Duration(seconds: maxSeconds.toInt());
//                     _audioPlayer.seek(
//                         newPosition < maxPosition ? newPosition : maxPosition);
//                   },
//                 ),
//               ],
//             ),

//             const SizedBox(height: 40),

//             const Text(
//               'Now Playing:\nRelaxing Piano Music',
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:bio_app/data/color.dart';
import 'package:bio_app/data/text_style.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioPage extends StatefulWidget {
  final String audioUrl;
  final double maxMin;

  const AudioPage({super.key, required this.audioUrl, required this.maxMin});

  @override
  State<AudioPage> createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  double _currentPosition = 0;
  double _duration = 0;
  double _playbackSpeed = 1.0;

  @override
  void initState() {
    super.initState();
    _initAudioPlayer();
  }

  void _initAudioPlayer() async {
    _audioPlayer = AudioPlayer();
    try {
      // Load the audio file from assets
      await _audioPlayer.setAsset(widget.audioUrl);

      // Get the duration of the audio file
      final duration = await _audioPlayer.duration;
      if (duration != null) {
        setState(() {
          _duration = duration.inMilliseconds.toDouble();
        });
      }

      // Listen for position changes
      _audioPlayer.positionStream.listen((position) {
        setState(() {
          _currentPosition = position.inMilliseconds.toDouble();
        });
      });

      // Listen for player state changes
      _audioPlayer.playerStateStream.listen((state) {
        if (state.playing != _isPlaying) {
          setState(() {
            _isPlaying = state.playing;
          });
        }
      });
    } catch (e) {
      print('Error initializing audio player: $e');
    }
  }

  String _formatDuration(double milliseconds) {
    final duration = Duration(milliseconds: milliseconds.round());
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: kBoxDecoration,
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Column(
            children: [
              Text(
                'Audio',
                style: TS.tsBCW(24),
              ),

              Spacer(),
              Text(
                'Zoologiya Audio',
                style: TS.tsBCW(24),
              ),

              // Audio progress
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _formatDuration(_currentPosition),
                    style: TS.tsBCW(16),
                  ),
                  Expanded(
                    child: Slider(
                      activeColor: kwhite,
                      inactiveColor: kwhite.withAlpha(100),
                      value: _currentPosition,
                      min: 0,
                      max: _duration > 0 ? _duration : 1,
                      onChanged: (value) {
                        setState(() {
                          _currentPosition = value;
                        });
                        _audioPlayer
                            .seek(Duration(milliseconds: value.round()));
                      },
                    ),
                  ),
                  Text(
                    _formatDuration(_duration),
                    style: TS.tsBCW(16),
                  ),
                ],
              ),

              // Play/Pause and Forward/Backward controls
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    color: kwhite,
                    iconSize: 48,
                    icon: const Icon(Icons.replay_10),
                    onPressed: () {
                      final newPosition = _currentPosition - 10000;
                      _audioPlayer.seek(Duration(
                          milliseconds:
                              newPosition < 0 ? 0 : newPosition.round()));
                    },
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    iconSize: 64,
                    color: kwhite,
                    icon: Icon(_isPlaying
                        ? Icons.pause_circle_filled
                        : Icons.play_circle_filled),
                    onPressed: () {
                      if (_isPlaying) {
                        _audioPlayer.pause();
                      } else {
                        _audioPlayer.play();
                      }
                    },
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    color: kwhite,
                    iconSize: 48,
                    icon: const Icon(Icons.forward_10),
                    onPressed: () {
                      final newPosition = _currentPosition + 10000;
                      _audioPlayer.seek(Duration(
                          milliseconds: newPosition > _duration
                              ? _duration.round()
                              : newPosition.round()));
                    },
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // Playback speed controls
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Playback Speed: ', style: TS.tsBCW(14)),
                  DropdownButton<double>(
                    value: _playbackSpeed,
                    style: TS.tsBCW(14),
                    dropdownColor: kMainColor,
                    items: const [
                      DropdownMenuItem(value: 0.5, child: Text('0.5x')),
                      DropdownMenuItem(value: 1.0, child: Text('1.0x')),
                      DropdownMenuItem(value: 1.5, child: Text('1.5x')),
                      DropdownMenuItem(value: 2.0, child: Text('2.0x')),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          _playbackSpeed = value;
                        });
                        _audioPlayer.setSpeed(value);
                      }
                    },
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.3),
            ],
          ),
        ),
      ),
    );
  }
}
