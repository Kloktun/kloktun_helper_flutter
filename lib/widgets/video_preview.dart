import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kloktun_helper/widgets/screens/video_view/index.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPreview extends StatefulWidget {

  String url;

  VideoPreview({
    Key? key,
    required this.url
  }) : super(key: key);

  @override
  _VideoPreviewState createState() => _VideoPreviewState();
}

class _VideoPreviewState extends State<VideoPreview> {

  //https://img.youtube.com/vi/65zn96QkYLk/maxresdefault.jpg

  String? get _videoCode {

    return YoutubePlayer.convertUrlToId(widget.url);

  }

  String get _previewImageUrl {

    return "https://img.youtube.com/vi/$_videoCode/maxresdefault.jpg";

  }

  _openVideo(){

    Navigator.of(context).push(MaterialPageRoute(builder: (_) => VideoViewPage(props: VideoViewProps(
      videoUrl: widget.url
    ))));

  }

  Widget _buildImage(){

    return Image.network(
      _previewImageUrl,
      fit: BoxFit.cover,
      errorBuilder: (context, data, stack){

        return Container(
          color: Color(0xFFEDEDED)
        );

      },
    );

  }

  Widget _buildIcon(){

    return Container(
      width: 60.sp,
      height: 60.sp,

      decoration: BoxDecoration(

        color: Colors.black.withAlpha(150),
        borderRadius: BorderRadius.circular(70.sp),
        border: Border.all(
          color: Colors.white,
          width: 2.sp
        )

      ),
      child: Icon(
        Icons.play_arrow,
        // color: Theme.of(context).primaryColor,
        color: Colors.white,
        size: 35.sp
      )
    );

  }


  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: (){

        _openVideo();

      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.sp)
        ),
        child: AspectRatio(
          aspectRatio: 2,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                child: _buildImage()
              ),
              Align(
                alignment: Alignment.center,
                child: _buildIcon()
              )
            ],
          )
        )
      )
    );
  }
}