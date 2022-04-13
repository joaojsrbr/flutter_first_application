// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors

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
    return Material(
      child: CustomScrollView2(
          desc: widget.desc,
          title: widget.title!,
          image: widget.image!,
          context: context),
    );
  }
}

Widget CustomScrollView2({desc, title, image, context}) {
  return CustomScrollView(
    physics: BouncingScrollPhysics(),
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

Widget _BoxAdapter({backgroundColor}) => SliverToBoxAdapter(
      child: ListView.separated(
        padding: EdgeInsets.only(
          top: 0,
        ),
        separatorBuilder: (context, index) => const Divider(
          height: 0.0,
          color: Color(0x00181818),
        ),
        itemCount: 20,
        primary: false,
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, index) {
          return Stack(
            children: [
              Divider(
                height: 0.0,
                color: backgroundColor,
              ),
              ListTile(
                onTap: () {
                  print("asdasdas");
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

// Widget CustomScrollView1({desc, title, image}) {
//   return CustomScrollView(
//     physics: BouncingScrollPhysics(),
//     slivers: <Widget>[
//       SliverAppBar(
//         pinned: true,
//         primary: true,
//         floating: true,
//         snap: true,
//       ),
//       _HeaderOne(
//         desc: desc,
//         title: title!,
//         image: image,
//       ),
//       _BoxAdapter(backgroundColor: _backgroundColor),
//     ],
//   );
// }

// Widget _HeaderOne({title, desc, image}) => SliverPersistentHeader(
//       floating: false,
//       pinned: true,
//       delegate: SliverHeader(
//         title: title,
//         desc: desc,
//         maxHeight: 290.0,
//         minHeight: 82.0,
//         image: image,
//       ),
//     );

// Widget _builderHeader(
//     {String? title,
//     double maxHeight = 30,
//     double minHeight = 30,
//     Color color = Colors.white}) {
//   return SliverPersistentHeader(
//     pinned: true,
//     floating: true,
//     delegate: SliverHeader(
//       maxHeight: maxHeight,
//       minHeight: minHeight,
//       child: Container(
//         color: color,
//         child: Text(title!),
//       ),
//     ),
//   );
// }
