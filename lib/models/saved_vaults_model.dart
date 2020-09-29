class SavedVaultsModel {
  List<Vaults> vaults = [];

  SavedVaultsModel({this.vaults});

  SavedVaultsModel.fromJson(Map<String, dynamic> json) {
    if (json['vaults'] != null) {
      vaults = new List<Vaults>();
      json['vaults'].forEach((v) {
        vaults.add(new Vaults.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.vaults != null) {
      data['vaults'] = this.vaults.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Vaults {
  String localName;
  String name;
  String apiKey;
  String position;
  String description;

  Vaults({
    this.localName,
    this.name,
    this.apiKey,
    this.position,
    this.description,
  });

  Vaults.fromJson(Map<String, dynamic> json) {
    localName = json['localName'];
    name = json['name'];
    apiKey = json['apiKey'];
    position = json['position'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['localName'] = this.localName;
    data['name'] = this.name;
    data['apiKey'] = this.apiKey;
    data['position'] = this.position;
    data['description'] = this.description;
    return data;
  }
}
