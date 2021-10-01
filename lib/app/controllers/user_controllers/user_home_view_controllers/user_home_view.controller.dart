import 'package:flutter/animation.dart';
import 'package:mobx/mobx.dart';
part 'user_home_view.controller.g.dart';

class UserHomeViewController = _UserHomeViewControllerBase
    with _$UserHomeViewController;

abstract class _UserHomeViewControllerBase with Store {
  // Observables
  @observable
  bool logoBarResize = false;

  @observable
  int segmentIndex = 0;

  // Actions
  @action
  changeSegmentIndex(
    int newSegmentIndex,
    AnimationController animationController1,
    AnimationController animationController2,
  ) {
    if (segmentIndex == 0) {
      animationController1.reverse();

      animationController2.forward();
    } else {
      animationController1.forward();

      animationController2.reverse();
    }
    segmentIndex = newSegmentIndex;
    logoBarResize = !logoBarResize;
  }
}
