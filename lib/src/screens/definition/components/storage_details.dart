import 'package:lawyer_app/src/constants/constants_item.dart';
import 'package:lawyer_app/src/screens/dashbord/components/chart.dart';
import 'package:lawyer_app/src/screens/dashbord/components/storage_info_card.dart';
import 'package:flutter/material.dart';

class StorageDetails extends StatelessWidget {
  const StorageDetails({
    Key ?key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
     // height: 500,
      decoration: const BoxDecoration(
          color: secondaryColor,
          borderRadius:
              BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Storage deatial",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: defaultPadding,
          ),
          Chart(),
          StorageInfoCard(
            svgSrc: "assets/icons/Documents.svg",
            title: "Documents Files",
            amountOfFiles: "1.3GB",
            numOfFiles: 1328,
          ),
          StorageInfoCard(
            svgSrc: "assets/icons/media.svg",
            title: "Media Files",
            amountOfFiles: "15GB",
            numOfFiles: 1328,
          ),
          StorageInfoCard(
            svgSrc: "assets/icons/folder.svg",
            title: "Other Files",
            amountOfFiles: "15GB",
            numOfFiles: 1328,
          ),
          StorageInfoCard(
            svgSrc: "assets/icons/unknown.svg",
            title: "Unknown",
            amountOfFiles: "15GB",
            numOfFiles: 1328,
          )
        ],
      ),
    );
  }
}
