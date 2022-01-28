import 'package:ateizm_fikri/config/constants.dart';
import 'package:ateizm_fikri/config/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DialogBox extends StatelessWidget {
  DialogBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _themeColorData = Provider.of<ThemeColorData>(context).isLight;

    return Scaffold(
      backgroundColor: _themeColorData ? kContentColorLightTheme : kContentColorDarkTheme,
      appBar: AppBar(),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SwitchListTile(
                  activeColor: kPrimaryColor,
                  title:
                      _themeColorData ? Text('Açık Tema') : Text('Koyu Tema'),
                  value: Provider.of<ThemeColorData>(context).isLight,
                  onChanged: (bool value) {
                    Provider.of<ThemeColorData>(context, listen: false)
                        .switchTheme(value);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
