import 'package:flutter/material.dart';
import 'package:woow_social/features/home/tabs/foryou/components/foryou_video_player.dart';

class HomeTabForYou extends StatelessWidget {
  HomeTabForYou({Key? key}) : super(key: key);

  var arrVideo = [
    "https://id69encw0mrn.objectstorage.us-ashburn-1.oci.customer-oci.com/p/5ORnvjecuaz8BfAXeNzvLCnmqhzZNzcnv5JJQNvfqarqxojbazoTY22Gffz778fT/n/id69encw0mrn/b/woow/o/video/62effa796c9692435black_optimize.mp4",
    "https://id69encw0mrn.objectstorage.us-ashburn-1.oci.customer-oci.com/p/P5Qebq_HPk9ujjEuebQ8vxbR2XQbS4yN7eN6G1cqDdgvw4mjfgZLJLvgytCDGM1b/n/id69encw0mrn/b/woow/o/video/63062c926ddd242black_optimize.mp4",
    "https://id69encw0mrn.objectstorage.us-ashburn-1.oci.customer-oci.com/p/A4rB8cxswCscnHh3P2usdGcN7jd7DP-iUnFp-l1Uv0sxjnN8QcJRiCdaVu0S5nRF/n/id69encw0mrn/b/woow/o/video/633b9f50122592479black_optimize.mp4"
  ];

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: arrVideo.length,
      itemBuilder: (context, index) {
        return ForyouVideoPlayerView(videoUrl: arrVideo[index]);
      },
    );
  }
}
