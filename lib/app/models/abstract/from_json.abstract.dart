abstract class FromJsonModel<T extends dynamic> {
  T fromJson(Map<String, dynamic> json);
  static Type typeOf<T>() => T;
}

// abstract class FromJsonModel<T> {
//   T fromJson(Map<String, dynamic> json);
//   static Type typeOf<T>() => T;
// }
