import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'package:open_file/open_file.dart';

class PrezintatsiyaPage extends StatefulWidget {
  const PrezintatsiyaPage({Key? key}) : super(key: key);

  @override
  State<PrezintatsiyaPage> createState() => _PrezintatsiyaPageState();
}

class _PrezintatsiyaPageState extends State<PrezintatsiyaPage> {
  final String pptxUrl =
      "http://zoomedia.uz/media/theme/prezintatsiya/zoo_testing_1_mavzu.pptx";
  bool _isDownloading = false;
  double _downloadProgress = 0;
  String? _filePath;
  final Dio _dio = Dio();

  Future<void> _downloadFile() async {
    setState(() {
      _isDownloading = true;
      _downloadProgress = 0;
    });

    try {
      // Ilovaning ichki xotirasiga saqlash
      final directory = await getApplicationDocumentsDirectory();
      final fileName = pptxUrl.split('/').last;
      _filePath = '${directory.path}/$fileName';

      // Eski faylni o'chirish (agar mavjud bo'lsa)
      File file = File(_filePath!);
      if (await file.exists()) {
        await file.delete();
      }

      // Faylni yuklash
      await _dio.download(
        pptxUrl,
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
      final result = await OpenFile.open(_filePath!);
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
        title: const Text('PPTX Yuklovchi'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'PowerPoint prezentatsiyasini yuklash',
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                'URL manzili:\n$pptxUrl',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 30),
              if (_isDownloading)
                Column(
                  children: [
                    LinearProgressIndicator(value: _downloadProgress),
                    const SizedBox(height: 10),
                    Text(
                        'Yuklanmoqda: ${(_downloadProgress * 100).toStringAsFixed(0)}%'),
                  ],
                )
              else
                ElevatedButton(
                  onPressed: _downloadFile,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                  ),
                  child: const Text('Yuklab olish',
                      style: TextStyle(fontSize: 18)),
                ),
              const SizedBox(height: 20),
              if (_filePath != null && !_isDownloading)
                ElevatedButton(
                  onPressed: _openFile,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                  ),
                  child: const Text('Faylni ochish',
                      style: TextStyle(fontSize: 18)),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
