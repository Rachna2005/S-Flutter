import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        backgroundColor: Colors.grey[300],

        body: Column(
          children: [

            // Row(
            //   children: [
            //     Container(width: 50, height: 50, color: Colors.blue),

            //     Container(width: 100, height: 50, color: Colors.yellow),
            //     Expanded(child: Container(height: 50, color: Colors.blue)),

            //     Container(width: 100, height: 50, color: Colors.yellow),
            //     Container(width: 50, height: 50, color: Colors.blue),
            //   ],
            // ),
            // Expanded(
            //   child: Row(
            //     spacing: 10,
            //     children: [
            //       Expanded(
            //         flex: 1, // 25%
            //         child: Container(
            //           color: Colors.green,
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //             children: [
            //               Container(width: 60, height: 60, color: Colors.white),
            //               Container(width: 60, height: 60, color: Colors.white),
            //               Container(width: 60, height: 60, color: Colors.white),
            //             ],
            //           ),
            //         ),
            //       ),
            //       Expanded(
            //         flex: 3, // 75%
            //         child: Container(color: Colors.orange),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    ),
  );
}
