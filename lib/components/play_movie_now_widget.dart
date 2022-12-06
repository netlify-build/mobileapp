import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlayMovieNowWidget extends StatefulWidget {
  const PlayMovieNowWidget({
    Key? key,
    this.imagePath,
    this.title,
    this.duration,
    this.rating,
  }) : super(key: key);

  final String? imagePath;
  final String? title;
  final String? duration;
  final String? rating;

  @override
  _PlayMovieNowWidgetState createState() => _PlayMovieNowWidgetState();
}

class _PlayMovieNowWidgetState extends State<PlayMovieNowWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return FlutterFlowVideoPlayer(
      path:
          'https://firebasestorage.googleapis.com/v0/b/last2digit2022.appspot.com/o/Movies%2FAction%2FBlood.Diamond.2006.1080p.BrRip.x264.YIFY.mp4?alt=media&token=a7b7f146-cc50-4e04-9337-80650b93ef3c',
      videoType: VideoType.network,
      autoPlay: false,
      looping: true,
      showControls: true,
      allowFullScreen: true,
      allowPlaybackSpeedMenu: false,
    );
  }
}
