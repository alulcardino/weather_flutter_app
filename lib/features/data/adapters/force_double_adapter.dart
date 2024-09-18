import 'package:typed_json/typed_json.dart';

class ForceDoubleJsonAdapter extends JsonAdapter<double> {
    ForceDoubleJsonAdapter();

  @override
   double fromJson(Json json) {
    final num value = json.numOrException;
    return value.toDouble();
  }
  
  @override
  Json toJson(double? value) {
    return Json(value);
  }


}

