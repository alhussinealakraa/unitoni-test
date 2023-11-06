import 'package:equatable/equatable.dart';


class NewsListModel extends Equatable {
  late String status;
  late int totalResults;
  late List<ArticleModel> articles;


  NewsListModel(
      {this.status='',
        this.totalResults=0,
        this.articles = const [],
        });

  NewsListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] ?? '';
    totalResults = json['totalResults'] ?? 0;
    articles=[];
    if (json['articles'] != null){
      for (var arti in json['articles']){
        articles.add(ArticleModel.fromJson(arti));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['totalResults'] = totalResults;
    data['articles'] = articles.map((e) => e.toJson()).toList();
    return data;
  }

  @override
  List<Object?> get props => [
    status,
    totalResults,
    articles,
  ];
}

class ArticleModel extends Equatable {
  late String title, publishedAt, urlToImage, author;

  ArticleModel(
      {this.title='',
        this.publishedAt='',
        this.urlToImage = '',
        this.author= '',
      });

  ArticleModel.fromJson(Map<String, dynamic> json) {
    title = json['title'] ?? '';
    publishedAt = json['publishedAt'] ?? '';
    urlToImage = json['urlToImage'] ?? '';
    author = json['author'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['publishedAt'] = publishedAt;
    data['urlToImage'] = urlToImage;
    data['author'] = author;
    return data;
  }

  @override
  List<Object?> get props => [
    title,
    publishedAt,
    author,
    author,
  ];
}
