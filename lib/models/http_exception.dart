class HttpException implements Exception
{
  final String message;
  HttpException(this.message);

  @override
  String toSring()
  {
    return message;
  }
}