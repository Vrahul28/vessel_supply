class SelectedItem {
  final String name;
  final String category;
  final int quantity;
  bool isSelected;

  SelectedItem({
    required this.name,
    required this.category,
    required this.quantity,
    this.isSelected = true,
  });
}