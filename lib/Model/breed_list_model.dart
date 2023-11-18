class BreedListModel {
  bool? error;
  String? message;
  List<BreedDataList>? data;

  BreedListModel({this.error, this.message, this.data});

  BreedListModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    if (json['data'] != null) {
      data = <BreedDataList>[];
      json['data'].forEach((v) {
        data!.add(new BreedDataList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BreedDataList {
  String? id;
  String? parent;
  String? name;
  String? gestationPeriod;
  String? firstMatting;
  String? secondOnwards;
  String? image;
  String? createdAt;

  BreedDataList(
      {this.id,
        this.parent,
        this.name,
        this.gestationPeriod,
        this.firstMatting,
        this.secondOnwards,
        this.image,
        this.createdAt});

  BreedDataList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parent = json['parent'];
    name = json['name'];
    gestationPeriod = json['gestation_period'];
    firstMatting = json['first_matting'];
    secondOnwards = json['second_onwards'];
    image = json['image'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['parent'] = this.parent;
    data['name'] = this.name;
    data['gestation_period'] = this.gestationPeriod;
    data['first_matting'] = this.firstMatting;
    data['second_onwards'] = this.secondOnwards;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    return data;
  }
}
