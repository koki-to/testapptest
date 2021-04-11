import 'package:testapptest/Page/Main/main.dart';
import 'package:testapptest/main.dart';
import 'package:testapptest/utils/env.dart';
import 'package:testapptest/utils/flavor.dart';

void main() {
  Constants.setEnvironment(Environment.DEVELOP);
  print("現在はdevモードです");
  mainDelegate(Flavor.development);
}
