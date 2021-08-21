import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training/app/modules/library/controllers/library_controller.dart';

class LibraryView extends GetView<LibraryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Library'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: controller.onBack,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 8.0, right: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchWidget(height: 40),
            const SizedBox(
              height: 8.0,
            ),
            Obx(() {
              return Text(
                'Kết quả tìm kiếm (${controller.listLibrary.length})',
                style: const TextStyle(fontSize: 10.0),
              );
            }),
            const SizedBox(
              height: 8.0,
            ),
            Expanded(
              child: LibraryWidget(),
            )
          ],
        ),
      ),
    );
  }

  Widget SearchWidget({double height = 18}) {
    return Container(
      height: height,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          TextField(
            onChanged: controller.onSearchChanged,
            controller: controller.textController.value,
            style: const TextStyle(fontSize: 12.0),
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.only(
                right: 44.0,
                left: 16.0,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1.5,
                ),
              ),
            ),
          ),
          IconButton(
            splashRadius: height / 2.5,
            iconSize: 16.0,
            icon: const Icon(Icons.close),
            onPressed: controller.onRemoveSearch,
          )
        ],
      ),
    );
  }

  Widget LibraryWidget() {
    return Obx(
      () {
        return ListView.builder(
          itemCount: controller.listLibrary.length,
          itemBuilder: (context, index) {
            return Obx(
              () {
                return ItemLibrary(
                  shortContent: controller.listLibrary[index].shortContent,
                  image: controller.listLibrary[index].image,
                  textSearch: controller.textController.value.text,
                );
              },
            );
          },
        );
      },
    );
  }
}

class ItemLibrary extends StatelessWidget {
  final String image;
  final String shortContent;
  final String textSearch;
  const ItemLibrary(
      {required this.image,
      required this.shortContent,
      required this.textSearch});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: const BorderRadius.all(Radius.circular(4.0))),
            width: 50,
            height: 70,
            child: Image.network(
              image,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Text(
                  //   shortContent,
                  //   maxLines: 3,
                  //   textAlign: TextAlign.justify,
                  //   style: const TextStyle(fontSize: 11.0),
                  // ),

                  RichText(
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                    maxLines: 3,
                    text: TextSpan(
                      children: highlightOccurrences(shortContent, textSearch),
                      style:
                          const TextStyle(fontSize: 11.0, color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.folder_open,
                        color: Colors.grey,
                        size: 16.0,
                      ),
                      SizedBox(
                        width: 4.0,
                      ),
                      Text(
                        'BCTC-2',
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  List<TextSpan> highlightOccurrences(String source, String? query) {
    if (query == null ||
        query.isEmpty ||
        !source.toLowerCase().contains(query.toLowerCase())) {
      print('no filter');
      return [TextSpan(text: source)];
    }
    final matches = query.toLowerCase().allMatches(source.toLowerCase());
    print(matches.length.toString());
    var lastMatchEnd = 0;

    final children = <TextSpan>[];
    print(
        '-----------------------matches.length: ${matches.length}--------------------------');
    for (var i = 0; i < matches.length; i++) {
      print('--------------------Filter-----------------------------');
      final match = matches.elementAt(i);

      if (match.start != lastMatchEnd) {
        children.add(TextSpan(
          text: source.substring(lastMatchEnd, match.start),
        ));
      }
      print('match.start: ${match.start} - match.end: ${match.end}');
      children.add(TextSpan(
        text: source.substring(match.start, match.end),
        style: const TextStyle(
            fontSize: 11.0, color: Colors.black, backgroundColor: Colors.amber),
      ));

      if (i == matches.length - 1 && match.end != source.length) {
        children.add(TextSpan(
          text: source.substring(match.end, source.length),
        ));
      }

      lastMatchEnd = match.end;
    }
    return children;
  }
}
