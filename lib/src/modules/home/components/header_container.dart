import 'package:flutter/material.dart';
import 'package:salary_fits_test/generated/l10n.dart';
import 'package:salary_fits_test/src/modules/home/state/home_state.dart';
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              I18n.of(context).lastUpdate(values.lastUpdate),
              style: AppFonts.regular(
                14,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
