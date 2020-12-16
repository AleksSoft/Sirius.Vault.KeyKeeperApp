class SavedVaultsModel {
  List<Vault> vaults = [];

  SavedVaultsModel({this.vaults});

  SavedVaultsModel.empty() {
    vaults = [];
  }

  SavedVaultsModel.fromJson(Map<String, dynamic> json) {
    if (json['vaults'] != null) {
      vaults = <Vault>[];
      json['vaults'].forEach((v) {
        vaults.add(new Vault.fromJson(v));
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

class Vault {
  String localName;
  String name;
  String apiKey;
  String position;
  String description;

  Vault({
    this.localName,
    this.name,
    this.apiKey,
    this.position,
    this.description,
  });

  Vault.fromJson(Map<String, dynamic> json) {
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
