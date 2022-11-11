import 'dart:async';
import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

class PermissionsUtils {
  Completer<PermissionStatus>? _cameraCompleter;

  Future<PermissionStatus> _requestPermission(Permission permission) async {
    final PermissionStatus result = await permission.request();
    return PermissionStatus.values[result.index];
  }

  Future<PermissionStatus> requestGalleryPermission() async {
    return _requestPermission(
      Platform.isIOS ? Permission.photos : Permission.storage,
    );
  }

  Future<PermissionStatus> requestCameraPermission() {
    if (_cameraCompleter?.isCompleted ?? false) {
      _cameraCompleter = null;
    }
    if (_cameraCompleter == null) {
      _cameraCompleter = Completer<PermissionStatus>();
      _requestPermission(
        Permission.camera,
      )
          .then(_cameraCompleter!.complete)
          .catchError(_cameraCompleter!.completeError);
    }
    return _cameraCompleter!.future;
  }

  Future<PermissionStatus> requestMicroPhonePermission() async {
    return _requestPermission(Permission.microphone);
  }

  Future<PermissionStatus> requestStoragePermission() async {
    return _requestPermission(Permission.storage);
  }

  Future<PermissionStatus> requestLocationPermission() async {
    return _requestPermission(Permission.location);
  }

  Future<bool> openSettings() async {
    return openAppSettings();
  }
}
