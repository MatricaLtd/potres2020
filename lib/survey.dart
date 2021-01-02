import 'package:dio/dio.dart';

class SurveysData {
  int count;
  List<Results> results;
  Null limit;
  int offset;
  String order;
  String orderby;
  String curr;
  String next;
  String prev;
  int totalCount;

  SurveysData(
      {this.count,
      this.results,
      this.limit,
      this.offset,
      this.order,
      this.orderby,
      this.curr,
      this.next,
      this.prev,
      this.totalCount});

  SurveysData.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['results'] != null) {
      results = new List<Results>();
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
    limit = json['limit'];
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
    data['limit'] = this.limit;
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
  Null parentId;
  String name;
  String description;
  String color;
  String type;
  bool disabled;
  String created;
  String updated;
  bool hideAuthor;
  bool hideTime;
  bool hideLocation;
  bool requireApproval;
  bool qAryoneCanCreate;
  bool targetedSurvey;
  List<String> canCreate;
  List<Tags> tags;
  List<String> allowedPrivileges;

  Results(
      {this.id,
      this.url,
      this.parentId,
      this.name,
      this.description,
      this.color,
      this.type,
      this.disabled,
      this.created,
      this.updated,
      this.hideAuthor,
      this.hideTime,
      this.hideLocation,
      this.requireApproval,
      this.qAryoneCanCreate,
      this.targetedSurvey,
      this.canCreate,
      this.tags,
      this.allowedPrivileges});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    parentId = json['parent_id'];
    name = json['name'];
    description = json['description'];
    color = json['color'];
    type = json['type'];
    disabled = json['disabled'];
    created = json['created'];
    updated = json['updated'];
    hideAuthor = json['hide_author'];
    hideTime = json['hide_time'];
    hideLocation = json['hide_location'];
    requireApproval = json['require_approval'];
    qAryoneCanCreate = json['QAryone_can_create'];
    targetedSurvey = json['targeted_survey'];
    canCreate = json['can_create'].cast<String>();
    if (json['tags'] != null) {
      tags = new List<Tags>();
      json['tags'].forEach((v) {
        tags.add(new Tags.fromJson(v));
      });
    }
    allowedPrivileges = json['allowed_privileges'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['parent_id'] = this.parentId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['color'] = this.color;
    data['type'] = this.type;
    data['disabled'] = this.disabled;
    data['created'] = this.created;
    data['updated'] = this.updated;
    data['hide_author'] = this.hideAuthor;
    data['hide_time'] = this.hideTime;
    data['hide_location'] = this.hideLocation;
    data['require_approval'] = this.requireApproval;
    data['QAryone_can_create'] = this.qAryoneCanCreate;
    data['targeted_survey'] = this.targetedSurvey;
    data['can_create'] = this.canCreate;
    if (this.tags != null) {
      data['tags'] = this.tags.map((v) => v.toJson()).toList();
    }
    data['allowed_privileges'] = this.allowedPrivileges;
    return data;
  }
}

class Tags {
  int id;
  String url;

  Tags({this.id, this.url});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    return data;
  }
}

Future<List<Results>> getSurveysData() async {
  var _dio = Dio();

  Response response = await _dio.get(
      "https://potres2020.openit.hr/api/v3/forms",
      options: Options(responseType: ResponseType.json));
  print(SurveysData.fromJson(response.data).results);
  return SurveysData.fromJson(response.data).results;
}
