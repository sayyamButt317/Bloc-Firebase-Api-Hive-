import 'package:logger/web.dart';

final logger = Logger(
    printer: PrettyPrinter(
  methodCount: 0,
  errorMethodCount: 50,
  lineLength: 50,
  colors: true,
  printEmojis: true,
  printTime: false,
));
