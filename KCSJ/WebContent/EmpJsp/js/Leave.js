/**
 * 
 */

// 搜索（通过房间号或身份证号查询）
function changesearch() {
	var sousuo = $("#SouSuo").get(0).value;

	var name;
	var card;
	var rmno;
	var mfee;
	var tel;
	var time;
	var vno = 0;
	var roomprice;

	var numberreg = /^[1-9]\d{0,2}$/;

	if (numberreg.test(sousuo) == true) {
		$
				.ajax({
					type : 'post',
					dataType : 'json',
					url : 'http://localhost:8080/KCSJ/Emp/ClientLeave.do?sousuo='
							+ sousuo,
					success : function(data) {
						if (data != null) {
							if (data[0].XinXi == "client") {
								name = data[0].client.cname;
								card = data[0].client.ccard;
								rmno = data[0].room.rmno;
								mfee = data[0].client.cmfee;
								tel = data[0].client.ctel;
								time = data[0].client.cdate;
								roomprice = data[0].room.rmprice;

							} else if (data[0].XinXi == "vip") {
								vno = data[0].vip.vno;
								name = data[0].vip.vname;
								card = data[0].vip.vcard;
								rmno = data[0].room.rmno;
								mfee = data[0].vip.vfee;
								tel = data[0].vip.vtel;
								time = data[0].vip.vdate;
								roomprice = data[0].room.vprice;

							}

						} else {

							alert("此房间无人居住，请重新输入");

						}

						var $tbody = $("#List");
						$tbody.empty();
						var table;
						for (var j = 0; j < data.length; j++) {
							table = "<tr><td><span id='name' style='font-size: 15px'>"
									+ name
									+ "</span></td><td><span id='card' style='font-size: 15px'>"
									+ card
									+ "</span></td><td><span id='rmno' style='font-size: 15px'>"
									+ rmno
									+ "</td><td><span id='cmfee' style='font-size: 15px'>"
									+ mfee
									+ "</span></td><td><span id='tel' style='font-size: 15px'>"
									+ tel
									+ "</span></td><td><span id='time' style='font-size: 15px'>"
									+ time
									+ "</span></td>"
									+ "<td><div class='button-group' onclick='tuifang("
									+ vno
									+ ","
									+ '"'
									+ name
									+ '"'
									+ ","
									+ '"'
									+ card
									+ '"'
									+ ","
									+ rmno
									+ ","
									+ mfee
									+ ","
									+ '"'
									+ time
									+ '"'
									+ ","
									+ roomprice
									+ ");'><a class='button border-main' >退房</td></tr>";
						}
						$tbody.append(table);

					}

				});
	} else {
		alert("您的输入有误");
	}
}

/**
 * 获得当前系统时间
 * 
 * @param fmt
 * @returns
 */
Date.prototype.format = function(fmt) {
	var o = {
		"M+" : this.getMonth() + 1, // 月份
		"d+" : this.getDate(), // 日
		"h+" : this.getHours(), // 小时
		"m+" : this.getMinutes(), // 分
		"s+" : this.getSeconds(), // 秒
		"q+" : Math.floor((this.getMonth() + 3) / 3), // 季度
		"S" : this.getMilliseconds()
	// 毫秒
	};
	if (/(y+)/.test(fmt)) {
		fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "")
				.substr(4 - RegExp.$1.length));
	}
	for ( var k in o) {
		if (new RegExp("(" + k + ")").test(fmt)) {
			fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k])
					: (("00" + o[k]).substr(("" + o[k]).length)));
		}
	}
	return fmt;
}

/**
 * 退房函数
 */
function tuifang(vno, name, card, rmno, mfee, time, roomprice) {

	var myDate = new Date();
	var outdate = myDate.format("yyyy/MM/dd hh:mm:ss "); // 获取当前日期

	var Time01 = new Date().getTime() - new Date(time).getTime(); // 时间差的毫秒数

	// 计算出相差天数
	var Time = Math.ceil(Time01 / (24 * 3600 * 1000));
	alert(Time + "天");

	var roomfee = roomprice * Time;
	var allfee = roomfee + mfee;

	// Time所住时长
	// outdate退房时间
	// price房价
	// card身份证
	// roomfee房费
	// mfee餐费
	// rmno房间号
	// allfee总费用
	$("#Name").get(0).innerHTML = name;
	$("#Date").get(0).innerHTML = time;
	$("#price").get(0).innerHTML = roomprice;
	$("#Card").get(0).innerHTML = card;
	$("#mfee").get(0).innerHTML = mfee;
	$("#Rmno").get(0).innerHTML = rmno;
	$("#outdate").get(0).innerHTML = outdate;
	$("#Time").get(0).innerHTML = Time;
	$("#roomfee").get(0).innerHTML = roomfee;
	$("#allfee").get(0).innerHTML = allfee;

	if (vno != 0) {
		$("#Vip").get(0).innerHTML = "是";
	} else {
		$("#Vip").get(0).innerHTML = "否";
	}
	alert(name);
	alert(card);
	alert(rmno);
	alert(mfee);
	alert(time);

	$('#myModal').modal();

}
