import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoViewProps {

  String? label;
  String? videoUrl;

  VideoViewProps({
    this.label,
    this.videoUrl
  });
    
}

class VideoViewPage extends StatefulWidget {

  static String tag = "video-view";

  VideoViewProps props;

  VideoViewPage({
    Key? key,
    required this.props
  }) : super(key: key);

  @override
  _VideoViewPageState createState() => _VideoViewPageState();
}

class _VideoViewPageState extends State<VideoViewPage> {

  YoutubePlayerController? _controller;

  @override
  void initState() { 
    super.initState();
    
    _setupController();

  }

  _setupController(){

    if(widget.props.videoUrl == null){
      return;
    }

    String? videoId = YoutubePlayer.convertUrlToId(widget.props.videoUrl!);

    if(videoId == null){
      return;
    }

    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
          autoPlay: true,
          // mute: true,
      ),
    );


  }

  Widget _buildBody(){

    var videoUrl = widget.props.videoUrl;

    if(videoUrl == null || _controller == null){
      return Container();
    }

    return Container(
      clipBehavior: Clip.hardEdge,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.black
      ),
      child: YoutubePlayer(
        controller: _controller!,
        showVideoProgressIndicator: true,
        
      ),
    );

  }

  @override
  void dispose() { 
    
    _controller?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.black,

      extendBodyBehindAppBar: true,

      appBar: AppBar(

        brightness: Brightness.dark,
        backgroundColor: Colors.black.withAlpha(100),
        title: widget.props.label != null ?  Text(widget.props.label!, style: TextStyle(color: Colors.white)) : null,
        foregroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.white
        )

      ),

      body: _buildBody(),


    );
  }
}