import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:insighta/styles/theme_x.dart';
import 'package:insighta/utilities/date_utils.dart';
import 'package:insighta/widgets/app_card.dart';
import 'package:insighta/widgets/back_header.dart';
import '../controllers/trading_stats_controller.dart';

class TradingStatsView extends GetView<TradingStatsController> {
  const TradingStatsView({super.key});

  static final _money = NumberFormat('#,##0');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.palette.pageBg,
      body: Column(
        children: [
          Obx(() => BackHeader(
                title: 'البيع والشراء',
                subtitle:
                    '${controller.totalBought.value} مشترى · ${controller.totalSold.value} مباع',
              )),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              if (controller.years.isEmpty) {
                return Center(
                  child: Text('لا توجد عمليات بيع أو شراء',
                      style: TextStyle(fontSize: 14.sp, color: context.palette.textMuted)),
                );
              }
              return ListView(
                padding: EdgeInsets.all(16.w),
                children: controller.years.map((y) => _yearCard(y, context)).toList(),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _yearCard(TradeYear y, BuildContext context) {
    final open = controller.expanded.contains(y.year);
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: cardDecoration(context),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          GestureDetector(
            onTap: () => controller.toggle(y.year),
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Row(children: [
                Icon(open ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                    color: context.palette.textMuted),
                SizedBox(width: 8.w),
                _pctPill(y.profitPct, context),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('سنة ${y.year}',
                        style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold)),
                    Text('اشترى ${y.bought} · باع ${y.sold}',
                        style: TextStyle(fontSize: 11.sp, color: context.palette.textMuted)),
                  ],
                ),
                SizedBox(width: 12.w),
                Container(
                  width: 34.w,
                  height: 34.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: context.palette.accentGreen, shape: BoxShape.circle),
                  child: Text(y.year,
                      style: TextStyle(
                          fontSize: 9.sp, fontWeight: FontWeight.w900, color: context.palette.successFg)),
                ),
              ]),
            ),
          ),
          if (open)
            Padding(
              padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 12.h),
              child: Column(children: [
                ...y.months.map((m) => _monthBlock(m, context)),
                _yearTotal(y, context),
              ]),
            ),
        ],
      ),
    );
  }

  Widget _monthBlock(TradeMonth m, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(color: context.palette.pageBg, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text(AppDate.formatMonth(m.key),
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 8.h),
          Row(children: [
            if (m.bought > 0)
              Expanded(child: _cell('شراء', '${m.bought} رأس', '${_money.format(m.buyAmount)} ر', context.palette.infoFg, context)),
            if (m.bought > 0 && m.sold > 0) SizedBox(width: 8.w),
            if (m.sold > 0)
              Expanded(child: _cell('بيع', '${m.sold} رأس', '${_money.format(m.sellAmount)} ر', context.palette.successFg, context)),
          ]),
          SizedBox(height: 8.h),
          _pctLine(m.profitPct, context),
        ],
      ),
    );
  }

  Widget _cell(String title, String count, String amount, Color color, BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(title, style: TextStyle(fontSize: 11.sp, color: color, fontWeight: FontWeight.bold)),
          SizedBox(height: 4.h),
          Text(count, style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w900)),
          Text(amount, style: TextStyle(fontSize: 11.sp, color: context.palette.textMuted)),
        ],
      ),
    );
  }

  Widget _yearTotal(TradeYear y, BuildContext context) {
    final loss = y.profitPct < 0;
    return Container(
      margin: EdgeInsets.only(top: 8.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: loss ? context.palette.dangerBg : context.palette.successBg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(children: [
        _pctPill(y.profitPct, context),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('إجمالي سنة ${y.year}',
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold)),
            Text('شراء ${_money.format(y.buyAmount)} ر · بيع ${_money.format(y.sellAmount)} ر',
                style: TextStyle(fontSize: 11.sp, color: context.palette.textMuted)),
          ],
        ),
      ]),
    );
  }

  Widget _pctLine(double pct, BuildContext context) {
    final loss = pct < 0;
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        '${loss ? "نسبة الخسارة" : "نسبة الربح"}: ${pct.toStringAsFixed(1)}%',
        style: TextStyle(
            fontSize: 11.sp,
            fontWeight: FontWeight.bold,
            color: loss ? context.palette.dangerFg : context.palette.successFg),
      ),
    );
  }

  Widget _pctPill(double pct, BuildContext context) {
    final loss = pct < 0;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
      decoration: BoxDecoration(
          color: loss ? context.palette.dangerBg : context.palette.successBg,
          borderRadius: BorderRadius.circular(20)),
      child: Text('${pct.toStringAsFixed(1)}%',
          style: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.bold,
              color: loss ? context.palette.dangerFg : context.palette.successFg)),
    );
  }
}
