import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPage extends StatefulWidget {
  final double maxMin; // required max minute in seconds (e.g. 120.0 = 2min)
  const AudioPage({Key? key, required this.maxMin}) : super(key: key);

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

  @override
  void initState() {
    super.initState();

    _audioPlayer.onDurationChanged.listen((Duration d) {
      setState(() => _duration = d);
    });

    _audioPlayer.onPositionChanged.listen((Duration p) {
      setState(() => _position = p);
    });

    _audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        _position = Duration.zero;
        isPlaying = false;
      });
    });

    _audioPlayer.setSourceUrl(audioUrl).then((_) {
      _audioPlayer.resume();
      setState(() => isPlaying = true);
    });
  }

  String _formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
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
    // Tashqaridan kelgan maxMin (masalan, 120.0) yoki duration, qaysi katta bo‘lsa
    double maxSliderValue = widget.maxMin.clamp(1.0, double.infinity);
    double currentSliderValue =
        _position.inSeconds.toDouble().clamp(0.0, maxSliderValue);

    return Scaffold(
      appBar: AppBar(
        title: const Text('🎵 Relaxing Piano'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.music_note, size: 100, color: Colors.deepPurpleAccent),

            const SizedBox(height: 30),

            // Slider
            Slider(
              value: currentSliderValue,
              min: 0.0,
              max: maxSliderValue,
              activeColor: Colors.deepPurple,
              inactiveColor: Colors.deepPurple.shade100,
              onChanged: (value) {
                final position = Duration(seconds: value.toInt());
                _audioPlayer.seek(position);
              },
            ),

            // Time labels
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 50, child: Text(_formatTime(_position))),
                IconButton(
                  icon: const Icon(Icons.replay_10,
                      size: 40, color: Colors.deepPurple),
                  onPressed: () {
                    final newPosition = _position - const Duration(seconds: 10);
                    _audioPlayer.seek(newPosition > Duration.zero
                        ? newPosition
                        : Duration.zero);
                  },
                ),
                IconButton(
                  iconSize: 40,
                  icon: Icon(
                    isPlaying
                        ? Icons.pause_circle_filled
                        : Icons.play_circle_fill,
                    color: Colors.deepPurple,
                  ),
                  onPressed: _togglePlayPause,
                ),
                SizedBox(
                    width: 50,
                    child: Text(_formatTime(
                        Duration(seconds: maxSliderValue.toInt())))),
              ],
            ),

            const SizedBox(height: 40),

            const SizedBox(height: 20),
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
