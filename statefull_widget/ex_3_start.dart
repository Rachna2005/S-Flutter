import 'package:flutter/material.dart';

List<String> images = [
  "assets/w4-s2/bird.jpg",
  "assets/w4-s2/bird2.jpg",
  "assets/w4-s2/insect.jpg",
  "assets/w4-s2/girl.jpg",
  "assets/w4-s2/man.jpg",
];

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false, // Why this line ? Can you explain it ?
    home: ImageState(),
    // home: Scaffold(
    //   backgroundColor: Colors.green[50],
    //   appBar: AppBar(
    //     backgroundColor: Colors.green[400],
    //     title: const Text('Image viewer'),
    //     actions: <Widget>[
    //       IconButton(
    //         icon: const Icon(Icons.navigate_before),
    //         tooltip: 'Go to the previous image',
    //         onPressed: () => {},
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
    //         child: IconButton(
    //           icon: const Icon(Icons.navigate_next),
    //           tooltip: 'Go to the next image',
    //           onPressed: () => {},
    //         ),
    //       ),
    //     ],
    //   ),
    //   body: Image.asset(images[0]),
    // ),
  ),
);

class ImageState extends StatefulWidget {
  const ImageState({super.key});

  @override
  State<ImageState> createState() => _ImageStateState();
}

class _ImageStateState extends State<ImageState> {
  int imageIndex = 0;

  void manageNext() {
    setState(() {
      imageIndex = (imageIndex + 1) % images.length;
    });
  }

  void managePrevious() {
    setState(() {
      imageIndex = (imageIndex - 1 + images.length) % images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: managePrevious,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed: manageNext,
            ),
          ),
        ],
      ),
      body: Image.asset(images[imageIndex]),
    );
  }
}
