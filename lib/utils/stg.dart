import 'package:testapptest/Page/Main/main.dart';
import 'package:testapptest/main.dart';
import 'package:testapptest/utils/env.dart';
import 'package:testapptest/utils/flavor.dart';

void main() {
  Constants.setEnvironment(Environment.STAGING);
  print("現在はstgモードです");
  mainDelegate(Flavor.staging);
}
