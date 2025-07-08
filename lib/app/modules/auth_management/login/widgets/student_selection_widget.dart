// lib/app/modules/auth_management/login/widgets/student_selection_widget.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/variables/colors.dart';
import '../../../../models/student/student_model.dart';
import '../../../common/widgets/card/custom_card.dart';
import '../../../common/widgets/texts/custom_text.dart';

class StudentSelectionWidget extends StatelessWidget {
  final List<Student> students;
  final Student? selectedStudent;
  final Function(Student) onStudentSelected;

  const StudentSelectionWidget({Key? key, required this.students, required this.selectedStudent, required this.onStudentSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (students.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.school_outlined, size: Utils.extraHighIconSize * 2, color: ColorTable.getTextColor.withOpacity(0.3)),
            SizedBox(height: Utils.normalPadding),
            CustomText("Bu hesaba bağlı öğrenci bulunamadı", centerText: true, textColor: ColorTable.getTextColor.withOpacity(0.6)),
          ],
        ),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      itemCount: students.length,
      separatorBuilder: (context, index) => SizedBox(height: Utils.normalPadding),
      itemBuilder: (context, index) {
        final student = students[index];
        final isSelected = selectedStudent?.id == student.id;

        return CustomCard(
          onTap: () => onStudentSelected(student),
          backgroundColor: isSelected ? Get.theme.primaryColor.withOpacity(0.1) : Colors.white,
          elevation: isSelected ? 8 : 2,
          child: Container(
            decoration: BoxDecoration(
              border: isSelected ? Border.all(color: Get.theme.primaryColor, width: 2) : null,
              borderRadius: BorderRadius.circular(Utils.lowRadius),
            ),
            child: Padding(
              padding: EdgeInsets.all(Utils.normalPadding),
              child: Row(
                children: [
                  // Avatar
                  CircleAvatar(
                    radius: Utils.highIconSize,
                    backgroundColor: Get.theme.primaryColorLight,
                    backgroundImage: student.avatar.isNotEmpty ? NetworkImage(student.avatar) : null,
                    child: student.avatar.isEmpty ? Icon(Icons.person, color: Get.theme.primaryColor, size: Utils.normalIconSize) : null,
                  ),
                  SizedBox(width: Utils.normalPadding),

                  // Student Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText.high(student.name, bold: true, textColor: isSelected ? Get.theme.primaryColor : ColorTable.getTextColor),
                        SizedBox(height: Utils.extraLowPadding),
                        CustomText("Okul No: ${student.schoolNumber}", textColor: ColorTable.getTextColor.withOpacity(0.7)),
                        if (student.studentPhone != null)
                          CustomText("Tel: ${student.studentPhone}", textColor: ColorTable.getTextColor.withOpacity(0.7)),
                      ],
                    ),
                  ),

                  // Selection Indicator
                  if (isSelected)
                    Container(
                      padding: EdgeInsets.all(Utils.extraLowPadding),
                      decoration: BoxDecoration(color: Get.theme.primaryColor, shape: BoxShape.circle),
                      child: Icon(Icons.check, color: Colors.white, size: Utils.normalIconSize),
                    )
                  else
                    Container(
                      padding: EdgeInsets.all(Utils.extraLowPadding),
                      decoration: BoxDecoration(
                        border: Border.all(color: ColorTable.getTextColor.withOpacity(0.3)),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.circle_outlined, color: ColorTable.getTextColor.withOpacity(0.3), size: Utils.normalIconSize),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
