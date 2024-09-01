import 'package:advanced_complete_course/features/home/data/models/specializations_response_model.dart';
import 'package:advanced_complete_course/features/home/logic/cubit/home_cubit.dart';
import 'package:advanced_complete_course/features/home/ui/widgets/specializations_list/specialty_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialityListView extends StatefulWidget {
  const SpecialityListView({super.key, required this.specializationDataList});
  final List<SpecializationsData?> specializationDataList;

  @override
  State<SpecialityListView> createState() => _SpecialityListViewState();
}

class _SpecialityListViewState extends State<SpecialityListView> {
  var selectedSpecializationIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.specializationDataList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedSpecializationIndex = index;
              });
              context.read<HomeCubit>().getDoctorsList(
                  specializationId: widget.specializationDataList[index]?.id);
            },
            child: SpecialityListViewItem(
              itemIndex: index,
              specializationsData: widget.specializationDataList[index],
              selectedIndex: selectedSpecializationIndex,
            ),
          );
        },
      ),
    );
  }
}
