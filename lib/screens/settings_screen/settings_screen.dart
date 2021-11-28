import 'package:auto_size_text/auto_size_text.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/cubit/cubit.dart';
import 'package:news_application/cubit/states.dart';
import 'package:news_application/shared/components/components.dart';
import 'package:news_application/shared/caching_helper.dart';

class SettingsScreen extends StatelessWidget {
  @override
  List<dynamic> countries = [
    'ae',
    'ar',
    'at',
    'au',
    'be',
    'bg',
    'br',
    'ca',
    'ch',
    'cn',
    'co',
    'cu',
    'cz',
    'de',
    'eg',
    'fr',
    'gb',
    'gr',
    'hk',
    'hu',
    'hu',
    'id',
    'ie',
    'il',
    'in',
    'it',
    'jp',
    'kr',
    'lt',
    'lv',
    'ma',
    'mx',
    'my',
    'ng',
    'nl',
    'no',
    'nz',
    'ph',
    'pl',
    'pt',
    'ro',
    'rs',
    'ru',
    'sa',
    'se',
    'sg',
    'si',
    'sk',
    'th',
    'tr',
    'tw',
    'ua',
    'us',
    've',
    'za'
  ];
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          body: Center(
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.red.shade400,
                          Colors.red.shade100,
                          Colors.red.shade200,
                          Colors.red.shade300,
                        ],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                "HomeScreen", (route) => false);
                          },
                          child: Icon(
                            Icons.keyboard_arrow_left,
                            color: cubit.isDark ? Colors.black : Colors.white,
                            size: 30,
                          ),
                        ),
                        Image.asset(
                          'assets/images/logo1.png',
                          height: 500,
                          width: double.infinity,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ListTileTheme(
                        iconColor: cubit.isDark ? Colors.white : Colors.grey,
                        textColor: cubit.isDark ? Colors.white : Colors.black,
                        child: SwitchListTile(
                          title: Text('Dark Mode'
                          ),
                          secondary: Icon(Icons.nightlight_round
                          ),
                          onChanged: (bool value) {
                            cubit.changeAppMode();
                          },
                          value: cubit.isDark,
                        ),
                      ),
                      myDivider(),
                      ListTileTheme(
                        iconColor: cubit.isDark ? Colors.white : Colors.grey,
                        textColor: cubit.isDark ? Colors.white : Colors.black,
                        child: ListTile(
                          leading: Icon(Icons.language
                          ),
                          title: Text('Language'
                          ),
                          trailing: Padding(
                            padding: const EdgeInsets.only(right: 9),
                            child: DropdownButton(
                              dropdownColor:
                                  cubit.isDark ? Colors.red : Colors.white,
                              style: TextStyle(
                                fontSize: 15,
                                color:
                                    cubit.isDark ? Colors.white : Colors.black,
                              ),
                              value: cubit.dropDownValue,
                              icon: Icon(Icons.keyboard_arrow_down),
                              items: cubit.dropDownList.map((String items) {
                                return DropdownMenuItem(
                                    value: items, child: Text(items));
                              }).toList(),
                              onChanged: (String value) {
                                cubit.dropDownItem(value);
                              },
                            ),
                          ),
                        ),
                      ),
                      myDivider(),
                      ListTileTheme(
                        iconColor: cubit.isDark ? Colors.white : Colors.grey,
                        textColor: cubit.isDark ? Colors.white : Colors.black,
                        child: ListTile(
                          leading: Icon(
                            Icons.flag,
                          ),
                          title: AutoSizeText(
                            'Country',
                            maxLines: 1,
                          ),
                          trailing: CountryListPick(
                            useUiOverlay: true,
                            theme: CountryTheme(
                              isShowFlag: true,
                              isShowTitle: true,
                              isShowCode: false,
                              isDownIcon: true,
                              showEnglishName: false,
                              labelColor: Colors.red,
                              alphabetSelectedBackgroundColor: Colors.red,
                            ),
                            // or
                            initialSelection: 'US',
                            onChanged: (CountryCode code) {
                              if (!countries
                                  .contains(code.code.toLowerCase())) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Row(
                                    children: [
                                      Icon(
                                        Icons.flag_outlined,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Country is Unavailable",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17),
                                      ),
                                    ],
                                  ),
                                ));
                              }
                              CacheHelper.putData(
                                  key: "countryName",
                                  value: code.code.toLowerCase());
                            },
                          ),
                        ),
                      ),
                      myDivider(),
                      ListTileTheme(
                        iconColor: cubit.isDark ? Colors.white : Colors.grey,
                        textColor: cubit.isDark ? Colors.white : Colors.black,
                        child: ListTile(
                          leading: Icon(
                            Icons.info,
                          ),
                          title: AutoSizeText(
                            'About',
                            maxLines: 1,
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.keyboard_arrow_right),
                            onPressed: () {},
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
