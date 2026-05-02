import 'dart:io';

import 'package:beautisry_merchant/domain/di/dependency_injection.dart';
import 'package:beautisry_merchant/domain/models/enums/active_auth_page.dart';
import 'package:beautisry_merchant/domain/utils/app_logger.dart';
import 'package:beautisry_merchant/domain/utils/ui_constants.dart';
import 'package:beautisry_merchant/presentation/feature_auth/bloc/auth_event.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../data/preferences/user_preferences.dart';
import '../../../../domain/utils/text_helper.dart';
import '../../../../domain/utils/ui_helper.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/locale_keys.g.dart';
import '../../../widgets/buttons/app_elevated_button.dart';
import '../../../widgets/circle_network_image_loader.dart';
import '../../../widgets/helpers.dart';
import '../../../widgets/svg_icon.dart';
import '../../bloc/auth_bloc.dart';
import '../../bloc/auth_state.dart';

class AddImageScreen extends StatefulWidget {
  final VoidCallback onNextTap;
  final VoidCallback onLoading;

  const AddImageScreen(
      {super.key, required this.onNextTap, required this.onLoading});

  @override
  State<AddImageScreen> createState() => _AddImageScreenState();
}

class _AddImageScreenState extends State<AddImageScreen> {
  File? pickedImage;

  Future<void> _pickImage() async {
    if (Platform.isAndroid) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      if (androidInfo.version.sdkInt <= 32) {
        /// use [Permissions.storage.status]
        Permission.storage.request().then((value) async {
          await _pickImageRequest(value);
        });
      } else {
        /// use [Permissions.photos.status]
        Permission.photos.request().then((value) async {
          await _pickImageRequest(value);
        });
      }
    } else {
      Permission.photos.request().then((value) async {
        await _pickImageRequest(value);
      });
    }
  }

  Future<void> _pickImageRequest(PermissionStatus value) async {
    var status = value;

    if (status.isPermanentlyDenied &&
        getIt<UserPreferences>().isPhotoAccessPermanentlyDenied) {
      showPermissionDialog(
        context: context,
        content: LocaleKeys.permissionNotAllowedTextDetails.tr(),
        actionButtonTitle: LocaleKeys.profileSettingsToolbarTitle.tr(),
      );
    } else if (status.isPermanentlyDenied) {
      getIt<UserPreferences>().isPhotoAccessPermanentlyDenied = true;
    } else if (status.isGranted) {
      getIt<UserPreferences>().isPhotoAccessPermanentlyDenied = false;
      final xImage = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 50,
      );
      if (xImage != null) {
        File newImage = File(xImage.path);
        setState(() => pickedImage = newImage);
      }
    }
  }

  Widget _userImage(String? imageUrl) {
    if (pickedImage != null) {
      logPrint('pickedImage: $pickedImage');
      return Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ColorConstants.darkBlue,
        ),
        child: Container(
          margin: const EdgeInsets.all(5),
          width: 170,
          height: 170,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: FileImage(pickedImage!),
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    }
    return imageUrl == null
        ? Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Container(
              margin: const EdgeInsets.all(5),
              width: 170,
              height: 170,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: SvgIcon(
                path: MyAssets.images.svg.uploadImage.path,
                size: 170,
                color: ColorConstants.textSecondaryColor,
              ),
            ),
          )
        : CircleNetworkImageLoader(
            imageUrl: imageUrl,
            radius: 170,
            borderWidth: 5,
          );
  }

  @override
  void initState() {
    getIt<AuthBloc>().add(const AuthEvent.startedRegistrationSteps());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.activePage == ActiveAuthPage.addServices) {
          widget.onLoading();
          widget.onNextTap();
        }
        if (state.isLoading) {
          widget.onLoading();
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            const Height(doublePadding),
            InkWell(
              onTap: () {
                _pickImage();
              },
              child: _userImage(
                state.employee?.imageUrl,
              ),
            ),
            const Height(triplePadding),
            AppElevatedButton(
              enabled: pickedImage != null || state.employee?.imageUrl?.isNotEmpty == true,
              onTap: () {
                if (pickedImage != null) {
                  getIt<AuthBloc>().add(
                    AuthEvent.uploadEmployeeImageAndGetUrl(image: pickedImage!),
                  );
                } else if (state.employee?.imageUrl != null &&
                    state.employee?.imageUrl?.isNotEmpty == true) {
                  widget.onNextTap();
                }
              },
              text: LocaleKeys.next,
            ).respectBodyMargin(),
            const Height(doublePadding),
            InkWell(
              onTap: widget.onNextTap,
              child: AppText(
                LocaleKeys.registrationScreenAddImageSkipThisStep,
                textStyle: Styles.line(color: ColorConstants.mainTextColor),
              ),
            )
          ],
        );
      },
    );
  }
}
