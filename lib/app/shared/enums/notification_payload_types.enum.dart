enum NotificationPayloadType { chat, missingPayment }

extension NotificationPayloadTypeExtension on NotificationPayloadType {
  String? get asString {
    return name.toString();
  }
}
