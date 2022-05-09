
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
class Gridviewacceuil extends StatefulWidget {
  const Gridviewacceuil({Key? key}) : super(key: key);
  @override
  State<Gridviewacceuil> createState() => _GridviewacceuilState();
}
class _GridviewacceuilState extends State<Gridviewacceuil> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
        StaggeredGrid.count(
           crossAxisCount: 2,
           crossAxisSpacing: 10,
           mainAxisSpacing: 12,
           )
        ],
      ),


    );
  }
}
