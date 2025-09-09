class Category {
  Category({
    required this.iconPath,
    required this.label,
  }) : assert(iconPath.contains('.svg'), 'Icon path must contain .svg');
  final String iconPath;
  final String label;
}
