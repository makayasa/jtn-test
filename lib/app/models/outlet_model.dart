import 'package:jtn/config/function_utils.dart';

class OutletModel {
  OutletModel({
    required this.id,
    required this.outletName,
    required this.outletCode,
    required this.outletAddress,
    required this.outletPhone,
    required this.invoicePrint,
    required this.startingDate,
    required this.invoiceFooter,
    required this.dateFormat,
    required this.timeZone,
    required this.currency,
    required this.currencyShow,
    required this.decimalShow,
    required this.decimalDigit,
    required this.decimalZeroHide,
    required this.outletMode,
    required this.showIngCode,
    required this.hppMode,
    required this.cekAksesBydb,
    required this.collectTax,
    required this.taxRegistrationTitle,
    required this.taxRegistrationNo,
    required this.taxTitle,
    required this.taxUseGlobal,
    required this.taxIsGst,
    required this.stateCode,
    required this.preOrPostPayment,
    required this.userId,
    required this.parentId,
    required this.orderId,
    required this.maxSub,
    required this.delStatus,
  });

  String id;
  String outletName;
  String outletCode;
  String outletAddress;
  String outletPhone;
  String invoicePrint;
  String startingDate;
  String invoiceFooter;
  String dateFormat;
  String timeZone;
  String currency;
  String currencyShow;
  String decimalShow;
  String decimalDigit;
  String decimalZeroHide;
  String outletMode;
  String showIngCode;
  String hppMode;
  String cekAksesBydb;
  String collectTax;
  String taxRegistrationTitle;
  String taxRegistrationNo;
  String taxTitle;
  String taxUseGlobal;
  String taxIsGst;
  String stateCode;
  String preOrPostPayment;
  String userId;
  String parentId;
  String orderId;
  String maxSub;
  String delStatus;

  factory OutletModel.fromJson(dynamic json) {
    logKey('OutletModel.fromJson', json);
    return OutletModel(
      id: json['id'],
      outletName: json['outlet_name'],
      outletCode: json['outlet_code'],
      outletAddress: json['outlet_address'],
      outletPhone: json['outlet_phone'],
      invoicePrint: json['invoice_print'],
      startingDate: json['starting_date'],
      invoiceFooter: json['invoice_footer'],
      dateFormat: json['date_format'],
      timeZone: json['time_zone'],
      currency: json['currency'],
      currencyShow: json['currency_show'],
      decimalShow: json['decimal_show'],
      decimalDigit: json['decimal_digit'],
      decimalZeroHide: json['decimal_zero_hide'],
      outletMode: json['outlet_mode'],
      showIngCode: json['show_ing_code'],
      hppMode: json['hpp_mode'],
      cekAksesBydb: json['cek_akses_bydb'],
      collectTax: json['collect_tax'],
      taxRegistrationTitle: json['tax_registration_title'],
      taxRegistrationNo: json['tax_registration_no'],
      taxTitle: json['tax_title'],
      taxUseGlobal: json['tax_use_global'],
      taxIsGst: json['tax_is_gst'],
      stateCode: json['state_code'],
      preOrPostPayment: json['pre_or_post_payment'],
      userId: json['user_id'],
      parentId: json['parent_id'],
      orderId: json['order_id'],
      maxSub: json['max_sub'],
      delStatus: json['del_status'],
    );
  }

  factory OutletModel.init() => OutletModel(
        id: '',
        outletName: '',
        outletCode: '',
        outletAddress: '',
        outletPhone: '',
        invoicePrint: '',
        startingDate: '',
        invoiceFooter: '',
        dateFormat: '',
        timeZone: '',
        currency: '',
        currencyShow: '',
        decimalShow: '',
        decimalDigit: '',
        decimalZeroHide: '',
        outletMode: '',
        showIngCode: '',
        hppMode: '',
        cekAksesBydb: '',
        collectTax: '',
        taxRegistrationTitle: '',
        taxRegistrationNo: '',
        taxTitle: '',
        taxUseGlobal: '',
        taxIsGst: '',
        stateCode: '',
        preOrPostPayment: '',
        userId: '',
        parentId: '',
        orderId: '',
        maxSub: '',
        delStatus: '',
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['outlet_name'] = outletName;
    data['outlet_code'] = outletCode;
    data['outlet_address'] = outletAddress;
    data['outlet_phone'] = outletPhone;
    data['invoice_print'] = invoicePrint;
    data['starting_date'] = startingDate;
    data['invoice_footer'] = invoiceFooter;
    data['date_format'] = dateFormat;
    data['time_zone'] = timeZone;
    data['currency'] = currency;
    data['currency_show'] = currencyShow;
    data['decimal_show'] = decimalShow;
    data['decimal_digit'] = decimalDigit;
    data['decimal_zero_hide'] = decimalZeroHide;
    data['outlet_mode'] = outletMode;
    data['show_ing_code'] = showIngCode;
    data['hpp_mode'] = hppMode;
    data['cek_akses_bydb'] = cekAksesBydb;
    data['collect_tax'] = collectTax;
    data['tax_registration_title'] = taxRegistrationTitle;
    data['tax_registration_no'] = taxRegistrationNo;
    data['tax_title'] = taxTitle;
    data['tax_use_global'] = taxUseGlobal;
    data['tax_is_gst'] = taxIsGst;
    data['state_code'] = stateCode;
    data['pre_or_post_payment'] = preOrPostPayment;
    data['user_id'] = userId;
    data['parent_id'] = parentId;
    data['order_id'] = orderId;
    data['max_sub'] = maxSub;
    data['del_status'] = delStatus;
    return data;
  }
}
