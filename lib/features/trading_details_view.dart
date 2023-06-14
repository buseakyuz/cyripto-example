import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trading_app/core/layout_constants.dart';
import 'package:trading_app/features/chart_web_view.dart';
import 'package:trading_app/product/providers/coin_provider.dart';

class TradingDetailView extends StatefulWidget {
  const TradingDetailView({super.key});

  @override
  State<TradingDetailView> createState() => _TradingDetailViewState();
}

class _TradingDetailViewState extends State<TradingDetailView>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late TabController _controller;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _fetchCoin();
    });
    _tabController = TabController(length: 3, vsync: this);
    _controller = TabController(length: 4, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: LayoutConstants.centralSize,
                  vertical: LayoutConstants.defaultSize),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  graphicType(),
                  timeIntervalRow(),
                ],
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height / 2,
              ),
              child: ChartWebView(),
            ),
            Divider(
              color: Theme.of(context).dividerColor,
              thickness: 2.0,
            ),
            Padding(
              padding: LayoutConstants.midAllPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  globalAverageResultRow(),
                  LayoutConstants.highEmptyHeight,
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: SizedBox(
                              child: valuesPanel(
                                  title: '24H High (EUR)',
                                  value: _getAmount(context
                                      .watch<CoinProvider>()
                                      .myCoin
                                      ?.timeSeriesDigitalCurrencyDaily
                                      ?.cyriptoData
                                      ?.s2aHighUSD)),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              child: valuesPanel(
                                  title: '24H Low (EUR)',
                                  value: _getAmount(context
                                      .watch<CoinProvider>()
                                      .myCoin
                                      ?.timeSeriesDigitalCurrencyDaily
                                      ?.cyriptoData
                                      ?.s3aLowUSD)),
                            ),
                          ),
                          Expanded(
                              child: SizedBox(
                                  child: valuesPanel(
                                      title: '24H Vol',
                                      value: _getAmount(context
                                          .watch<CoinProvider>()
                                          .myCoin
                                          ?.timeSeriesDigitalCurrencyDaily
                                          ?.cyriptoData
                                          ?.s5Volume)))),
                        ],
                      ),
                      LayoutConstants.midEmptyHeight,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: SizedBox(
                                  child: valuesPanel(
                                      title: 'Cap (EUR)',
                                      value: _getAmount(context
                                          .watch<CoinProvider>()
                                          .myCoin
                                          ?.timeSeriesDigitalCurrencyDaily
                                          ?.cyriptoData
                                          ?.s6MarketCapUSD)))),
                          Expanded(
                            child: SizedBox(
                              child: valuesPanel(
                                  title: 'Circulation (BTC)',
                                  value: _getAmount(context
                                      .watch<CoinProvider>()
                                      .myCoin
                                      ?.timeSeriesDigitalCurrencyDaily
                                      ?.cyriptoData
                                      ?.s5Volume)),
                            ),
                          ),
                          Expanded(child: SizedBox())
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TabBar timeIntervalRow() {
    return TabBar(
        labelPadding:
            EdgeInsets.symmetric(horizontal: LayoutConstants.highSize),
        controller: _controller,
        isScrollable: true,
        indicator: BoxDecoration(color: Colors.transparent),
        labelColor: Theme.of(context).primaryColor,
        unselectedLabelColor: Colors.white54,
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
        tabs: [
          Tab(
            text: "1m",
          ),
          Tab(
            text: "1H",
          ),
          Tab(
            text: "1D",
          ),
          Tab(
            text: "1W",
          ),
        ]);
  }

  Container graphicType() {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(width: 2.0, color: Colors.white38),
          borderRadius: BorderRadius.circular(LayoutConstants.maxRadius)),
      child: Padding(
        padding: LayoutConstants.lowAllPadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.candlestick_chart,
                color: Theme.of(context).primaryColor),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: LayoutConstants.defaultSize),
              child: Container(
                width: 1.0,
                height: 16.0,
                color: Colors.white38,
              ),
            ),
            Icon(
              Icons.show_chart,
            )
          ],
        ),
      ),
    );
  }

  Widget valuesPanel({required String title, required String value}) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.start,
      direction: Axis.vertical,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 12.0, color: Colors.white54),
        ),
        Text(
          value,
          style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ],
    );
  }

  Row globalAverageResultRow() {
    return Row(
      children: [
        Wrap(
          direction: Axis.vertical,
          children: [
            Row(
              children: [
                RichText(
                  text: TextSpan(
                      text: _getAmount(context
                          .watch<CoinProvider>()
                          .myCoin
                          ?.timeSeriesDigitalCurrencyDaily
                          ?.cyriptoData
                          ?.s4aCloseUSD),
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w800,
                          color: Theme.of(context).colorScheme.secondary),
                      children: [
                        TextSpan(
                          text: " EUR",
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                      ]),
                ),
              ],
            ),
            Row(
              children: [
                RichText(
                  text: TextSpan(
                      text:
                          "=${_getAmount(context.watch<CoinProvider>().myCoin?.timeSeriesDigitalCurrencyDaily?.cyriptoData?.s4bCloseUSD)} USD",
                      style: TextStyle(color: Colors.white54),
                      children: [
                        TextSpan(
                          text: " -5.27%",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).colorScheme.secondary),
                        )
                      ]),
                ),
              ],
            )
          ],
        ),
        Spacer(),
        _averageButton()
      ],
    );
  }

  Container _averageButton() {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(LayoutConstants.maxRadius),
          color: Colors.white.withOpacity(0.2)),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: LayoutConstants.defaultSize,
            horizontal: LayoutConstants.midSize),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Global Average",
                style: TextStyle(
                    color: Colors.white60, fontWeight: FontWeight.bold)),
            Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      leading: Icon(Icons.arrow_back),
      centerTitle: true,
      title: Wrap(
        direction: Axis.vertical,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text(
            "BTC",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "Global Average",
            style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w300,
                color: Colors.white54),
          )
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: LayoutConstants.midSize),
          child: Row(
            children: [
              Icon(
                Icons.notification_add_outlined,
              ),
              LayoutConstants.midEmptyWidth,
              Icon(Icons.star_outlined, color: Colors.amberAccent)
            ],
          ),
        ),
      ],
      bottom: _tabBar(),
    );
  }

  TabBar _tabBar() {
    return TabBar(
      controller: _tabController,
      indicatorColor: Theme.of(context).primaryColor,
      indicatorWeight: 3.0,
      indicatorSize: TabBarIndicatorSize.tab,
      labelStyle: TextStyle(fontSize: 14.0),
      labelColor: Theme.of(context).primaryColor,
      unselectedLabelColor: Colors.white,
      tabs: [
        Tab(
          text: "Trend",
        ),
        Tab(
          text: "Technicals",
        ),
        Tab(
          text: "Transaction",
        ),
      ],
    );
  }

  void _fetchCoin() {
    context.read<CoinProvider>().fetchCoin();
  }

  _getAmount(String? value) {
    return double.parse(value ?? "0.0").toStringAsFixed(2);
  }
}
