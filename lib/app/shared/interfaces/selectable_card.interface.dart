class SelectableCard<T> {
  String label;
  T value;
  bool selected;
  Function? onSelect;
  Function? onUnselect;

  SelectableCard({
    required this.label,
    required this.value,
    this.selected = false,
    this.onSelect,
    this.onUnselect,
  });
}
