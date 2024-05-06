import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white10,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitPulse(
              color: Colors.white,
              size: 100,
            ),
            SizedBox(height: 10),
            Text(
              'fetching data ...',
              style: TextStyle(fontSize: 20, color: Colors.white60),
            ),
          ],
        ),
      ),
    );
  }
}
