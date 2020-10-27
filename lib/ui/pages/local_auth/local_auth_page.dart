import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validator/app/utils/utils.dart';
import 'package:validator/controller/local_auth/local_auth_controller.dart';
import 'package:validator/ui/widgets/empty_reloading_view.dart';

class LocalAuthPage extends StatelessWidget {
  LocalAuthPage({
    this.isCreatePin = false,
    this.isCloseVisible = true,
    this.checkLocalAuth = true,
    Key key,
  }) : super(key: key);

  final isCreatePin;
  final isCloseVisible;
  final checkLocalAuth;
  final c = LocalAuthController.con;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<LocalAuthController>(
          initState: (_) => c.initialize(
            isCreatePin: this.isCreatePin,
            isCloseVisible: this.isCloseVisible,
            checkLocalAuth: this.checkLocalAuth,
          ),
          builder: (_) {
            return EmptyReloadingView(
              isLoading: _.loading,
              child: Stack(
                children: <Widget>[
                  Visibility(
                    visible: _.showBack,
                    child: Positioned(
                      top: AppSizes.medium,
                      left: AppSizes.medium,
                      child: CloseButton(),
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Obx(() =>
                            Text(_.header, style: Get.textTheme.headline6)),
                        AppUiHelpers.vSpaceExtraLarge,
                        Numpad(),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class Numpad extends StatelessWidget {
  final c = LocalAuthController.con;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Obx(() => Preview(text: c.pinValue, length: c.fieldsCount)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              NumpadButton(
                text: '1',
                onPressed: () => c.setValue('1'),
              ),
              NumpadButton(
                text: '2',
                onPressed: () => c.setValue('2'),
              ),
              NumpadButton(
                text: '3',
                onPressed: () => c.setValue('2'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              NumpadButton(
                text: '4',
                onPressed: () => c.setValue('4'),
              ),
              NumpadButton(
                text: '5',
                onPressed: () => c.setValue('5'),
              ),
              NumpadButton(
                text: '6',
                onPressed: () => c.setValue('6'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              NumpadButton(
                text: '7',
                onPressed: () => c.setValue('7'),
              ),
              NumpadButton(
                text: '8',
                onPressed: () => c.setValue('8'),
              ),
              NumpadButton(
                text: '9',
                onPressed: () => c.setValue('9'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              NumpadButton(
                haveBorder: false,
                icon: c.showLocalAuth ? Icons.fingerprint : null,
                onPressed:
                    c.showLocalAuth ? () => c.tryToggleLocalAuth() : null,
              ),
              NumpadButton(
                text: '0',
                onPressed: () => c.setValue('0'),
              ),
              NumpadButton(
                haveBorder: false,
                icon: Icons.backspace,
                onPressed: () => c.backspace(),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Preview extends StatelessWidget {
  final int length;
  final String text;
  const Preview({Key key, this.length, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> previewLength = [];
    for (var i = 0; i < length; i++) {
      previewLength.add(Dot(isActive: text.length >= i + 1));
    }
    return Container(
        padding: EdgeInsets.symmetric(vertical: AppSizes.medium),
        child: Wrap(children: previewLength));
  }
}

class Dot extends StatelessWidget {
  final bool isActive;
  const Dot({Key key, this.isActive = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Container(
        width: 15.0,
        height: 15.0,
        decoration: BoxDecoration(
          color: isActive ? AppColors.dark : Colors.transparent,
          border: Border.all(width: 1.0, color: AppColors.dark),
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}

class NumpadButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool haveBorder;
  final Function onPressed;
  const NumpadButton({
    Key key,
    this.text,
    this.icon,
    this.haveBorder = true,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle buttonStyle = TextStyle(fontSize: 22.0, color: AppColors.dark);
    Widget label = icon != null
        ? Icon(
            icon,
            color: AppColors.dark.withOpacity(0.8),
            size: 35.0,
          )
        : Text(this.text ?? '', style: buttonStyle);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSizes.small),
      child: OutlineButton(
        borderSide: haveBorder
            ? BorderSide(color: AppColors.secondary.withOpacity(0.3))
            : BorderSide.none,
        highlightedBorderColor:
            icon != null ? Colors.transparent : AppColors.dark.withOpacity(0.3),
        splashColor:
            icon != null ? Colors.transparent : AppColors.dark.withOpacity(0.1),
        padding: EdgeInsets.all(AppSizes.large),
        shape: CircleBorder(),
        onPressed: onPressed,
        child: label,
      ),
    );
  }
}
