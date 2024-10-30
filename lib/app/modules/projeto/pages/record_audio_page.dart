import 'dart:io';

import 'package:just_audio/just_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pollos_digital/app/modules/projeto/projeto_store.dart';
import 'package:pollos_digital/app/shared/colors.dart';
import 'package:pollos_digital/app/shared/text_widget.dart';
import 'package:pollos_digital/app/shared/widgets/button_widget.dart';
import 'package:pollos_digital/app/shared/widgets/divider_widget.dart';
import 'package:pollos_digital/app/shared/widgets/simple_scaffold_widget.dart';
import 'package:record/record.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:path/path.dart' as p;

class RecordPage extends StatefulWidget {
  const RecordPage({super.key});

  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  final ProjetoStore _store = Modular.get<ProjetoStore>();
  late final Future<void> _future;

  final AudioRecorder audioRecorder = AudioRecorder();
  final AudioPlayer audioPlayer = AudioPlayer();
  String? recordingPath;
  bool isRecording = false;
  bool isPlaying = false;

  bool loadingControl = false;

  @override
  void initState() {
    _future = Future.wait([]);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return SimpleScaffoldWidget(
            bodyPadding: EdgeInsets.all(2.w),
            body: Observer(
              builder: (_) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return Observer(builder: (_) {
                    return _body();
                  });
                } else {
                  return _loadingBody();
                }
              },
            ));
      },
    );
  }

  Widget _loadingBody() {
    return const CircularProgressIndicator();
  }

  Widget _body() {
    return SizedBox(
      height: MediaQuery.of(context).size.height -
          (kToolbarHeight + kBottomNavigationBarHeight + 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 10.h,
            backgroundColor: Colors.black,
            backgroundImage: const AssetImage(
                'assets/images/projeto/pollos-digital-agencia-cria-seu-site.png'),
          ),
          DividerWidget(height: 2.h),
          textWidget('Sou Polito', fontWeight: FontWeight.bold, fontSize: 3.h),
          textWidget(
            'Mande um áudio que iremos criar sua vitrine online. Exemplo: Meu nome é Leonardo Polo sou programador de sistemas PHP e Java fiz faculdade na... etc.',
            fontSize: 2.5.h,
            autoSize: false,
            maxLines: 10,
            textAlign: TextAlign.center,
            color: Colors.grey[700],
          ),
          if (isRecording) Image.asset('assets/images/projeto/soundbar.jpg'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (recordingPath != null)
                CircleAvatar(
                  backgroundColor: focus,
                  radius: 5.h,
                  child: IconButton(
                    onPressed: () async {
                      if (audioPlayer.playing) {
                        audioPlayer.stop();
                        setState(() {
                          isPlaying = false;
                        });
                      } else {
                        await audioPlayer.setFilePath(recordingPath!);
                        audioPlayer.play();
                        setState(() {
                          isPlaying = true;
                        });
                      }
                    },
                    icon: isPlaying
                        ? const Icon(Icons.stop)
                        : const Icon(Icons.play_arrow),
                    color: Colors.white,
                    iconSize: 5.h,
                  ),
                ),
              CircleAvatar(
                backgroundColor: focus,
                radius: 5.h,
                child: IconButton(
                  onPressed: () async {
                    if (isRecording) {
                      String? filePath = await audioRecorder.stop();
                      _store.setButtonEnabilitiy();
                      if (filePath != null) {
                        var file = File(filePath);
                        await _store.setAudio(file);
                        setState(() {
                          isRecording = false;
                          recordingPath = filePath;
                        });
                      }
                    } else {
                      if (await audioRecorder.hasPermission()) {
                        final Directory appDocumentsDir =
                            await getApplicationDocumentsDirectory();
                        String filePath;
                        if (Platform.isIOS) {
                          filePath =
                              p.join(appDocumentsDir.path, "recording.m4a");
                        } else {
                          filePath =
                              p.join(appDocumentsDir.path, "recording.wav");
                        }
                        await audioRecorder.start(const RecordConfig(),
                            path: filePath);
                        setState(() {
                          isRecording = true;
                          recordingPath = null;
                        });
                      }
                    }
                  },
                  icon: isRecording
                      ? const Icon(Icons.stop)
                      : const Icon(Icons.mic),
                  color: Colors.white,
                  iconSize: 5.h,
                ),
              ),
            ],
          ),
          DividerWidget(height: 5.h),
          ButtonWidget.filled(
            onPressed: () async {
              await _store.handleAudio(_store.audio);
              Modular.to.pushNamed('/projeto/dados-resultados');
            },
            loading: _store.loadingStore.isLoading,
            disabled: _store.buttonEnabilitiy,
            title: 'AVANÇAR',
            textColor: white,
            backgroundColor: focus,
          )
        ],
      ),
    );
  }
}
