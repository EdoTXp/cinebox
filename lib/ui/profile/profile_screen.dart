import 'package:cinebox/ui/core/themes/colors.dart';
import 'package:cinebox/ui/core/themes/text_styles.dart';
import 'package:cinebox/ui/core/widgets/loader_messages.dart';
import 'package:cinebox/ui/profile/commands/get_user_command.dart';
import 'package:cinebox/ui/profile/commands/logout_command.dart';
import 'package:cinebox/ui/profile/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen>
    with LoaderAndMessages {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(profileViewModelProvider).fetchUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(getUserCommandProvider);

    ref.listen(logoutCommandProvider, (_, state) {
      state.whenOrNull(
        loading: () => showLoader(),
        data: (logout) {
          hideLoader();
          if (logout != null) {
            if (logout) {
              Navigator.of(
                context,
              ).pushNamedAndRemoveUntil('/login', (_) => false);
            } else {
              showErrorSnackBar('Erro ao realizar logout');
            }
          }
        },
      );
    });

    return Scaffold(
      body: user.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => const Center(
          child: Text('Erro ao buscar dados do usuário'),
        ),
        data: (data) {
          if (data == null) {
            return Center(
              child: Text('Nenhum usuário encontrado'),
            );
          }

          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 22),
                child: Column(
                  children: [
                    Center(
                      child: ClipOval(
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: AppColors.lightGrey.withAlpha(30),
                          child: Visibility(
                            visible: data.picture.isNotEmpty,
                            replacement: Icon(
                              Icons.person,
                              size: 50,
                              color: AppColors.lightGrey,
                            ),
                            child: Image.network(
                              data.picture,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      data.email,
                      style: AppTextStyles.subtitleSmall,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Divider(),
                    const SizedBox(
                      height: 8,
                    ),
                    ListTile(
                      onTap: () {
                        ref.read(logoutCommandProvider.notifier).execute();
                      },
                      leading: Icon(
                        Icons.logout_outlined,
                        color: AppColors.redColor,
                      ),
                      title: Text('Sair'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
