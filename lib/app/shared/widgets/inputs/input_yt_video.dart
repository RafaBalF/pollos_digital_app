import 'package:flutter/material.dart';
import 'package:pollos_digital/app/modules/projeto/projeto_store.dart';
import 'package:pollos_digital/app/shared/widgets/inputs/input_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class InputYTVideoWidget extends StatefulWidget {
  final ProjetoStore store;
  const InputYTVideoWidget({super.key, required this.store});

  @override
  State<InputYTVideoWidget> createState() => _InputYTVideoWidgetState();
}

class _InputYTVideoWidgetState extends State<InputYTVideoWidget> {
  YoutubePlayerController? controller;

  bool firstTime = true;
  bool visibilityVideo = false;

  _changeVideo(value) {
    try {
      if (firstTime) {
        controller = YoutubePlayerController(
          initialVideoId: YoutubePlayer.convertUrlToId(value)!,
        );
        firstTime = false;
        visibilityVideo = true;
      } else {
        controller?.load(YoutubePlayer.convertUrlToId(value)!);
      }
      setState(() {});
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90.w,
      child: Column(
        children: [
          InputWidget(
            label: 'Link do Video no YouTube',
            onChanged: _changeVideo,
          ),
          visibilityVideo
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: YoutubePlayerBuilder(
                      player: YoutubePlayer(
                        controller: controller!,
                        bottomActions: const [
                          SizedBox(width: 14.0),
                          CurrentPosition(),
                          SizedBox(width: 8.0),
                          ProgressBar(
                            isExpanded: true,
                          ),
                          RemainingDuration(),
                        ],
                      ),
                      builder: (context, player) => Container(
                            child: player,
                          )),
                )
              : Container(),
        ],
      ),
    );
  }
}
