import 'package:flutter/material.dart';

abstract interface class DebugBannerAdapter {
  Widget createBuilderBanner(context, child);
}