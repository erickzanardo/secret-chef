import 'package:flutter/material.dart';
import 'dart:io';

import '../widgets/pattern_container.dart';
import '../widgets/button.dart';

import '../audio_manager.dart';

class TitleScreen extends StatelessWidget {
  @override
  Widget build(ctx) {

    AudioManager.titleMusic();

    return PatternContainer(
      child: Center(
          child: Column(
              children: [
                Expanded(
                    flex: 4,
                    child: Image.asset('assets/images/title.png'),
                ),
                Button.primaryButton(
                    label: 'Play',
                    onPressed: () {
                      Navigator.of(ctx).pushNamed('/stage_select');
                    }),
                SizedBox(height: 5),
                Button.secondaryButton(
                    label: 'Credits',
                    onPressed: () {
                      Navigator.of(ctx).pushNamed('/credits');
                    }),
                SizedBox(height: 5),
                Button.secondaryButton(
                    label: 'Exit',
                    onPressed: () {
                      exit(0);
                    }),
                SizedBox(height: 10),
              ],
          ),
      ),
    );
  }
}
