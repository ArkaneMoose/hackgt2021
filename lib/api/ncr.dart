import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';

class Ncr {
  static const _ncrSharedKey = '3f18a8c2d1124d70b7edef2ec1f0a207';
  static const _ncrSecretKey = '5d9887501cdc40478c9fff037c0ae0e8';

  static Future<dynamic> get(String url, {Map<String, String>? headers}) async {
    final request = http.Request('GET', Uri.parse(url));
    if (headers != null) {
      headers.forEach((key, value) {
        request.headers[key] = value;
      });
    }
    return _sendApiRequest(request);
  }

  static Future<dynamic> post(String url,
      {Map<String, String>? headers, dynamic body}) async {
    final request = http.Request('POST', Uri.parse(url));
    if (headers != null) {
      headers.forEach((key, value) {
        request.headers[key] = value;
      });
    }
    request.headers['Content-Type'] = 'application/json';
    request.body = json.encode(body);
    return _sendApiRequest(request);
  }

  static Future<dynamic> put(String url,
      {Map<String, String>? headers, dynamic body}) async {
    final request = http.Request('PUT', Uri.parse(url));
    if (headers != null) {
      headers.forEach((key, value) {
        request.headers[key] = value;
      });
    }
    request.headers['Content-Type'] = 'application/json';
    request.body = json.encode(body);
    return _sendApiRequest(request);
  }

  static Future<dynamic> patch(String url,
      {Map<String, String>? headers, dynamic body}) async {
    final request = http.Request('PUT', Uri.parse(url));
    if (headers != null) {
      headers.forEach((key, value) {
        request.headers[key] = value;
      });
    }
    request.headers['Content-Type'] = 'application/json';
    request.body = json.encode(body);
    return _sendApiRequest(request);
  }

  static Future<dynamic> delete(String url,
      {Map<String, String>? headers}) async {
    final request = http.Request('DELETE', Uri.parse(url));
    if (headers != null) {
      headers.forEach((key, value) {
        request.headers[key] = value;
      });
    }
    return _sendApiRequest(request);
  }

  static void _prepareApiRequest(http.Request request) {
    var now = DateTime.now().toUtc();
    now = DateTime.utc(
        now.year, now.month, now.day, now.hour, now.minute, now.second);

    final iso8601 = now.toIso8601String();
    final key = utf8.encode(_ncrSecretKey + iso8601);

    final signable = [
      request.method,
      request.url.path + (request.url.hasQuery ? '?' + request.url.query : ''),
      request.headers['Content-Type'],
      request.headers['Content-MD5'],
      request.headers['nep-application-key'],
      request.headers['nep-correlation-id'],
      request.headers['nep-organization'],
      request.headers['nep-service-version'],
    ].where((element) => element != null).join('\n');
    final message = utf8.encode(signable);
    final hmac = base64.encode(Hmac(sha512, key).convert(message).bytes);

    request.headers['Date'] = HttpDate.format(now);
    request.headers['Authorization'] = 'AccessKey $_ncrSharedKey:$hmac';
    request.headers['Accept'] = 'application/json';
  }

  static Future<http.Response> send(http.Request request) async {
    _prepareApiRequest(request);
    final client = http.Client();
    try {
      final stream = await client.send(request);
      return await http.Response.fromStream(stream);
    } finally {
      client.close();
    }
  }

  static Future<dynamic> _sendApiRequest(http.Request request) async {
    return json.decode((await send(request)).body);
  }
}
