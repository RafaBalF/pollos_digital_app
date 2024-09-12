class SimpleSelectableCard<T> {
  T value;
  bool selected;

  SimpleSelectableCard({
    required this.value,
    this.selected = false,
  });
}
