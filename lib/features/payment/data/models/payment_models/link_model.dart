class LinkModel {
  final dynamic persistentToken;

  LinkModel({required this.persistentToken});

  factory LinkModel.fromJson(Map<String, dynamic> json) {
    return LinkModel(persistentToken: 'persistent_token');
  }
}
