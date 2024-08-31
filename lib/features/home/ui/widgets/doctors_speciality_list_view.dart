import 'package:advanced_complete_course/features/home/data/models/specializations_response_model.dart';
import 'package:advanced_complete_course/features/home/ui/widgets/doctor_specialty_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsSpecialityListView extends StatelessWidget {
  const DoctorsSpecialityListView(
      {super.key, required this.specializationDataList});
  final List<SpecializationsData?> specializationDataList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: specializationDataList.length,
        itemBuilder: (context, index) {
          return DoctorsSpecialityListViewItem(
            itemIndex: index,
            specializationsData: specializationDataList[index],
          );
        },
      ),
    );
  }
}
