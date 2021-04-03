import 'package:testapptest/main.dart';
import 'package:testapptest/utils/env.dart';
import 'package:testapptest/utils/flavor.dart';

void main() {
  Constants.setEnvironment(Environment.PRODUCTION);
  print("現在はprodモードです");
  mainDelegate(Flavor.production);
}
