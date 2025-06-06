import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greendo/features/profile/presentation/views/widgets/profile_header.dart';
import 'package:greendo/features/profile/presentation/views/widgets/profile_view_body.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/utils/service_locator.dart';
import '../view_model/profile/profile_cubit.dart';
import '../view_model/profile/profile_state.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool showCategories = false;

  void toggleView() {
    setState(() {
      showCategories = !showCategories;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileCubit>()..getUserById(),
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.fromLTRB(13, 65, 13, 3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                    if (state is ProfileLoading) {
                      return Center(
                        child: Lottie.asset(loading, height: 50, width: 50),
                      );
                    } else if (state is ProfileLoaded) {
                      return ProfileHeader(
                        user: state.user,
                        showCategories: showCategories,
                        onTapTags: () {
                          if (showCategories) toggleView();
                        },
                        onTapCategories: () {
                          if (!showCategories) toggleView();
                        },
                      );
                    } else if (state is ProfileError) {
                      return Center(child: Text(state.message));
                    }
                    return const SizedBox.shrink();
                  },
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      if (state is ProfileLoaded) {
                        return ProfileViewBody(
                          showCategories: showCategories,
                          user: state.user,
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
