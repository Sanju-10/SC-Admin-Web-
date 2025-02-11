class DroppedFile {
  final String url;
  final String name;
  final String mime;
  final int bytes;

  DroppedFile({this.url, this.name, this.mime, this.bytes});

  String get size{
    final kb=bytes/1024;
    final mb=kb/1024;

    return mb>1?'${mb.toStringAsFixed(2)} MB':'${kb.toStringAsFixed(2)} KB';
  }
}
