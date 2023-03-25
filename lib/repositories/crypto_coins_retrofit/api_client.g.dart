// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoCompareResponse _$CryptoCompareResponseFromJson(
        Map<String, dynamic> json) =>
    CryptoCompareResponse(
      coins: (json['RAW'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k,
            (e as Map<String, dynamic>).map(
              (k, e) => MapEntry(k, Coin.fromJson(e as Map<String, dynamic>)),
            )),
      ),
    );

Map<String, dynamic> _$CryptoCompareResponseToJson(
        CryptoCompareResponse instance) =>
    <String, dynamic>{
      'RAW': instance.coins,
    };

Coin _$CoinFromJson(Map<String, dynamic> json) => Coin(
      price: (json['PRICE'] as num).toDouble(),
      imageUrl: json['IMAGEURL'] as String,
    );

Map<String, dynamic> _$CoinToJson(Coin instance) => <String, dynamic>{
      'PRICE': instance.price,
      'IMAGEURL': instance.imageUrl,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _ApiClient implements ApiClient {
  _ApiClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://min-api.cryptocompare.com/data';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<CryptoCompareResponse> getPrice(
    fromSymbol,
    toSymbol,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'fsyms': fromSymbol,
      r'tsyms': toSymbol,
    };
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CryptoCompareResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/pricemultifull',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CryptoCompareResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
