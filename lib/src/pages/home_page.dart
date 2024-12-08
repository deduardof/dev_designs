import 'package:dev_designs/src/pages/components/number_form_field.dart';
import 'package:dev_designs/src/pages/components/option_buttons.dart';
import 'package:flutter/material.dart';

enum PeriodTypes {
  daily(name: 'Diariamente'),
  weekly(name: 'Semanalmente'),
  monthly(name: 'Mensalmente'),
  yearly(name: 'Anualmente');

  const PeriodTypes({required this.name});

  final String name;
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final valueController = TextEditingController(text: '0');
  PeriodTypes period = PeriodTypes.daily;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Designs App'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(width: 200, child: NumberFormField(controller: valueController)),
                const SizedBox(height: 20),
                OptionButtons(
                  buttons: PeriodTypes.values
                      .map(
                        (p) => OptionButton(
                            selected: p == period,
                            label: p.name,
                            onTap: () {
                              setState(() {
                                period = p;
                              });
                            }),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
