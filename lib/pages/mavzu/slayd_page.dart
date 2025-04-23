import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // SystemChrome uchun import
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'package:open_file/open_file.dart';

class PrezintatsiyaPage extends StatefulWidget {
  final String pptxUrl;
  const PrezintatsiyaPage({super.key, required this.pptxUrl});

  @override
  State<PrezintatsiyaPage> createState() => _PrezintatsiyaPageState();
}

class _PrezintatsiyaPageState extends State<PrezintatsiyaPage> {
  bool _isDownloading = false;
  double _downloadProgress = 0;
  String? _filePath;
  final Dio _dio = Dio();
  bool _fileExists = false;

  @override
  void initState() {
    super.initState();
    _checkFileExists();

    // Ekranning yo'nalishini vertikalga fikslash
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void dispose() {
    // Widget o'chirilganda barcha yo'nalishlarni qayta ruxsat berish
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  Future<void> _checkFileExists() async {
    final directory = await getApplicationDocumentsDirectory();
    final fileName = widget.pptxUrl.split('/').last;
    _filePath = '${directory.path}/$fileName';

    File file = File(_filePath!);
    _fileExists = await file.exists();
    setState(() {});
  }

  Future<void> _downloadFile() async {
    setState(() {
      _isDownloading = true;
      _downloadProgress = 0;
    });

    try {
      final directory = await getApplicationDocumentsDirectory();
      final fileName = widget.pptxUrl.split('/').last;
      _filePath = '${directory.path}/$fileName';

      // Faylni yuklash
      await _dio.download(
        widget.pptxUrl,
        _filePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            setState(() {
              _downloadProgress = received / total;
            });
          }
        },
      );

      setState(() {
        _isDownloading = false;
        _fileExists = true;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Fayl yuklandi: $_filePath')),
      );
    } catch (e) {
      setState(() {
        _isDownloading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Xatolik yuz berdi: $e')),
      );
    }
  }

  Future<void> _openFile() async {
    if (_filePath != null) {
      // Faylni ochishdan oldin ekran yo'nalishi uchun ruxsatlarni qaytarish
      // Bu tashqi ilovalar to'g'ri yo'nalishda ishlashi uchun kerak
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);

      final result = await OpenFile.open(_filePath!);

      // Fayl yopilgandan so'ng yana faqat portrait yo'nalishiga qaytarish
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);

      if (result.type != ResultType.done) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Faylni ochishda xatolik: ${result.message}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slayd Yuklash'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_isDownloading)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    LinearProgressIndicator(value: _downloadProgress),
                    const SizedBox(height: 8),
                    Text('${(_downloadProgress * 100).toStringAsFixed(1)}%'),
                  ],
                ),
              ),
            ElevatedButton(
              onPressed: _isDownloading
                  ? null
                  : (_fileExists ? _openFile : _downloadFile),
              child: Text(_fileExists ? 'Faylni ochish' : 'Yuklash'),
            ),
            if (_fileExists)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: ElevatedButton(
                  onPressed: _isDownloading ? null : _downloadFile,
                  child: const Text('Qayta yuklash'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
