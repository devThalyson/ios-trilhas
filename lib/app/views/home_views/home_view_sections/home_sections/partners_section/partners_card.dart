import 'package:app_trilhas/app/models/partner.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_alerts/custom_external_page_alert.dart';
import 'package:app_trilhas/shared/custom_widgets/custom_decoration_properties/custom_box_shadow.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class PartnersCard extends StatelessWidget {
  final Partner partner;

  PartnersCard(this.partner);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (partner.url != null) {
          CustomExternalPageAlert(
            function: () async {
              await launch(partner.url!);
            },
          ).showDialog(context);
        }
      },
      child: Container(
        width: 100.w,
        height: 23.h,
        margin: EdgeInsets.only(
          bottom: 2.94.h,
        ),
        decoration: BoxDecoration(
          boxShadow: [
            CustomBoxShadow(opacity: 0.16),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            10,
          ),
          child: CachedNetworkImage(
            imageUrl: partner.image!,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
