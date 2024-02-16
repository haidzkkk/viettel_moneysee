
import 'package:flutter/material.dart';
import 'package:viettel_money/data/model/service.dart';
import 'package:viettel_money/utils/colors.dart';
import 'package:viettel_money/utils/resource.dart';

var listHistorySearch = [
  "Chuyển tiền",
  "Giới thiệu",
  "Qua app",
  "Đi chơi",
  "Tết",
  "Các dịch vụ",
];

var listServiceSearch = [
  Service(name: "Trái tim cho em", src: img_lottery),
  Service(name: "Tết đầy up", src: img_lottery),
  Service(name: "Gửi tiết kiệm", src: img_lottery),
  Service(name: "Dầu khí miền nam", src: img_lottery),
  Service(name: "Trung nguyên Franchising", src: img_lottery),
  Service(name: "Thanh toán học phí FPT", src: img_lottery),
  Service(name: "ĐH Ngoại ngữ(ĐH Huế)", src: img_lottery),
  Service(name: "CĐ Nghề Trà Vinh", src: img_lottery),
  Service(name: "CĐ Lào Cai", src: img_lottery),
  Service(name: "Trường DH Đồng tháp", src: img_lottery),
  Service(name: "Đại học Công Nghiệp Hà Nội", src: img_lottery),
  Service(name: "Trường Đại Học Bạc Liêu", src: img_lottery),
  Service(name: "Trường Đại Học GTVT", src: img_lottery),
  Service(name: "FCCIM", src: img_lottery),
  Service(name: "Giao Hàng Nhanh", src: img_lottery),
  Service(name: "Tài xế BORZO", src: img_lottery),
  Service(name: "Yo learn", src: img_lottery),
  Service(name: "Học Phí SISAP", src: img_lottery),
  Service(name: "Học phí SSC", src: img_lottery),
  Service(name: "Học Phí Viettel", src: img_lottery),
  Service(name: "Vé Máy bay", src: img_lottery),
  Service(name: "Vé Máy bay Aloo", src: img_lottery),
  Service(name: "Khách sạn", src: img_lottery),
  Service(name: "Tài kharon tích lũy", src: img_lottery),
  Service(name: "Mua Bảo hiểm", src: img_lottery),
  Service(name: "Cao đẳng vĩnh long", src: img_lottery),
  Service(name: "Điện liên Hà", src: img_lottery),
];

var listService = [
  Service(name: "Vay tiền", src: img_loan, color: primaryColor),
  Service(name: "Mua bảo hiểm", src: img_shield, color: primaryColor),
  Service(name: "Vé số", src: img_lottery),
  Service(name: "Chuyển đến số tài khoản", src: img_bank, color: primaryColor),
  Service(name: "Nạp tiền điện thoại", src: img_iphone, color: Colors.blueAccent),
  Service(name: "Mua Data 3G/4G", src: img_4g, color: primaryColor),
  Service(name: "Tiền điện", src: img_lamp, color: Colors.amber),
];

var listService2 = [
  Service(name: "Vay tiền", src: img_loan, color: Colors.red),
  Service(name: "Mua bảo hiểm", src: img_shield, color: Colors.green),
  Service(name: "Vé số", src: img_lottery, color: Colors.greenAccent),
  Service(name: "Chuyển đến số tài khoản", src: img_bank, color: Colors.blueAccent),
  Service(name: "Nạp tiền điện thoại", src: img_iphone, color: Colors.blueAccent),
  Service(name: "Mua Data 3G/4G", src: img_4g, color: Colors.orange),
  Service(name: "Tiền điện", src: img_lamp, color: Colors.green),
];

var bannerData = [
  img_img1,
  img_img2,
  img_img3,
];

var listPresent = [
  Service(name: "Tết Đầy up", src: img_mason),
  Service(name: "Rồng Du ký", src: img_mason),
  Service(name: "Rồng đại cát", src: img_mason),
  Service(name: "Mở app là có quà", src: img_mason),
  Service(name: "Free data, phút gọi, đi chơi", src: img_mason),
  Service(name: "KM 10% nạp điện thoại", src: img_mason),
  Service(name: "Tinh tinh", src: img_mason),
  Service(name: "Hoàn 30% data", src: img_mason),
];

var listNew = [
  Service(name: "Sắm tết đầy up ưu đãi", src: img_img1),
  Service(name: "Hướng dẫn nạp tiền vào tài khoản", src: img_img2),
  Service(name: "Tiền mặt trong tay - Vay ngay Mcredit", src: img_img3),
  Service(name: "Vay ngắn ngày- Giải ngân siêu tốc", src: img_img1),
  Service(name: "Đi XANHSM nhận khuyến mại tới 40K Khi đặt xe", src: img_img1),
  Service(name: "Cổng thanh toán trực tuyến", src: img_img2),
  Service(name: "Tiết khiệm 20% tiền điện mỗi tháng và nhiều cái khác", src: img_img3),
  Service(name: "Đi XANHSM nhận khuyến mại tới 40K Khi đặt xe", src: img_img1),
  Service(name: "Tạp hóa Voucher", src: img_img1),
];

var listGift = [
  Service(name: "Tặng 1 Bánh Berger Gà khi mia Combo [Một Gà rán + 1 Nước + 1 Khoai tây chiên]", src: img_img1),
  Service(name: "Mua 1 Tặng 1 Gà Rán [McDonald's]", src: img_img2),
  Service(name: "Giảm 40% Máy massage Cầm tay TK-Hoàng kim", src: img_img3),
  Service(name: "Giảm 20% + Tặng bình pha trà cho hóa đơn từ 300K", src: img_img1),
  Service(name: "Combo 10 vouchers giảm đến 300K [Gojek]", src: img_img1),
  Service(name: "Giảm 150K cho đơn 400K", src: img_img2),
  Service(name: "Giảm 30K cho đơn từ 130K [KFC]", src: img_img3),
  Service(name: "Tặng giftcode 300K hame đấu thần tuyệt mệnh", src: img_img1),
  Service(name: "Giảm 15% Phụ kiện xe máy [Kim Phat Việt]", src: img_img1),
  Service(name: "Giảm 50% [ToCoToCo]", src: img_img1),
  Service(name: "Giảm 40% + Tặng mát massage cầm tay khi mua tại TK-Hoàng kim", src: img_img1),
  Service(name: "Tặng 1 Bánh Berger Gà khi mia Combo [Một Gà rán + 1 Nước + 1 Khoai tây chiên]", src: img_img1),
  Service(name: "Mua 1 Tặng 1 Gà Rán [McDonald's]", src: img_img2),
  Service(name: "Giảm 40% Máy massage Cầm tay TK-Hoàng kim", src: img_img3),
  Service(name: "Giảm 20% + Tặng bình pha trà cho hóa đơn từ 300K", src: img_img1),
  Service(name: "Combo 10 vouchers giảm đến 300K [Gojek]", src: img_img1),
  Service(name: "Giảm 150K cho đơn 400K", src: img_img2),
  Service(name: "Giảm 30K cho đơn từ 130K [KFC]", src: img_img3),
  Service(name: "Tặng giftcode 300K hame đấu thần tuyệt mệnh", src: img_img1),
  Service(name: "Giảm 15% Phụ kiện xe máy [Kim Phat Việt]", src: img_img1),
  Service(name: "Giảm 50% [ToCoToCo]", src: img_img1),
  Service(name: "Giảm 40% + Tặng mát massage cầm tay khi mua tại TK-Hoàng kim", src: img_img1),
  Service(name: "Giảm 40% Máy massage Cầm tay TK-Hoàng kim", src: img_img3),
];

var listVouchers = [
  "Voucher giảm 100% tối đa 5.000đ khi mua data",
  "Voucher giảm 30% khi thanh toán đơn hàng",
  "Voucher giảm 10% tối đa 10.000đ khi nạp tiền điện thoại",
  "Voucher giảm 50% tối áp dụng khi thanh toán data",
  ];



