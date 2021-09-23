import 'dart:io';
import 'dart:convert';

main(List<String> arguments) {
  File file = File("sample.json");
  String data = '';
  data = file.readAsStringSync();

  //Original Data
  List<int> original = utf8.encode(data);

  //Compress data
  List<int> compressed = gzip.encode(original);

  //Decompress
  List<int> decompress = gzip.decode(compressed);

  print('Original ${original.length} bytes');
  print('Compressed ${compressed.length} bytes');
  print('Decompressed ${decompress.length} bytes');

  String decoded = utf8.decode(decompress);
  assert(data == decoded);
}
