double? convertDouble(dynamic value) {
  if (value != null) {
    return double.tryParse(value.toString());
  }
  return null;
}

int? convertInt(dynamic value) {
  if (value != null) {
    return int.tryParse(value.toString());
  }
  return null;
}

bool? convertBool(dynamic value, {returnNull = true}) {
  if (value != null) {
    return value == true;
  }
  if (returnNull) {
    return null;
  } else {
    return false;
  }
}

DateTime? convertDateTime(dynamic value) {
  if (value != null) {
    return DateTime.tryParse(value);
  }
  return null;
}
