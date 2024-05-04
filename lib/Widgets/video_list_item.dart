// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:netflix/Core/colors/colors.dart';
// import 'package:netflix/Core/constants.dart';
// import 'package:video_player/video_player.dart';

// ValueNotifier<bool> mutechangeNotifier = ValueNotifier(false);

// class VideoListItem extends StatefulWidget {
//   final String imageUrl;
//   final String videourl;
//   const VideoListItem(
//       {super.key, required this.imageUrl, required this.videourl});

//   @override
//   State<VideoListItem> createState() => _VideoListItemState();
// }

// class _VideoListItemState extends State<VideoListItem> {
//   late VideoPlayerController _controller;
//   bool isPlay = true;
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videourl))
//       ..initialize().then((_) {
//         setState(() {
//           _controller.play();
//         });
//       });
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       splashFactory: NoSplash.splashFactory,
//       splashColor: Colors.transparent,
//       onTap: () {
//         setState(() {
//           _controller.value.isPlaying
//               ? _controller.pause()
//               : _controller.play();
//         });
//       },
//       child: Stack(
//         children: [
//           _controller.value.isInitialized
//               ? AspectRatio(
//                   aspectRatio: _controller.value.aspectRatio,
//                   child: VideoPlayer(_controller),
//                 )
//               : Center(
//                   child: CircularProgressIndicator(),
//                 ),
//           // Container(
//           //   color: Colors.accents[widget.index % Colors.accents.length],
//           // ),
//           Positioned(
//             bottom: 10,
//             left: 10,
//             right: 15,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 CircleAvatar(
//                   backgroundColor: Colors.black.withOpacity(0.35),
//                   radius: 30,
//                   child: ValueListenableBuilder(
//                       valueListenable: mutechangeNotifier,
//                       builder: (context, value, _) {
//                         return IconButton(
//                             splashColor: Colors.transparent,
//                             color: Colors.white,
//                             onPressed: () {
//                               updateMute(value);
//                             },
//                             icon: Icon(value
//                                 ? CupertinoIcons.volume_down
//                                 : CupertinoIcons.volume_off));
//                       }),
//                 ),
//                 Column(
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.symmetric(vertical: 10),
//                       child: CircleAvatar(
//                         radius: 34,
//                         backgroundImage:
//                             NetworkImage("$imagePath${widget.imageUrl}"),
//                       ),
//                     ),
//                     VideoActionswidget(
//                         icon: Icons.emoji_emotions, title: "LOL"),
//                     VideoActionswidget(icon: Icons.add, title: 'My List'),
//                     VideoActionswidget(icon: Icons.share, title: 'Share'),
//                     InkWell(
//                       splashFactory: NoSplash.splashFactory,
//                       onTap: () {
//                         setState(() {
//                           _controller.value.isPlaying
//                               ? _controller.pause()
//                               : _controller.play();
//                         });
//                       },
//                       child: VideoActionswidget(
//                         icon: _controller.value.isPlaying
//                             ? Icons.pause
//                             : Icons.play_arrow,
//                         title: 'Play',
//                       ),
//                     )
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class VideoActionswidget extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   const VideoActionswidget(
//       {super.key, required this.icon, required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(
//         vertical: 10,
//         horizontal: 10,
//       ),
//       child: Column(
//         children: [
//           Icon(
//             icon,
//             color: kWhiteColor,
//             size: 30,
//           ),
//           Text(
//             title,
//             style: const TextStyle(
//               color: kWhiteColor,
//               fontSize: 16,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// void updateMute(bool value) {
//   if (value) {
//     mutechangeNotifier.value = false;
//   } else {
//     mutechangeNotifier.value = true;
//   }
// }
///////
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/Core/colors/colors.dart';
import 'package:netflix/Core/constants.dart';
import 'package:video_player/video_player.dart';

ValueNotifier<bool> mutechangeNotifier = ValueNotifier(false);

class VideoListItem extends StatefulWidget {
  final String imageUrl;
  final String videourl;
  const VideoListItem(
      {super.key, required this.imageUrl, required this.videourl});

  @override
  State<VideoListItem> createState() => _VideoListItemState();
}

class _VideoListItemState extends State<VideoListItem> {
  late VideoPlayerController _controller;
  bool isPlay = true;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videourl))
      ..initialize().then((_) {
        setState(() {
          _controller.play();
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      splashColor: Colors.transparent,
      onTap: () {
        setState(() {
          _controller.value.isPlaying
              ? _controller.pause()
              : _controller.play();
        });
      },
      child: Stack(
        children: [
          _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
          // Container(
          //   color: Colors.accents[widget.index % Colors.accents.length],
          // ),
          Positioned(
            bottom: 10,
            left: 10,
            right: 15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.35),
                  radius: 30,
                  child: ValueListenableBuilder(
                      valueListenable: mutechangeNotifier,
                      builder: (context, value, _) {
                        return IconButton(
                            splashColor: Colors.transparent,
                            color: Colors.white,
                            onPressed: () {
                              updateMute(value);
                            },
                            icon: Icon(value
                                ? CupertinoIcons.volume_down
                                : CupertinoIcons.volume_off));
                      }),
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        radius: 34,
                        backgroundImage:
                            NetworkImage("$imagePath${widget.imageUrl}"),
                      ),
                    ),
                    const VideoActionswidget(
                        icon: Icons.emoji_emotions, title: "LOL"),
                    const VideoActionswidget(icon: Icons.add, title: 'My List'),
                    const VideoActionswidget(icon: Icons.share, title: 'Share'),
                    InkWell(
                      splashFactory: NoSplash.splashFactory,
                      onTap: () {
                        setState(() {
                          _controller.value.isPlaying
                              ? _controller.pause()
                              : _controller.play();
                        });
                      },
                      child: VideoActionswidget(
                        icon: _controller.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                        title: 'Play',
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class VideoActionswidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActionswidget(
      {super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: kWhiteColor,
            size: 30,
          ),
          Text(
            title,
            style: const TextStyle(
              color: kWhiteColor,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

void updateMute(bool value) {
  if (value) {
    mutechangeNotifier.value = false;
  } else {
    mutechangeNotifier.value = true;
  }
}
