import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_c6_online/shared/my_provid.dart';
import 'package:todo_c6_online/shared/styles/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChangeLanguage extends StatefulWidget {

  @override
  State<ChangeLanguage> createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<MyProvid>(context);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
              onTap: (){
                pro.changeLanguage('en');
              },
              child: selectedLang(pro.language=='en'?true:false,  pro.language=='en'?'English':'الانجليزيه')),
          SizedBox(height: 15,),
          InkWell(
              onTap: (){
                pro.changeLanguage('ar');
              },
              child: selectedLang(pro.language=='ar'?true:false, pro.language=='en'?'Arabic':'العربيه')),
        ],
      ),
    );
  }

  Widget selectedLang(bool done,String text){
    if(done){
     return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text,style: Theme.of(context).textTheme.headline4?.copyWith(
              color: MyThemeData.selectedColor
          ),),
          Icon(Icons.done,color: MyThemeData.selectedColor,)
        ],
      );
    }else{
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text,style: Theme.of(context).textTheme.headline4?.copyWith(
              color: MyThemeData.unselectedColor
          ),),
          Icon(Icons.minimize)
        ],
      );
    }
  }
}
