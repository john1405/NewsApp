class ArticleModel {
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String context;
  String content;

  DateTime publishedAt;

  ArticleModel(
      {this.author,
      this.title,
      this.context,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});
}
