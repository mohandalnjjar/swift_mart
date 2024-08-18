class StarRatingCounts {
  final double fiveStars;
  final double fourStars;
  final double threeStars;
  final double twoStars;
  final double oneStar;

  StarRatingCounts({
    required this.fiveStars,
    required this.fourStars,
    required this.threeStars,
    required this.twoStars,
    required this.oneStar,
  });

  factory StarRatingCounts.fromReviews(List<dynamic> reviews) {
    final totalReviews = reviews.length.toDouble(); // Total number of reviews

    final countFiveStars =
        reviews.where((review) => review['rating'] == 5).length / totalReviews;
    final countFourStars =
        reviews.where((review) => review['rating'] == 4).length / totalReviews;
    final countThreeStars =
        reviews.where((review) => review['rating'] == 3).length / totalReviews;
    final countTwoStars =
        reviews.where((review) => review['rating'] == 2).length / totalReviews;
    final countOneStar =
        reviews.where((review) => review['rating'] == 1).length / totalReviews;

    return StarRatingCounts(
      fiveStars: countFiveStars,
      fourStars: countFourStars,
      threeStars: countThreeStars,
      twoStars: countTwoStars,
      oneStar: countOneStar,
    );
  }
}
