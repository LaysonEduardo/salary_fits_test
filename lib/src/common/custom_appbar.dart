import 'package:flutter/material.dart';
import 'package:salary_fits_test/src/modules/home/state/home_state.dart';
import 'package:show_up_animation/show_up_animation.dart';

import '../../generated/l10n.dart';
import 'components/default_box.dart';
import '../modules/home/components/header_container.dart';
import 'app_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onUpdate;
  final HomeSuccessState values;
  const CustomAppBar({super.key, this.onUpdate, required this.values});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ShowUpAnimation(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DefaultBox(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              margin: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: HeaderContainer(
                values: values,
                onUpdate: onUpdate,
              ),
            ),
            TabBar(
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Tab(
                  height: 30,
                  child: Text(
                    I18n.of(context).today,
                    style: const AppFonts.medium(
                      16,
                      color: Colors.white,
                    ),
                  ),
                ),
                Tab(
                  height: 30,
                  child: Text(
                    I18n.of(context).nextDays,
                    style: const AppFonts.medium(16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(160);
}
