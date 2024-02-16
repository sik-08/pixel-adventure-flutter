import 'dart:async';

import 'package:flame/components.dart';
import 'package:pixel_adventure/pixel_adventure.dart';

enum State { idle, run, hit }

class Chicken extends SpriteAnimationGroupComponent
    with HasGameRef<PixelAdventure> {
  final double offsetNegative;
  final double offsetPositive;
  Chicken({
    super.position,
    super.size,
    this.offsetNegative = 0,
    this.offsetPositive = 0,
  });

  static const stepTime = 0.05;
  final textureSize = Vector2(32, 34);
  late final SpriteAnimation _idleAnimation;
  late final SpriteAnimation _runningAnimation;
  late final SpriteAnimation _hitAnimation;

  @override
  FutureOr<void> onLoad() {
    debugMode = true;

    _loadAllAnimations();
    return super.onLoad();
  }

  void _loadAllAnimations() {
    _idleAnimation = _spriteAnimation(state: 'Idle', amount: 13);
    //TODO animation추가
    //_runningA
  }

  SpriteAnimation _spriteAnimation(
      {required String state, required int amount}) {
    return SpriteAnimation.fromFrameData(
      game.images.fromCache('Enemies/Chicken/$state (32x34).png'),
      SpriteAnimationData.sequenced(
        amount: amount,
        stepTime: stepTime,
        textureSize: textureSize,
      ),
    );
  }
}
