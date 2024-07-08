class Link {
  dynamic persistentToken;

  Link({this.persistentToken});

  factory Link.fromPaymentIntentModel(Map<String, dynamic> json) => Link(
        persistentToken: json['persistent_token'] as dynamic,
      );

  Map<String, dynamic> toPaymentIntentModel() => {
        'persistent_token': persistentToken,
      };
}
