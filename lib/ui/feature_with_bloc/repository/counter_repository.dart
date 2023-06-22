import 'package:http/http.dart' as http;

class CounterRepository {
  static final CounterRepository _counterRepository = CounterRepository._();

  CounterRepository._();
  
  factory CounterRepository() {
    return _counterRepository;
  }
  
  //Return an element I hate return a dynamic....
  Future<dynamic> getCounter(int page) async {
    try {

      print("Printing the fake param $page");

      return await http.get(
        Uri.parse('http://ip.jsontest.com')
      );
    } catch (e) {
      return e.toString();
    }
  }
}
