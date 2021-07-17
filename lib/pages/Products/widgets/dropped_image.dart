import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/pages/Products/widgets/dropped_file.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';

class DroppedFileWidget extends StatelessWidget {
  final DroppedFile file;
  const DroppedFileWidget({Key key, this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _width=MediaQuery.of(context).size.width;
    final _height=MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildImage(),
        // if (file != null) buildFileDetails(file,_width*.3),
      ],
    );
  }

  Widget buildImage() {
    if (file == null) return buildEmptyFile('No File');

    return Image.network(
      file.url,
      width: 240,
      height: 240,
      fit: BoxFit.contain,
      errorBuilder: (context, error, _) => buildEmptyFile("No Preview"),
    );
  }

  Widget buildEmptyFile(String text) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue.shade300
        ),
        width: 240,
        height: 240,
        child: Center(
          child: CustomText(
            text: text,
            color: light,
          ),
        ),
      );

  Widget buildFileDetails(DroppedFile file,double width) {
    final style = TextStyle(fontSize: 15);

    return Container(
      margin: EdgeInsets.only(left: 10),
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            file.name,
            style: style.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            file.mime,
            style: style,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            file.size,
            style: style,
          )
        ],
      ),
    );
  }
}
