import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.color});
  final bool isActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            radius: 35,
            backgroundColor: Colors.black,
            child: CircleAvatar(
              backgroundColor: color,
              radius: 32,
            ),
          )
        : CircleAvatar(
            backgroundColor: color,
            radius: 35,
          );
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex = 0;
  List<Color> color = const [
    Color(0xff96ADC8),
    Color(0xffD7FFAB),
    Color(0xffFCFF6C),
    Color(0xffD89D6A),
    Color(0xff6D454C)
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35 * 2,
      child: ListView.builder(
        itemCount: color.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                BlocProvider.of<AddNoteCubit>(context).color = color[index];
                setState(() {});
              },
              child: ColorItem(
                color: color[index],
                isActive: currentIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}
