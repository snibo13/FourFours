import 'app_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class AppStateContainer extends StatefulWidget {
  //Container that allows for loading state management
  final AppState state;
  final Widget child;

  AppStateContainer({
    @required this.child,
    this.state,
  });

  //Method to allow universal access to state management
  static _AppStateContainerState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_InheritedStateContainer)
            as _InheritedStateContainer)
        .data;
  }

  @override
  _AppStateContainerState createState() => _AppStateContainerState();
}

class _AppStateContainerState extends State<AppStateContainer> {
  AppState state;

  @override
  void initState() {
    super.initState();
    if (widget.state != null) {
      state = widget.state;
    } else {
      state = new AppState.loading();
      startCountdown();
    }
  }

  Future<Null> startCountdown() async {
    const timeOut = const Duration(seconds: 2);
    new Timer(timeOut, () {
      setState(() {
        state.isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new _InheritedStateContainer(data: this, child: widget.child);
  }
}

class _InheritedStateContainer extends InheritedWidget {
  //Data to pass down
  final _AppStateContainerState data;

  _InheritedStateContainer({
    Key key,
    @required this.data,
    @required Widget child,
  }) : super(key: key, child: child);

  //Method called by default when this widget data is changed
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
