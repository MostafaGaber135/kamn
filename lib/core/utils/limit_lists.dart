String limitTags(List<String> tags, int maxLength) {
  String result = tags.join(", "); // Convert list to a single string

  if (result.length > maxLength) {
    return result.substring(0, maxLength).replaceFirst(RegExp(r',\s*$'), '') +
        '...';
  }

  return result;
}
