import 'package:sanity_client/client.dart';

String urlForDocument(
  String documentRefId, {
  required SanityClient client,
}) {
  var parts = documentRefId.split('-');
  var id = parts[1];
  var format = parts[2];

  final path = '${client.projectId}/${client.dataset}/$id.$format';

  return 'https://cdn.sanity.io/files/$path';
}
