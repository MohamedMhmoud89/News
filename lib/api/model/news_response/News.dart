import 'package:news/api/model/sources_response/Source.dart';

/// source : {"id":"marca","name":"Marca"}
/// author : "marca.com"
/// title : "Notre Dame affirms commitment to Independent status amid CFP National Championship run"
/// description : "In the midst of an exhilarating run to the College Football Playoff (CFP) National Championship Game, Notre Dame Athletic Director Pete Bevacqua has reiterated the university&apos;"
/// url : "https://www.marca.com/en/ncaa/2025/01/12/6782f3ad46163f3caf8b459e.html"
/// urlToImage : "https://phantom-marca.unidadeditorial.es/2658ade71f9ac8ef72c0a709eedf263c/resize/1200/f/webp/assets/multimedia/imagenes/2025/01/11/17366351903944.jpg"
/// publishedAt : "2025-01-12T00:33:35Z"
/// content : "In the midst of an exhilarating run to the College Football Playoff (CFP) National Championship Game, Notre Dame Athletic Director Pete Bevacqua has reiterated the university's steadfast commitment t… [+1873 chars]"

class News {
  News({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  News.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }
}
