import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:void_01/src/env/models/manga/mangapage/mangapage_controller.dart';
import 'package:void_01/src/env/models/manga/widget/animated_detail_header/animated_detail_header.dart';
import 'package:void_01/src/env/models/manga/widget/sliverheader/sliver_header_prod.dart';

//

class MangaPage extends GetView<MangaPageController> {
  final String title, desc, image;
  const MangaPage(
      {Key? key, required this.title, required this.image, required this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: _customScrollView2(
          desc: desc, title: title, image: image, context: context),
    );
  }
}

//--------------------------------------------------------------------//

Widget _customScrollView2({desc, title, image, context}) => CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverPersistentHeader(
          pinned: true,
          delegate: SliverHeaderenv(
            // maxExtend: MediaQuery.of(context).size.height,
            maxExtend: 420,
            mixExtend: 160,
            builder: (percent) {
              return AnimatedDetailHeader(
                title: title,
                imageURL: image,
                percent: percent,
                descricao: desc,
              );
            },
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 50),
        ),
        _boxAdapter()
      ],
    );

//--------------------------------------------------------------------//

Widget _boxAdapter() => SliverToBoxAdapter(
      child: ListView.separated(
        padding: const EdgeInsets.only(
          top: 0,
        ),
        separatorBuilder: (context, index) => const Divider(
          height: 0.0,
          color: Color(0x00181818),
        ),
        itemCount: 20,
        primary: false,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, index) {
          return Stack(
            children: [
              Divider(
                height: 0.0,
                color: Theme.of(context).colorScheme.surfaceVariant,
              ),
              ListTile(
                onTap: () {
                  if (kDebugMode) {
                    print("asdasdas");
                  }
                },
                title: const Text(
                  "asdasdasdasd",
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          );
        },
      ),
    );
