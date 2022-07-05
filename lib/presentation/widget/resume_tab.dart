import 'package:flutter/material.dart';

/// my resume tab
class ResumeTab extends StatelessWidget {
  const ResumeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Center(child: Column(children: [
        _buildImage(),

      ]),);


  Widget _buildImage() => Container(
          alignment: Alignment.bottomRight,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              'assets/me.jpg',
              fit: BoxFit.cover,
              width: 48,
              height: 48,
            ),
          ),
  );
}
