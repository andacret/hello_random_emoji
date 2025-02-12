// This file is part of Hello Random Emoji
// https://github.com/eduhoratiu/hello_random_emoji
//
// Copyright 2025 eduhoratiu. All rights reserved.
// Licensed under the MIT license. See LICENSE file in the project root for details.

/// A class representing an emoji.
class Emoji {
  const Emoji(this.emoji, this.name);

  /// The Unicode emoji character.
  final String emoji;

  /// The name of the emoji.
  ///
  /// Can have multiple values separated by vertical bars.
  final String name;
}
