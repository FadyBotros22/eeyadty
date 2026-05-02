import 'package:flutter/material.dart';

import '../../../app_config.dart';
import '../../../domain/utils/text_helper.dart';
import '../../../domain/utils/ui_helper.dart';
import '../../../gen/locale_keys.g.dart';
import '../../widgets/buttons/app_elevated_button.dart';
import '../../widgets/inputs/app_text_field.dart';
import '../../widgets/modals/modals.dart';

class LoginTitle extends StatefulWidget {
  const LoginTitle({super.key});

  @override
  State<LoginTitle> createState() => _LoginTitleState();
}

class _LoginTitleState extends State<LoginTitle> {
  int _count = 0;
  TextEditingController urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _count++;
        });
        if (_count == 10) {
          showAppModal(context,
              child: Container(
                height: screenSize(context).height * 0.9,
                margin: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Align(
                      alignment:
                      AlignmentDirectional.centerStart,
                      child: AppText(
                        'BaseUrl',
                        textStyle: Styles.line(),
                      ),
                    ),
                    const Height(halfPadding),
                    AppTextField(
                      hint: 'BaseUrl',
                      controller: urlController,
                      keyboardType: TextInputType.text,
                    ),
                    const Height(20),
                    AppElevatedButton(
                      onTap: () {
                        AppConfig.shared.baseUrl =
                            urlController.text;
                        Navigator.of(context).pop();
                      },
                      text: 'Save',
                    )
                  ],
                ),
              ));
          setState(() {
            _count = 0;
          });
        }
      },
      child: AppText(
        LocaleKeys.loginScreenTitle,
        textStyle: Styles.title(),
      ),
    );
  }
}
