import 'dart:io';

import 'package:petize_test/app/inject_dependencies.dart';

String fixture(String name) => File('test/fixtures/$name').readAsStringSync();
