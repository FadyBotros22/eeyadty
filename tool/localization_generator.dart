import 'dart:convert';
import 'dart:io';
import 'dart:core';

/// Converts snake_case to camelCase
String toCamelCase(String text) {
  final words = text.split('_');
  return words.asMap().entries.map((entry) {
    final index = entry.key;
    final word = entry.value;

    if (index == 0) {
      return word.toLowerCase();
    } else {
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }
  }).join();
}

void main() {
  // Directory where localization JSON files are stored
  final localizationDir = Directory('assets/translations');

  // Check if the directory exists
  if (!localizationDir.existsSync()) {
    print('Localization directory not found: ${localizationDir.path}');
    return;
  }

  // Filter for JSON files in the localization directory
  final jsonFiles = localizationDir
      .listSync()
      .whereType<File>()
      .where((file) => file.path.endsWith('.json'))
      .toList();

  // Check if any JSON files were found
  if (jsonFiles.isEmpty) {
    print('No JSON files found in: ${localizationDir.path}');
    return;
  }

  // Read the first JSON file (as an example)
  final firstJson =
      json.decode(jsonFiles.first.readAsStringSync()) as Map<String, dynamic>;
  final keys = firstJson.keys.toList();

  // Directory where generated Dart file will be saved
  final outputDir = Directory('lib/gen');

  // Name of the generated Dart file
  final outputFile = File('${outputDir.path}/locale_keys.g.dart');

  // Create the buffer for writing the generated Dart code
  final buffer = StringBuffer();
  buffer.writeln('// GENERATED CODE - DO NOT MODIFY BY HAND');
  buffer.writeln('abstract class LocaleKeys {');
  for (var key in keys) {
    final camelCaseKey = toCamelCase(key);
    buffer.writeln("  static const String $camelCaseKey = '$key';");
  }
  buffer.writeln('}');

  // Ensure the output directory exists
  if (!outputDir.existsSync()) {
    outputDir.createSync(recursive: true);
  }

  // Write the generated Dart code to the file
  outputFile.writeAsStringSync(buffer.toString());

  print('Localization keys generated successfully at ${outputFile.path}');
}
