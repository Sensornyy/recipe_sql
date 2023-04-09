class RecipeEntity {
  final String label;
  final double calories;
  final String image;
  final List<String> ingredientLines;

  const RecipeEntity({
    required this.label,
    required this.calories,
    required this.image,
    required this.ingredientLines,
  });
}
