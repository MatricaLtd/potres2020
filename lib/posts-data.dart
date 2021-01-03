import 'dart:convert';

import 'package:dio/dio.dart';

class PostsData {
  int count;
  List<Results> results;
  int offset;
  String order;
  String orderby;
  String curr;
  String next;
  String prev;
  int totalCount;

  PostsData(
      {this.count,
      this.results,
      this.offset,
      this.order,
      this.orderby,
      this.curr,
      this.next,
      this.prev,
      this.totalCount});

  PostsData.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['results'] != null) {
      results = new List<Results>();
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
    offset = json['offset'];
    order = json['order'];
    orderby = json['orderby'];
    curr = json['curr'];
    next = json['next'];
    prev = json['prev'];
    totalCount = json['total_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    data['offset'] = this.offset;
    data['order'] = this.order;
    data['orderby'] = this.orderby;
    data['curr'] = this.curr;
    data['next'] = this.next;
    data['prev'] = this.prev;
    data['total_count'] = this.totalCount;
    return data;
  }
}

class Results {
  int id;
  String url;
  String color;
  String type;
  String title;
  String slug;
  String content;
  String status;
  String created;
  String updated;
  String locale;
  String telefon;
  String postDate;
  String tags;
  List<String> sets;
  List<String> allowedPrivileges;

  Results(
      {this.id,
      this.url,
      this.color,
      this.type,
      this.title,
      this.slug,
      this.content,
      this.status,
      this.created,
      this.updated,
      this.locale,
      this.telefon,
      this.postDate,
      this.tags,
      this.sets,
      this.allowedPrivileges});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    color = json['color'];
    type = json['type'];
    title = json['title'];
    slug = json['slug'];
    content = json['content'];
    status = json['status'];
    created = json['created'];
    updated = json['updated'];
    locale = json['locale'];
    
    telefon = json['values'].toString();
    postDate = json['post_date'];
    sets = json['sets'].cast<String>();
    allowedPrivileges = json['allowed_privileges'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['color'] = this.color;
    data['type'] = this.type;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['content'] = this.content;
    data['status'] = this.status;
    data['created'] = this.created;
    data['updated'] = this.updated;
    data['locale'] = this.locale;
    data['telefon'] = this.telefon;
    data['post_date'] = this.postDate;
    data['sets'] = this.sets;
    data['allowed_privileges'] = this.allowedPrivileges;
    return data;
  }
}


Future<List<Results>> getPostsData() async {
  var _dio = Dio();
  //_dio.options.headers = {"Authorization": "Bearer $token"};

  Response response = await _dio.get(
      'https://potres2020.openit.hr/api/v3/posts',
      options: Options(responseType: ResponseType.json));
  print(PostsData.fromJson(response.data).results);
  return PostsData.fromJson(response.data).results;
}
