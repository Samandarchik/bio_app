import 'package:bio_app/data/color.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPage extends StatefulWidget {
  final double maxMin; // required max minute in seconds (e.g. 120.0 = 2min)
  const AudioPage({super.key, required this.maxMin});

  @override
  State<AudioPage> createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  final String audioUrl =
      'https://zoomedia.uz/media/theme/audio/relaxing-piano-310597.mp3';
  final AudioPlayer _audioPlayer = AudioPlayer();

  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  bool isPlaying = false;
  bool isLooping = false;

  @override
  void initState() {
    super.initState();

    _audioPlayer.onDurationChanged.listen((Duration d) {
      if (mounted) setState(() => _duration = d);
    });

    _audioPlayer.onPositionChanged.listen((Duration p) {
      if (mounted) setState(() => _position = p);
    });

    _audioPlayer.onPlayerComplete.listen((event) {
      if (mounted) {
        setState(() {
          _position = Duration.zero;
          isPlaying = false;
        });

        if (isLooping) {
          _audioPlayer.seek(Duration.zero);
          _audioPlayer.resume();
          setState(() => isPlaying = true);
        }
      }
    });

    _audioPlayer.setSourceUrl(audioUrl).then((_) {
      if (mounted) {
        _audioPlayer.resume();
        setState(() => isPlaying = true);
      }
    });
    _audioPlayer.setReleaseMode(ReleaseMode.stop);
  }

  @override
  void dispose() {
    _audioPlayer.stop();
    _audioPlayer.dispose();
    super.dispose();
  }

  String _formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  void _togglePlayPause() {
    if (isPlaying) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.resume();
    }
    setState(() => isPlaying = !isPlaying);
  }

  @override
  Widget build(BuildContext context) {
    // Audio maksimal davomiyligi sifatida widget.maxMin va _duration.inSeconds qiymatidan eng kichigini olamiz
    double maxSeconds = widget.maxMin;

    // Audio haqiqiy davomiyligi agar maksimumdan kichik bo'lsa, shuni ishlatamiz
    if (_duration.inSeconds > 0 && _duration.inSeconds < maxSeconds) {
      maxSeconds = _duration.inSeconds.toDouble();
    }

    double currentSliderValue = _position.inSeconds.toDouble();

    // Slider qiymati maksimumdan oshmasligi kerak
    if (currentSliderValue > maxSeconds) {
      currentSliderValue = maxSeconds;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('🎵 Relaxing Piano'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.music_note, size: 100, color: kMainColor),
            const SizedBox(height: 30),

            // Slider
            Slider(
              value: currentSliderValue,
              min: 0.0,
              max: maxSeconds,
              activeColor: kMainColor,
              inactiveColor: kMainColor.withAlpha(100),
              onChanged: (value) {
                final position = Duration(seconds: value.toInt());
                _audioPlayer.seek(position);
                setState(() => _position = position);
              },
            ),

            // Time Labels + Control Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_formatTime(_position)),
                Text(_formatTime(Duration(seconds: maxSeconds.toInt()))),
              ],
            ),

            const SizedBox(height: 20),

            // Control Buttons Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 10s Backward
                IconButton(
                  icon:
                      const Icon(Icons.replay_10, size: 36, color: kMainColor),
                  onPressed: () {
                    final newPosition = _position - const Duration(seconds: 10);
                    _audioPlayer.seek(newPosition > Duration.zero
                        ? newPosition
                        : Duration.zero);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.restart_alt,
                      size: 36, color: kMainColor),
                  onPressed: () {
                    _audioPlayer.seek(Duration.zero);
                    if (!isPlaying) _audioPlayer.resume();
                    setState(() => isPlaying = true);
                  },
                ),

                // Play / Pause
                IconButton(
                  iconSize: 70,
                  icon: Icon(
                    isPlaying
                        ? Icons.pause_circle_filled
                        : Icons.play_circle_fill,
                    color: kMainColor,
                  ),
                  onPressed: _togglePlayPause,
                ),

                // Loop toggle
                IconButton(
                  icon: Icon(
                    isLooping ? Icons.repeat_one : Icons.repeat,
                    size: 36,
                    color: kMainColor,
                  ),
                  onPressed: () {
                    setState(() => isLooping = !isLooping);
                    _audioPlayer.setReleaseMode(
                        isLooping ? ReleaseMode.loop : ReleaseMode.stop);
                  },
                ),

                // 10s Forward
                IconButton(
                  icon:
                      const Icon(Icons.forward_10, size: 36, color: kMainColor),
                  onPressed: () {
                    final newPosition = _position + const Duration(seconds: 10);
                    final maxPosition = Duration(seconds: maxSeconds.toInt());
                    _audioPlayer.seek(
                        newPosition < maxPosition ? newPosition : maxPosition);
                  },
                ),
              ],
            ),

            const SizedBox(height: 40),

            const Text(
              'Now Playing:\nRelaxing Piano Music',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
