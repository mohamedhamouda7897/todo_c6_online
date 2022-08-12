 import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../shared/my_provid.dart';
import 'change_language_button_sheet.dart';
 import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'change_theme_button_sheet.dart';


class SettingsTab extends StatefulWidget {
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<MyProvid>(context);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.language,style: Theme.of(context).textTheme.headline2,),
          SizedBox(height: 15,),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black)
            ),
            child: InkWell(
                onTap: (){
                  showButtonLanguge();
                },
                child: Text(pro.language=='en'?'English':'العربيه',style: Theme.of(context).textTheme.headline4,)),
          ),
          SizedBox(height: 30,),
          Divider(color: Colors.black,),
          //////////////////////
          Text(AppLocalizations.of(context)!.theme,style: Theme.of(context).textTheme.headline2,),
          SizedBox(height: 15,),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black)
            ),
            child: InkWell(
                onTap: (){
                  showButtonTheme();
                },
                child: Text('light',style: Theme.of(context).textTheme.headline4,)),
          )
        ],
      ),
    );
  }

  showButtonLanguge(){
    showModalBottomSheet(context: context, builder: (context){
      return ChangeLanguage();
    });
  }
  showButtonTheme(){
    showModalBottomSheet(context: context, builder: (context){
      return CahngeTheme();
    });
  }
}
