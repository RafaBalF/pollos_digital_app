import 'package:flutter/material.dart';
import 'package:flutter_microsoft_clarity/flutter_microsoft_clarity.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:pollos_digital/app/models/auth.model.dart';
import 'package:pollos_digital/app/models/credit_card.model.dart';
import 'package:pollos_digital/app/models/credit_cards.model.dart';
import 'package:pollos_digital/app_module.dart';
import 'package:pollos_digital/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterMicrosoftClarity().init(projectId: 'ojrnkc7pl6', userId: 'UserName');

  Intl.defaultLocale = 'pt_BR';
  initializeDateFormatting('pt_BR');

  await Hive.initFlutter();

  Hive.registerAdapter(AuthModelAdapter());
  Hive.registerAdapter(CreditCardModelAdapter());
  Hive.registerAdapter(CreditCardsModelAdapter());

  await Hive.openBox('login');
  await Hive.openBox('app_presentation');
  await Hive.openBox('credit_cards');

  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
