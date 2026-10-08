import 'package:budgetr/global/colors.dart';
import 'package:flutter/material.dart';
import 'package:budgetr/l10n/app_localizations.dart';
import 'package:budgetr/global/hive_boxes.dart';

class SetColor extends StatefulWidget {
  const SetColor({super.key, required this.onChangeColor});

  final Function(String) onChangeColor;
  @override
  State<SetColor> createState() {
    return _SetColorState();
  }
}

class _SetColorState extends State<SetColor> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.color_lens),
      title: Text(AppLocalizations.of(context)?.color ?? 'Color'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            supportedColorsLang(context, appDataBox.get('color')),
            style: const TextStyle(fontSize: 12),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.arrow_forward_ios),
        ],
      ),
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          useSafeArea: true,
          context: context,
          builder: (ctx) => SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    ...supportedColors.keys.map(
                      (supportedColor) => ListTile(
                        leading: CircleAvatar(
                          backgroundColor:
                              supportedColors[supportedColor]?['secondary'] ??
                              Colors.blue,
                        ),
                        title: Text(
                          supportedColorsLang(context, supportedColor),
                        ),
                        onTap: () {
                          appDataBox.put('color', supportedColor);
                          setState(() {
                            appDataBox.put('color', supportedColor);
                          });
                          widget.onChangeColor(supportedColor);
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
