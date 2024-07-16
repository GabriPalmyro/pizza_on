import 'package:flutter/material.dart';

import '../../adapters/debug_banner_adapter.dart';

class DebugBanner implements DebugBannerAdapter {
  DebugBanner({required this.onTap});
  VoidCallback? onTap;

  static const _fabSize = 56.0;
  static const _initialOffset = Offset(100, 100);

  @override
  Widget createBuilderBanner(context, child) {
    final resultWidget = child ?? const Scaffold();
    return Stack(
      children: [
        resultWidget,
        DraggableDebugBanner(
          onTap: onTap,
          initialOffset: _initialOffset,
          child: Container(
            width: _fabSize,
            height: _fabSize,
            decoration: BoxDecoration(
              color: Colors.red.withAlpha(200),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(Icons.error, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

class DraggableDebugBanner extends StatefulWidget {
  const DraggableDebugBanner({required this.onTap, required this.initialOffset, required this.child, super.key});

  final VoidCallback? onTap;
  final Offset initialOffset;
  final Widget child;

  @override
  State<DraggableDebugBanner> createState() => _DraggableDebugBannerState();
}

class _DraggableDebugBannerState extends State<DraggableDebugBanner> {
  late Offset _offset;

  final _fabSize = 56.0;

  @override
  void initState() {
    super.initState();
    _offset = widget.initialOffset;
  }

  void _updatePosition(DragUpdateDetails position) {
    final mediaQuery = MediaQuery.of(context).size;
    final double newOffsetX = (_offset.dx - position.delta.dx).clamp(0, mediaQuery.width - _fabSize);
    final double newOffsetY = (_offset.dy + position.delta.dy).clamp(0, mediaQuery.height - _fabSize);

    setState(() {
      _offset = Offset(newOffsetX, newOffsetY);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: _offset.dy,
      right: _offset.dx,
      child: GestureDetector(
        onPanUpdate: (position) {
          _updatePosition(position);
        },
        onTap: widget.onTap,
        child: widget.child,
      ),
    );
  }
}
