import 'package:flutter/material.dart';
import 'dart:math';

import '../data/emojis.dart';
import '../models/emoji.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final Random _random = Random();
  late Emoji _currentEmoji;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _currentEmoji = emojiList[_random.nextInt(emojiList.length)];
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _randomizeEmoji() {
    _controller.forward(from: 0.0).then((_) {
      setState(() {
        _currentEmoji = emojiList[_random.nextInt(emojiList.length)];
      });
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
              ScaleTransition(
                scale: _animation,
                child: Text(
                  _currentEmoji.emoji,
                  style: const TextStyle(fontSize: 128),
                ),
              ),
              Text(
                _currentEmoji.name,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 24),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: _randomizeEmoji,
        tooltip: 'Randomize Emoji',
        backgroundColor: const Color.fromARGB(255, 107, 233, 107),
        child: const Icon(Icons.shuffle),
      ),
    );
  }
}
