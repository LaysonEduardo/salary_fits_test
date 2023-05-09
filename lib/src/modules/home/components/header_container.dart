import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:salary_fits_test/generated/l10n.dart';
import 'package:salary_fits_test/src/common/components/default_box.dart';
import 'package:salary_fits_test/src/modules/home/bloc/home_bloc.dart';
import 'package:salary_fits_test/src/modules/home/state/home_state.dart';
import 'package:salary_fits_test/src/modules/language/bloc/app_language_bloc.dart';
import 'package:salary_fits_test/src/modules/language/language.dart';
import 'package:salary_fits_test/src/modules/language/state/app_language_event.dart';
import '../../../common/app_colors.dart';
import '../../../common/app_fonts.dart';

class HeaderContainer extends StatelessWidget {
  final HomeSuccessState values;
  final VoidCallback? onUpdate;
  const HeaderContainer({
    super.key,
    required this.values,
    required this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                '${values.location.state}, ${values.location.country}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                style: AppFonts.medium(
                  20,
                  color: AppColors.accent(weatherState: values.weatherState),
                ),
              ),
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (context) {
                        return settingsModalDialog(context);
                      },
                    );
                  },
                  child: Icon(
                    Icons.settings,
                    size: 28,
                    color: AppColors.accent(weatherState: values.weatherState),
                  ),
                ),
              ],
            ),
          ],
        ),
        Text(
          values.date,
          style: AppFonts.regular(
            16,
            color: AppColors.accent(weatherState: values.weatherState),
          ),
        ),
        Divider(
          color: Colors.grey[600],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox.shrink(),
            Text(
              I18n.of(context).lastUpdate(values.lastUpdate),
              style: AppFonts.regular(
                14,
                color: Colors.grey[600],
              ),
            ),
            InkWell(
              onTap: onUpdate,
              child: Icon(
                Icons.refresh_rounded,
                size: 28,
                color: AppColors.accent(weatherState: values.weatherState),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget settingsModalDialog(BuildContext context) {
    // Weather unit
    bool useCelsius = homeBloc.weather.useCelsius;

    const List<Widget> metrics = <Widget>[
      Text('Celsius'),
      Text('Fahrenheit'),
    ];

    // Language
    Language language =
        appLanguageBloc.state.selectedLanguage ?? deviceLanguage();

    List<Widget> languages = <Widget>[
      Text(I18n.of(context).portuguese),
      Text(I18n.of(context).english),
    ];

    return StatefulBuilder(builder: (context, setState) {
      final List<bool> selectedMetric = <bool>[
        useCelsius,
        !useCelsius,
      ];

      final List<bool> selectedLanguages = <bool>[
        language == Language.portuguese,
        language == Language.english
      ];

      return BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 3.0,
          sigmaY: 3.0,
        ),
        child: DefaultBox(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    I18n.of(context).settings,
                    style: const AppFonts.medium(
                      20,
                      color: AppColors.lightBlue,
                    ),
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FittedBox(
                        child: Text(
                          I18n.of(context).measureUnit,
                          style: const AppFonts.medium(
                            16,
                            color: AppColors.lightBlue,
                          ),
                        ),
                      ),
                      ToggleButtons(
                        onPressed: (int index) {
                          setState(() {
                            useCelsius = index == 0 ? true : false;
                          });
                        },
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        selectedBorderColor: Colors.transparent,
                        selectedColor: Colors.white,
                        fillColor: AppColors.lightBlue,
                        color: AppColors.lightBlue,
                        textStyle: const AppFonts.regular(
                          14,
                        ),
                        constraints: const BoxConstraints(
                          minHeight: 40.0,
                          minWidth: 80.0,
                        ),
                        isSelected: selectedMetric,
                        children: metrics,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FittedBox(
                        child: Text(
                          I18n.of(context).language,
                          style: const AppFonts.medium(
                            16,
                            color: AppColors.lightBlue,
                          ),
                        ),
                      ),
                      ToggleButtons(
                        onPressed: (int index) {
                          setState(() {
                            language = index == 0
                                ? Language.portuguese
                                : Language.english;
                          });
                        },
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        selectedBorderColor: Colors.transparent,
                        selectedColor: Colors.white,
                        fillColor: AppColors.lightBlue,
                        color: AppColors.lightBlue,
                        textStyle: const AppFonts.regular(
                          14,
                        ),
                        constraints: const BoxConstraints(
                          minHeight: 40.0,
                          minWidth: 80.0,
                        ),
                        isSelected: selectedLanguages,
                        children: languages,
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                      homeBloc.weather.useCelsius = useCelsius;
                      appLanguageBloc.add(
                        ChangeLanguage(selectedLanguage: language),
                      );
                      onUpdate?.call();
                    },
                    color: AppColors.lightBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      I18n.of(context).save,
                      style: const AppFonts.medium(14, color: Colors.white),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Colors.red[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      I18n.of(context).cancel,
                      style: const AppFonts.medium(14, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
