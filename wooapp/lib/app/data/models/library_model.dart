class LibraryModel {
  String? name;
  String? long;
  String? lat;
  String? capacity;
  String? id;

  LibraryModel({this.name, this.long, this.lat, this.capacity, this.id});

  LibraryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    long = json['long'];
    lat = json['lat'];
    capacity = json['capacity'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['long'] = long;
    data['lat'] = lat;
    data['capacity'] = capacity;
    data['id'] = id;
    return data;
  }
}

