import 'package:lawyer_app/src/constants.dart';
import 'package:lawyer_app/src/models/MyDefinitionFiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class FieldInfoCard extends StatelessWidget {
  const FieldInfoCard({
    Key ?key,
    required this.info,
  }) : super(key: key);
  final DefinitonEntityInfo info;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(defaultPadding * .5),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: info.color?.withOpacity(.1),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: SvgPicture.asset(
                  info.svgSrc!,
                  color: info.color,
                ),
              ),
              Icon(
                Icons.more_vert,
                color: Colors.white54,
              )
            ],
          ),
          Text(
            info.title!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          
        ],
      ),
    );
  }
}

class ProgressLine extends StatelessWidget {
  const ProgressLine({
    Key ?key,
    this.color = primaryColor,
    required this.prercentage,
  }) : super(key: key);

  final Color color;
  final int prercentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
              color: color.withOpacity(.1),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        LayoutBuilder(
            builder: ((context, constraints) => Container(
                  width: constraints.maxWidth * prercentage / 100,
                  height: 5,
                  decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                )))
      ],
    );
  }
}

