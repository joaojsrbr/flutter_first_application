// import 'package:flutter/material.dart';

// class DisableIndicator extends StatefulWidget {
//   final Widget child;
//   final bool trueOrFalse;
//   const DisableIndicator({
//     Key? key,
//     required this.child,
//     required this.trueOrFalse,
//   }) : super(key: key);

//   @override
//   State<DisableIndicator> createState() => _DisableIndicatorState();
// }

// class _DisableIndicatorState extends State<DisableIndicator> {
//   @override
//   Widget build(BuildContext context) {
//     return NotificationListener<OverscrollIndicatorNotification>(
//         onNotification: (OverscrollIndicatorNotification overscroll) {
//           overscroll.disallowIndicator();
//           return widget.trueOrFalse;
//         },
//         child: widget.child);
//   }
// }
