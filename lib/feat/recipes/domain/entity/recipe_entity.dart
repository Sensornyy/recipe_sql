class RecipeEntity {
  final String label;
  final int calories;
  final String image;
  final List<String> ingredientLines;

  const RecipeEntity({
    required this.label,
    required this.calories,
    required this.image,
    required this.ingredientLines,
  });
}
