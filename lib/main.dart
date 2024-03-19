import 'package:flutter/material.dart';
import 'package:flutter_intl_eg/l10n/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: const NewWidget(),
    );
  }
}

class NewWidget extends StatefulWidget {
  const NewWidget({
    super.key,
  });

  @override
  State<NewWidget> createState() => _NewWidgetState();
}

class _NewWidgetState extends State<NewWidget> {
  @override
  Widget build(BuildContext context) {
    S.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: Column(
        children: [
          Center(
            child: Text(S().hello),
          ),
          ElevatedButton(
            onPressed: () async {
              await S.load(const Locale('ta'));
              debugPrint(S.current.hello);
              setState(() {});
            },
            child: const Text("Tamil"),
          ),
          ElevatedButton(
            onPressed: () async {
              await S.load(const Locale('en'));
              setState(() {});
              debugPrint(S.current.hello);
            },
            child: const Text("English"),
          ),
        ],
      ),
    );
  }
}
