class CoinData {
  MetaData? metaData;
  TimeSeriesDigitalCurrencyDaily? timeSeriesDigitalCurrencyDaily;

  CoinData({this.metaData, this.timeSeriesDigitalCurrencyDaily});

  CoinData.fromJson(Map<String, dynamic> json) {
    metaData = json['Meta Data'] != null
        ? new MetaData.fromJson(json['Meta Data'])
        : null;
    timeSeriesDigitalCurrencyDaily =
        json['Time Series (Digital Currency Daily)'] != null
            ? new TimeSeriesDigitalCurrencyDaily.fromJson(
                json['Time Series (Digital Currency Daily)'])
            : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.metaData != null) {
      data['Meta Data'] = this.metaData!.toJson();
    }
    if (this.timeSeriesDigitalCurrencyDaily != null) {
      data['Time Series (Digital Currency Daily)'] =
          this.timeSeriesDigitalCurrencyDaily!.toJson();
    }
    return data;
  }
}

class MetaData {
  String? s1Information;
  String? s2DigitalCurrencyCode;
  String? s3DigitalCurrencyName;
  String? s4MarketCode;
  String? s5MarketName;
  String? s6LastRefreshed;
  String? s7TimeZone;

  MetaData(
      {this.s1Information,
      this.s2DigitalCurrencyCode,
      this.s3DigitalCurrencyName,
      this.s4MarketCode,
      this.s5MarketName,
      this.s6LastRefreshed,
      this.s7TimeZone});

  MetaData.fromJson(Map<String, dynamic> json) {
    s1Information = json['1. Information'];
    s2DigitalCurrencyCode = json['2. Digital Currency Code'];
    s3DigitalCurrencyName = json['3. Digital Currency Name'];
    s4MarketCode = json['4. Market Code'];
    s5MarketName = json['5. Market Name'];
    s6LastRefreshed = json['6. Last Refreshed'];
    s7TimeZone = json['7. Time Zone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['1. Information'] = this.s1Information;
    data['2. Digital Currency Code'] = this.s2DigitalCurrencyCode;
    data['3. Digital Currency Name'] = this.s3DigitalCurrencyName;
    data['4. Market Code'] = this.s4MarketCode;
    data['5. Market Name'] = this.s5MarketName;
    data['6. Last Refreshed'] = this.s6LastRefreshed;
    data['7. Time Zone'] = this.s7TimeZone;
    return data;
  }
}

class TimeSeriesDigitalCurrencyDaily {
  CyriptoData? cyriptoData;

  TimeSeriesDigitalCurrencyDaily({this.cyriptoData});

  TimeSeriesDigitalCurrencyDaily.fromJson(Map<String, dynamic> json) {
    cyriptoData = json['2023-06-13'] != null
        ? new CyriptoData.fromJson(json['2023-06-13'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cyriptoData != null) {
      data['2023-06-13'] = this.cyriptoData!.toJson();
    }
    return data;
  }
}

class CyriptoData {
  String? s1aOpenUSD;
  String? s1bOpenUSD;
  String? s2aHighUSD;
  String? s2bHighUSD;
  String? s3aLowUSD;
  String? s3bLowUSD;
  String? s4aCloseUSD;
  String? s4bCloseUSD;
  String? s5Volume;
  String? s6MarketCapUSD;

  CyriptoData(
      {this.s1aOpenUSD,
      this.s1bOpenUSD,
      this.s2aHighUSD,
      this.s2bHighUSD,
      this.s3aLowUSD,
      this.s3bLowUSD,
      this.s4aCloseUSD,
      this.s4bCloseUSD,
      this.s5Volume,
      this.s6MarketCapUSD});

  CyriptoData.fromJson(Map<String, dynamic> json) {
    s1aOpenUSD = json['1a. open (EUR)'];
    s1bOpenUSD = json['1b. open (USD)'];
    s2aHighUSD = json['2a. high (EUR)'];
    s2bHighUSD = json['2b. high (USD)'];
    s3aLowUSD = json['3a. low (EUR)'];
    s3bLowUSD = json['3b. low (USD)'];
    s4aCloseUSD = json['4a. close (EUR)'];
    s4bCloseUSD = json['4b. close (USD)'];
    s5Volume = json['5. volume'];
    s6MarketCapUSD = json['6. market cap (USD)'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['1a. open (USD)'] = this.s1aOpenUSD;
    data['1b. open (USD)'] = this.s1bOpenUSD;
    data['2a. high (USD)'] = this.s2aHighUSD;
    data['2b. high (USD)'] = this.s2bHighUSD;
    data['3a. low (USD)'] = this.s3aLowUSD;
    data['3b. low (USD)'] = this.s3bLowUSD;
    data['4a. close (USD)'] = this.s4aCloseUSD;
    data['4b. close (USD)'] = this.s4bCloseUSD;
    data['5. volume'] = this.s5Volume;
    data['6. market cap (USD)'] = this.s6MarketCapUSD;
    return data;
  }
}
