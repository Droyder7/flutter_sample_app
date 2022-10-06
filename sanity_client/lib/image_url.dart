import 'package:sanity_client/client.dart';

String urlFor(
  String imageRefId, {
  required SanityClient client,
  int? width,
  int? height,
  int? devicePixelRatio,
}) {
  final ref = ParsedReference.from(imageRefId);

  final path =
      '${client.projectId}/${client.dataset}/${ref.id}-${ref.width}x${ref.height}.${ref.format}';

  final query = [
    if (width != null) 'w=$width',
    if (height != null) 'h=$height',
    if (devicePixelRatio != null) 'dpr=$devicePixelRatio',
    'auto=format', // force the webp format
  ].join('&');

  return 'https://cdn.sanity.io/images/$path?$query';
}

class ParsedReference {
  final String id;
  final int width;
  final int height;
  final String format;

  // example refId: image-Tb9Ew8CXIwaY6R1kjMvI0uRR-2000x3000-jpg
  factory ParsedReference.from(String refId) {
    var parts = refId.split('-');
    var id = parts[1];
    var dimensions = parts[2].split('x');
    var format = parts[3];

    var width = int.parse(dimensions[0], radix: 10);
    var height = int.parse(dimensions[1], radix: 10);

    return ParsedReference._(id, width, height, format);
  }

  ParsedReference._(this.id, this.width, this.height, this.format);
}
