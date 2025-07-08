// lib/app/modules/auth_management/login/login_view.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:okulum_app/core/utils/getx_extensions.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/variables/colors.dart';
import '../../../../generated/locales.g.dart';
import '../../common/widgets/buttons/custom_elevated_button.dart';
import '../../common/widgets/other/custom_checkbox.dart';
import '../../common/widgets/other/custom_scaffold.dart';
import '../../common/widgets/textfield/custom_text_form_field.dart';
import '../../common/widgets/texts/custom_text.dart';
import 'login_controller.dart';
import 'widgets/student_selection_widget.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: Get.theme.primaryColorLight,
      bodyPadding: EdgeInsets.zero,
      body: SingleChildScrollView(
        child: SizedBox(
          height: Get.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: Utils.extraHighPadding),
              Expanded(child: logoSide),
              borderedBoxSide(),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox borderedBoxSide() {
    return SizedBox(
      height: Get.height * 0.7,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(Utils.extraHighRadius)),
          color: ColorTable.getReversedTextColor,
          boxShadow: [BoxShadow(color: Get.theme.primaryColor, blurRadius: Utils.extraLowRadius, spreadRadius: 1)],
        ),
        child: loginFormAndButtonSide(),
      ),
    );
  }

  Padding loginFormAndButtonSide() {
    return Padding(
      padding: EdgeInsets.all(Utils.normalPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: formSide()),
          bottomButtonSection(),
        ],
      ),
    );
  }

  Widget get logoSide => Image(image: const AssetImage(AppConstants.logoPath), color: Get.theme.primaryColor);

  Widget formSide() {
    return Obx(() {
      switch (controller.currentStep) {
        case LoginStep.Phone:
          return phoneStepForm();
        case LoginStep.Password:
          return passwordStepForm();
        case LoginStep.Student:
          return studentStepForm();
        default:
          return phoneStepForm();
      }
    });
  }

  Widget phoneStepForm() {
    return Form(
      key: controller.phoneFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: Utils.extraHighPadding),
          CustomText.extraHigh("Telefon Numaranızı Giriniz", bold: true, centerText: true),
          SizedBox(height: Utils.normalPadding),
          CustomText("Giriş yapmak için telefon numaranızı giriniz", centerText: true, textColor: ColorTable.getTextColor.withOpacity(0.6)),
          SizedBox(height: Utils.extraHighPadding),
          phoneField(),
          SizedBox(height: Utils.extraHighPadding),
          rememberMeCheckbox(),
          SizedBox(height: Utils.extraHighPadding * 2),
        ],
      ),
    );
  }

  Widget passwordStepForm() {
    return Form(
      key: controller.passwordFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: Utils.extraHighPadding),
          CustomText.extraHigh("Şifrenizi Giriniz", bold: true, centerText: true),
          SizedBox(height: Utils.normalPadding),
          CustomText(
            controller.loginMessage.isNotEmpty ? controller.loginMessage : "Giriş yapmak için şifrenizi giriniz",
            centerText: true,
            textColor: ColorTable.getTextColor.withOpacity(0.6),
          ),
          SizedBox(height: Utils.extraHighPadding),
          passwordField(),
          SizedBox(height: Utils.normalPadding),
          forgotPasswordButton(),
          SizedBox(height: Utils.extraHighPadding * 2),
        ],
      ),
    );
  }

  Widget studentStepForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: Utils.extraHighPadding),
        CustomText.extraHigh("Öğrenci Seçiniz", bold: true, centerText: true),
        SizedBox(height: Utils.normalPadding),
        CustomText("Devam etmek için bir öğrenci seçiniz", centerText: true, textColor: ColorTable.getTextColor.withOpacity(0.6)),
        SizedBox(height: Utils.extraHighPadding),
        Expanded(
          child: StudentSelectionWidget(
            students: controller.availableStudents,
            selectedStudent: controller.selectedStudent,
            onStudentSelected: controller.selectStudent,
          ),
        ),
        SizedBox(height: Utils.extraHighPadding),
      ],
    );
  }

  Widget bottomButtonSection() {
    return Obx(() {
      return Column(
        children: [
          if (controller.currentStep != LoginStep.Phone) backButton(),
          if (controller.currentStep != LoginStep.Phone) SizedBox(height: Utils.normalPadding),
          mainActionButton(),
          SizedBox(height: Utils.extraHighPadding),
        ],
      );
    });
  }

  Widget mainActionButton() {
    return Obx(() {
      String buttonText;
      VoidCallback? onPressed;

      switch (controller.currentStep) {
        case LoginStep.Phone:
          buttonText = "Devam Et";
          onPressed = controller.phoneLogin;
          break;
        case LoginStep.Password:
          buttonText = "Giriş Yap";
          onPressed = controller.passwordLogin;
          break;
        case LoginStep.Student:
          buttonText = "Öğrenci Seç ve Giriş Yap";
          onPressed = controller.selectedStudent != null ? controller.studentLogin : null;
          break;
      }

      return CustomElevatedButton(
        minimumWith: Get.width,
        borderRadius: Utils.normalRadius,
        backgroundColor: onPressed != null ? Get.theme.primaryColor : ColorTable.getTextColor.withOpacity(0.3),
        onPressed: onPressed,
        child: CustomText.high(buttonText, bold: true, textColor: ColorTable.getReversedTextColor),
      );
    });
  }

  Widget backButton() {
    return CustomElevatedButton(
      minimumWith: Get.width,
      borderRadius: Utils.normalRadius,
      backgroundColor: Colors.transparent,
      borderColor: Get.theme.primaryColor,
      onPressed: controller.goBack,
      child: CustomText.high("Geri", bold: true, textColor: Get.theme.primaryColor),
    );
  }

  Widget rememberMeCheckbox() {
    return Obx(() {
      if (controller.currentStep != LoginStep.Phone) return const SizedBox.shrink();

      return InkWell(
        onTap: () => controller.rememberMe = !controller.rememberMe,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomCheckBox(value: controller.rememberMe, onChanged: (val) => controller.rememberMe = val ?? false),
            SizedBox(width: Utils.lowPadding),
            CustomText("Beni Hatırla"),
          ],
        ),
      );
    });
  }

  Widget forgotPasswordButton() {
    return InkWell(
      onTap: () {
        Get.showAwesomeDialog(
          title: "Bilgi",
          subtitle: "Şifrenizi unuttuysanız, lütfen okul yönetimiyle iletişime geçiniz.",
          disableBtnCancel: true,
          btnOkText: "Tamam",
        );
      },
      child: CustomText("Şifremi Unuttum", textColor: Get.theme.primaryColor, underlined: true),
    );
  }

  CustomTextFormField phoneField() {
    return CustomTextFormField(
      label: "Telefon Numarası",
      hintText: "Telefon numaranızı giriniz",
      keyboardType: TextInputType.phone,
      onSaved: (value) => controller.phone = value ?? "",
      isRequired: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Telefon numarası boş bırakılamaz";
        }
        if (value.length < 10) {
          return "Geçerli bir telefon numarası giriniz";
        }
        return null;
      },
    );
  }

  CustomTextFormField passwordField() {
    return CustomTextFormField(
      label: "Şifre",
      hintText: "Şifrenizi giriniz",
      onSaved: (value) => controller.password = value ?? "",
      obscureText: true,
      isRequired: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Şifre boş bırakılamaz";
        }
        if (value.length < 6) {
          return "Şifre en az 6 karakter olmalıdır";
        }
        return null;
      },
    );
  }
}
