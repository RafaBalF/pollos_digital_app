import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraService {
  PermissionStatus storageStatus = PermissionStatus.denied;
  PermissionStatus cameraStatus = PermissionStatus.denied;

  Future<void> init() async {
    storageStatus = await Permission.storage.status;
    cameraStatus = await Permission.camera.status;
  }

  Future<void> askStoragePermission() async {
    if (!storageStatus.isGranted) {
      await Permission.storage.request();
      storageStatus = await Permission.storage.status;
    }
  }

  Future<void> askCameraPermission() async {
    if (!cameraStatus.isGranted) {
      await Permission.camera.request();
      cameraStatus = await Permission.storage.status;
    }
  }

  get hasStoragePermission async => storageStatus == PermissionStatus.granted;
  get hasCameraPermission async => cameraStatus == PermissionStatus.granted;

  Future<bool> hasAllPermissions() async {
    await askStoragePermission();
    await askCameraPermission();

    return storageStatus == PermissionStatus.granted &&
        cameraStatus == PermissionStatus.granted;
  }

  Future<XFile?> takePhoto({
    source = ImageSource.camera,
    device = CameraDevice.front,
    maxHeight = 480.0,
    maxWidth = 480.0,
  }) async {
    if (!cameraStatus.isGranted) return null;

    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(
      source: source,
      preferredCameraDevice: device,
      maxHeight: maxHeight,
      maxWidth: maxWidth,
    );

    return image;
  }

  Future<XFile?> takePhotoFromCamera({
    device = CameraDevice.front,
    maxHeight = 480.0,
    maxWidth = 480.0,
  }) async {
    return await takePhoto(
      source: ImageSource.camera,
      device: device,
      maxHeight: maxHeight,
      maxWidth: maxWidth,
    );
  }

  Future<XFile?> getPhotoFromGallery({
    maxHeight = 480.0,
    maxWidth = 480.0,
  }) async {
    return await takePhoto(
      source: ImageSource.gallery,
      maxHeight: maxHeight,
      maxWidth: maxWidth,
    );
  }
}
