import 'package:flutter/material.dart';

import '../adapters/debug_banner_adapter.dart';
import '../presentation/banner/xdebugging_banner.dart';

class ErrorBannerFactory {
  ErrorBannerFactory._();

  static DebugBannerAdapter buildBanner(
    VoidCallback? onTap,
  ) {
    return DebugBanner(onTap: onTap);
  }
}