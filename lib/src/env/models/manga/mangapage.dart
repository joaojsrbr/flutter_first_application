// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:void_01/src/env/models/manga/widget/sliverheader/SliverHeader_env.dart';

import 'animated_detail_header.dart';

class MangaPage extends StatefulWidget {
  final String? title, desc;
  final String? image;
  const MangaPage({Key? key, this.title, this.image, this.desc})
      : super(key: key);

  @override
  State<MangaPage> createState() => _ManagaPageState();
}

class _ManagaPageState extends State<MangaPage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: CustomScrollView2(
          desc: widget.desc,
          title: widget.title!,
          image: widget.image!,
          context: context),
    );
  }
}

Widget CustomScrollView2({desc, title, image, context}) {
  return CustomScrollView(
    physics: const BouncingScrollPhysics(),
    slivers: [
      SliverPersistentHeader(
        pinned: true,
        delegate: SliverHeader_env(
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
      _BoxAdapter()
    ],
  );
}

//--------------------------------------------------------------------//

Widget _BoxAdapter() => SliverToBoxAdapter(
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
