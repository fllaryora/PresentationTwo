class Counter {

  Counter({ this.countable = "" });
  String countable;

  Counter.fromJson(Map<String, dynamic> json)
      : countable = json['ip'];


  ///   What if we had 2 params?
  ///   Counter.fromJson(Map<String, dynamic> json)
  ///    : param_one = json['param_one'],
  ///    param_two = json['param_two'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ip'] = countable;
    return data;
  }

}