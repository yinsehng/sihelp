
$(function () {
	var count = parseInt($("[name='_count']").val());
	var current = parseInt($("[name='_current']").val());
	if (count == 0) {
		return;
	}
	$("#begin").click(function () {
		if (current == 1) {
			ymPrompt.alert({title:'\u9519\u8BEF\u63D0\u793A\uFF1A',message:'\u5df2\u5230\u9996\u9875!'});
			//alert("\u5df2\u5230\u9996\u9875");
			return;
		}
		$("form").attr("action", $("form").attr("action") + "?page=1");
		$("form").submit();
	});
	$("#before").click(function () {
		if (current == 1) {
			ymPrompt.alert({title:'\u9519\u8BEF\u63D0\u793A\uFF1A',message:'\u5df2\u5230\u9996\u9875!'});
			//alert("\u5df2\u5230\u9996\u9875");
			return;
		}
		$("form").attr("action", $("form").attr("action") + "?page=" + (current - 1));
		$("form").submit();
	});
	$("#next").click(function () {
		if (current == count) {
			ymPrompt.alert({title:'\u9519\u8BEF\u63D0\u793A\uFF1A',message:'\u5df2\u5230\u5c3e\u9875!'});
			//alert("\u5df2\u5230\u5c3e\u9875");
			return;
		}
		$("form").attr("action", $("form").attr("action") + "?page=" + (current + 1));
		$("form").submit();
	});
	$("#end").click(function () {
		if (current == count) {
			ymPrompt.alert({title:'\u9519\u8BEF\u63D0\u793A\uFF1A',message:'\u5df2\u5230\u5c3e\u9875!'});
			//alert("\u5df2\u5230\u5c3e\u9875");
			return;
		}
		$("form").attr("action", $("form").attr("action") + "?page=" + count);
		$("form").submit();
	});
	$("#to").click(function () {
		var topg=parseInt($("#topg").val());
		if(isNaN(topg)){
			ymPrompt.alert({title:'\u9519\u8BEF\u63D0\u793A\uFF1A',message:'\u9875\u7801\u8303\u56F4\u8F93\u5165\u9519\u8BEF'});
			return;
		}
		if(topg>count || topg<0){
			ymPrompt.alert({title:'\u9519\u8BEF\u63D0\u793A\uFF1A',message:'\u9875\u7801\u8303\u56F4\u8F93\u5165\u9519\u8BEF'});
			return;
		}
		$("form").attr("action", $("form").attr("action") + "?page=" + topg);
		$("form").submit();
	});
});

