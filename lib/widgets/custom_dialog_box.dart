import 'package:ateizm_fikri/config/constants.dart';
import 'package:ateizm_fikri/config/theme_data.dart';
import 'package:ateizm_fikri/views/about/about.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

class CustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 0.0,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    bool _isLight = Provider.of<ThemeColorData>(context).isLight;

    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: new BoxDecoration(
        color: _isLight ? Colors.white : kDarkColor,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: const Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          /*SwitchListTile(
            activeColor: kPrimaryColor,
            controlAffinity: ListTileControlAffinity.platform,
            value: _isLight,
            secondary: _isLight
                ? Icon(Icons.wb_sunny_outlined)
                : Icon(Icons.nightlight_outlined),
            title: _isLight
                ? Text(
                    'Açık Tema',
                    style: TextStyle(
                        fontFamily: 'Muli',
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  )
                : Text(
                    'Koyu Tema',
                    style: TextStyle(
                        fontFamily: 'Muli',
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
            onChanged: (bool value) {
              Provider.of<ThemeColorData>(context, listen: false)
                  .switchTheme(value);
            },
          ),*/
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => About()));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hakkında",
                  style: TextStyle(
                      fontFamily: 'Muli',
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
                Icon(Icons.info_outline, color: Colors.orange),
              ],
            ),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              Share.share(
                  "Uygulamayı indirerek aklındaki sorulara cevap bulabilirsin!");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Uygulamayı Paylaş",
                  style: TextStyle(
                      fontFamily: 'Muli',
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
                Icon(Icons.share, color: Colors.blueAccent),
              ],
            ),
          ),
          SizedBox(height: 10),
          /*GestureDetector(
          onTap: () async {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => LoginHome()));
            await FirebaseAuth.instance.signOut();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Uygulamadan Çıkış Yap",
                style: TextStyle(
                    fontFamily: 'Muli',
                    fontWeight: FontWeight.w500,
                    fontSize: 15),
              ),
              Icon(Icons.exit_to_app_outlined, color: Colors.redAccent),
            ],
          ),
        ),*/
        ],
      ),
    );
  }
}
