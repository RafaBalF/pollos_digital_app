String formatCPF(String value) {
  if (value.length != 11) return '';

  return "${value[0]}${value[1]}${value[2]}.${value[3]}${value[4]}${value[5]}.${value[6]}${value[7]}${value[8]}-${value[9]}${value[10]}";
}

String formatPhone(String value) {
  if (value.length > 11 || value.length < 10) return '';

  return (value.length == 11)
      ? "(${value[0]}${value[1]}) ${value[2]}${value[3]}${value[4]}${value[5]}${value[6]}-${value[7]}${value[8]}${value[9]}${value[10]}"
      : "(${value[0]}${value[1]}) ${value[2]}${value[3]}${value[4]}${value[5]}-${value[6]}${value[7]}${value[8]}${value[9]}";
}
