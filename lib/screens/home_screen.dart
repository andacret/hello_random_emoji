// This file is part of Hello Random Emoji
// https://github.com/eduhoratiu/hello_random_emoji
//
// Copyright 2025 eduhoratiu. All rights reserved.
// Licensed under the MIT license. See LICENSE file in the project root for details.

import 'dart:math';

import 'package:flutter/material.dart';

import '../data/emojis.dart';
import '../models/emoji.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// The random number generator used to select a random emoji.
  final Random _random = Random();

  /// The emoji that is currently displayed.
  late Emoji _currentEmoji;

  @override
  void initState() {
    super.initState();

    // Randomize the emoji when the screen is first displayed.
    _randomizeEmoji();
  }

  /// Randomizes the emoji that is currently displayed.
  void _randomizeEmoji() {
    final int index = _random.nextInt(emojiList.length);
    setState(() {
      _currentEmoji = emojiList[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _currentEmoji.emoji,
                style: TextStyle(fontSize: 128),
              ),
              Text(
                _currentEmoji.name,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: _randomizeEmoji,
        tooltip: 'Randomize Emoji',
        child: const Icon(Icons.shuffle),
      ),
    );
  }
}
