import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? file;
  File? fileVideo;
  VideoPlayerController? videoPlayer;

  @override
  void initState() {
    checkCameraStorage();
    super.initState();
  }

  void pickMedia(bool isCamera, bool isVideo) async {
    try {
      ImagePicker imagePicker = ImagePicker();
      final XFile? imageXFile = isVideo
          ? await imagePicker.pickVideo(
              source: isCamera ? ImageSource.camera : ImageSource.gallery,
            )
          : await imagePicker.pickImage(
              source: isCamera ? ImageSource.camera : ImageSource.gallery,
            );

      setState(() {
        if (imageXFile != null) {
          if (isVideo) {
            fileVideo = File(imageXFile.path);
            videoPlayer = VideoPlayerController.file(fileVideo!);
            if (videoPlayer != null) {
              videoPlayer!.initialize();
              videoPlayer!.play();
            }
          } else {
            file = File(imageXFile.path);
            return;
          }
        } else {
          debugPrint("No media selected");
        }
      });
    } catch (e) {
      debugPrint("Error picking image: $e");
    }
  }

  void checkCameraStorage() async {
    final checkCamera = await Permission.camera.request();
    final checkStorage = await Permission.storage.request();

    if (checkCamera.isGranted) {
      debugPrint("Camera permission granted");
    } else {
      final requestCamera = await Permission.camera.request();
      if (requestCamera.isGranted) {
        debugPrint("Camera permission granted");
      } else {
        debugPrint("Camera permission denied");
      }
      debugPrint("Camera permission denied");
    }

    if (checkStorage.isGranted) {
      debugPrint("Storage permission granted");
    } else {
      final requestStorage = await Permission.storage.request();
      if (requestStorage.isGranted) {
        debugPrint("Storage permission granted");
      } else {
        debugPrint("Storage permission denied");
      }
      debugPrint("Storage permission denied");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Media App")),
      body: Column(
        children: [
          if (file != null)
            InkWell(
              onTap: () {
                pickMedia(false, false);
              },
              child: Image.file(file!),
            )
          else
            CardMedia(
              iconData: Icons.image_outlined,
              isVideo: false,
              onPressed: () {
                pickMedia(false, false);
              },
              onPressedCamera: () {
                pickMedia(true, false);
              },
            ),
          if (videoPlayer != null)
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Column(
                    children: [
                      Expanded(child: VideoPlayer(videoPlayer!)),
                      FilledButton(
                        onPressed: () {
                          videoPlayer!.play();
                        },
                        child: Icon(Icons.play_circle),
                      ),
                      FilledButton(
                        onPressed: () {
                          videoPlayer!.pause();
                        },
                        child: Icon(Icons.pause),
                      ),
                    ],
                  ),
                ),
              ],
            )
          else
            CardMedia(
              iconData: Icons.video_file_outlined,
              isVideo: true,
              onPressed: () {
                pickMedia(false, true);
              },
              onPressedCamera: () {
                pickMedia(true, true);
              },
            ),
        ],
      ),
    );
  }
}

class CardMedia extends StatelessWidget {
  const CardMedia({
    super.key,
    required this.iconData,
    required this.isVideo,
    this.onPressed,
    this.onPressedCamera,
  });

  final IconData iconData;
  final bool isVideo;
  final Function()? onPressed;
  final Function()? onPressedCamera;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black45),
        borderRadius: BorderRadius.circular(20),
      ),

      child: Column(
        children: [
          Icon(iconData, size: 50),
          SizedBox(height: 10),
          Text('Your ${isVideo ? "Video" : "Image"}'),
          SizedBox(height: 10),
          FilledButton(onPressed: onPressed, child: Text("Galery")),
          FilledButton(onPressed: onPressedCamera, child: Text("Camera")),
        ],
      ),
    );
  }
}
