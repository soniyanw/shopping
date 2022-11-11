import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

abstract class DeviceUtils {
  Future<String> getDeviceId();

  Future<String> getAppVersion();

  Future<String> getAppName();

  Future<String> getPackageName();

  Future<String> getBuildNumber();
}

class _DeviceUtils implements DeviceUtils {
  Future<void> init() async {}

  Future<void> dispose() async {}

  @override
  Future<String> getDeviceId() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

    String deviceId;

    if (Platform.isAndroid) {
      final AndroidDeviceInfo result = await deviceInfoPlugin.androidInfo;

      deviceId = result.id ?? '';
    } else if (Platform.isIOS) {
      final IosDeviceInfo result = await deviceInfoPlugin.iosInfo;

      deviceId = result.identifierForVendor ?? '';
    } else {
      throw UnimplementedError();
    }
    return deviceId;
  }

  @override
  Future<String> getAppVersion() async {
    String appVersion;

    final PackageInfo info = await PackageInfo.fromPlatform();

    appVersion = info.version;

    return appVersion;
  }

  @override
  Future<String> getAppName() async {
    String appName;

    final PackageInfo info = await PackageInfo.fromPlatform();

    appName = info.appName;

    return appName;
  }

  @override
  Future<String> getPackageName() async {
    String packageName;

    final PackageInfo info = await PackageInfo.fromPlatform();

    packageName = info.packageName;

    return packageName;
  }

  @override
  Future<String> getBuildNumber() async {
    String buildNumber;

    final PackageInfo info = await PackageInfo.fromPlatform();

    buildNumber = info.buildNumber;

    return buildNumber;
  }
}
