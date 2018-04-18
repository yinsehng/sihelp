<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>哈尔滨网签协议</title>
</head>
<body onload="load()">

<p style="margin-right:43px;text-indent:43px">
    <strong><span style="font-size:21px;font-family:黑体">医保编号： &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（${protocol.WQ_YEAR}版）</span></strong>
</p>
<p style="text-align:right">
    <strong><span style="font-size:16px;font-family:方正黑体简体">&nbsp;</span></strong>
</p>
<p style="text-align:right;line-height:40px">
    <strong><span style="font-size:21px;font-family:方正黑体简体">&nbsp;</span></strong>
</p>
<p style="text-align:center;line-height:60px">
    <strong><span style="font-size:48px;font-family:方正黑体简体">哈尔滨市城镇基本医疗保险</span></strong>
</p>
<p style="text-align:center;line-height:60px">
    <strong><span style="font-size:48px;font-family:方正黑体简体">定点零售药店服务</span></strong>
</p>
<p style="text-align:center;line-height:60px">
    <strong><span style="font-size:48px;font-family:方正黑体简体">协议书</span></strong>
</p>
<p style="text-indent:191px">
    <strong><span style="font-size:32px;font-family:方正黑体简体">&nbsp;</span></strong>
</p>
<p style="text-indent:191px">
    <strong><span style="font-size:32px;font-family:方正黑体简体">&nbsp;</span></strong>
</p>
<p style="text-indent:127px">
    <strong><span style="font-size:21px;font-family:方正黑体简体">甲方：</span></strong>
</p>
<p style="text-indent:127px">
    <strong><span style="font-size:21px;font-family:方正黑体简体">名称：${protocol.WQ_JINSTITUTION}</span></strong>
</p>
<p style="text-indent:127px">
    <strong><span style="font-size:21px;font-family:方正黑体简体">法定代表人：${protocol.WQ_JNAME}</span></strong>
</p>
<p style="text-indent:127px">
    <strong><span style="font-size:21px;font-family:方正黑体简体">地址：${protocol.WQ_JADDRESS}</span></strong>
</p>
<p style="text-indent:127px">
    <strong><span style="font-size:21px;font-family:方正黑体简体">邮政编码：${protocol.WQ_JPOSTALCODE}</span></strong>
</p>
<p style="text-indent:128px">
    <strong><span style="font-size:21px;font-family:方正黑体简体">联系电话：<#if jtel??>${jtel[0]}<#else>0451-84871932（职工）</#if></span></strong>
</p>
<#if jtel??>
<#list 1..(jtel?size) as i>
	<p style="text-indent:234px">
    <strong><span style="font-size:21px;font-family:方正黑体简体">${jtel[i]}</span><br/></strong>
    </p>
	</#list>
<#else>
</#if>

<p style="text-indent:128px">
    <strong><span style="font-size:21px;font-family:方正黑体简体">乙方：</span></strong>
</p>
<p style="text-indent:128px">
    <strong><span style="font-size:21px;font-family:方正黑体简体">名称： </span><span style="font-size: 21px; font-family: 方正黑体简体; text-decoration: underline;">${protocol.WQ_AKB021}<#if protocol.WQ_AKB021?length lt 30><#list 0..(30-protocol.WQ_AKB021?length) as i>&nbsp;</#list></#if></span></strong>
</p>
<p style="text-indent:128px">
    <strong><span style="font-size:21px;font-family:方正黑体简体">法定代表人或委托代理人：</span></strong><span style="text-decoration: underline;"><strong><span style="text-decoration: underline; font-size: 21px; font-family: 方正黑体简体;">${protocol.WQ_NAME}<#if protocol.WQ_NAME?length lt 3><#list 0..16 as i>&nbsp;</#list><#else><#list 0..14 as i>&nbsp;</#list></#if></span></strong></span>
</p>
<p style="text-indent:127px">
    <strong><span style="font-size:21px;font-family:方正黑体简体">地址：</span></strong><span style="text-decoration: underline;"><strong><span style="text-decoration: underline; font-size: 21px; font-family: 方正黑体简体;">${protocol.WQ_ADDRESS}<#if protocol.WQ_ADDRESS?length lt 30><#list 0..(30-protocol.WQ_ADDRESS?length) as i>&nbsp;</#list></#if></span></strong></span>
</p>
<p style="text-indent:127px">
    <strong><span style="font-size:21px;font-family:方正黑体简体">邮政编码：</span></strong><span style="text-decoration: underline;"><strong><span style="text-decoration: underline; font-size: 21px; font-family: 方正黑体简体;">${protocol.WQ_POSTALCODE}<#if protocol.WQ_POSTALCODE?length lt 30><#list 0..46 as i>&nbsp;</#list></#if></span></strong></span>
</p>
<p id="content" style="text-indent:128px">
    <strong><span style="font-size:21px;font-family:方正黑体简体">联系电话：</span></strong><span style="text-decoration: underline;"><strong><span style="text-decoration: underline; font-size: 21px; font-family: 方正黑体简体;">${protocol.WQ_TEL} <#if protocol.WQ_TEL?length lt 30><#list 0..(30-protocol.WQ_TEL?length) as i>&nbsp;</#list></#if></span></strong></span>
</p>
<#if ie == "true">
<p style="text-indent:128px">
    <strong><span style="font-size:21px;font-family: 黑体"><br/></span></strong>
</p>
<p style="text-indent:128px">
    <strong><span style="font-size:21px;font-family: 黑体"><br/></span></strong>
</p>

<#else>
<p style="text-indent:128px">
    <strong><span style="font-size:21px;font-family: 黑体"><br/></span></strong>
</p>
<p style="text-indent:128px">
    <strong><span style="font-size:21px;font-family: 黑体"><br/></span></strong>
</p>
<p style="text-indent:128px">
    <strong><span style="font-size:21px;font-family: 黑体"><br/></span></strong>
</p>
<p style="text-indent:128px">
    <strong><span style="font-size:21px;font-family: 黑体"><br/></span></strong>
</p>
<p style="text-indent:128px">
    <strong><span style="font-size:21px;font-family: 黑体"><br/></span></strong>
</p>
</#if>
<p style="text-indent:30px;line-height:30px">
    <span style="font-size:21px;font-family:宋体">根据《城镇职工基本医疗保险定点零售药店管理暂行办法》《哈尔滨市城镇基本医疗保险暂行办法》及《哈尔滨市城乡居民基本医疗保险特殊病和特殊慢性病门诊治疗管理规定》等有关规定，为保证定点零售药店为我市参保人员（含离休干部）提供基本医疗保险范围内的服务，甲方确定乙方为城镇基本医疗保险定点零售药店。经双方协商，签订如下协议。</span>
</p>
<p style="text-indent:43px;line-height:40px">
    <strong><span style="font-size:21px;font-family: 宋体">第一条</span></strong><span style="font-size:21px;font-family:宋体">&nbsp;甲乙双方应严格遵守《中华人民共和国药品管理法》、《哈尔滨市城镇基本医疗保险暂行办法》、《哈尔滨市城镇职工基本医疗保险定点零售药店管理暂行规定》及相关法律法规。</span>
</p>
<p style="text-indent:43px;line-height:40px">
    <strong><span style="font-size:21px;font-family: 宋体">第二条</span></strong><span style="font-size:21px;font-family:宋体">&nbsp;甲乙双方应对参保人员和药店工作人员进行自觉遵守医疗保险各项规定的宣传教育；甲乙双方有权向对方提出合理化建议，有权检举和投诉对方工作人员的违规行为。</span>
</p>
<p style="text-indent:43px;line-height:40px">
    <strong><span style="font-size:21px;font-family: 宋体">第三条</span></strong><span style="font-size:21px;font-family:宋体">&nbsp;乙方应达到国家实施《药品经营质量管理规范》(GSP)等规定的要求，有健全和完善的药品、医疗器械质量保证制度及管理制度，并依据本协议规定，为参保人员提供基本医疗保险服务。</span>
</p>
<p style="text-indent:43px;line-height:40px">
    <strong><span style="font-size:21px;font-family: 宋体">第四条 </span></strong><span style="font-size:21px;font-family:宋体">乙方要按照甲方要求积极推进参保人员基本医疗保险信息查询工作，单独设立查询区域为参保人员提供免费查询服务。</span>
</p>
<p style="text-indent:43px;line-height:40px">
    <strong><span style="font-size:21px;font-family: 宋体">第五条&nbsp;</span></strong><span style="font-size:21px;font-family:宋体">甲方负责医疗保险计算机管理系统的软件开发、网络建设、人员培训和技术支持，乙方应根据医疗保险业务需要配置终端设备，与甲方联网实时上传数据。通讯费、终端设备及维修费用由乙方负担，乙方系统操作员必须经甲方培训上岗。如有医保操作人员的变动，需自行做好工作交接。</span>
</p>
<p style="text-indent:43px;line-height:40px">
    <strong><span style="font-size:21px;font-family: 宋体">第六条</span></strong><span style="font-size:21px;font-family:宋体">&nbsp;本协议签订后，乙方应在药店的显要位置悬挂哈尔滨市城镇基本医疗保险定点零售药店标识，以方便参保人员辨认。</span>
</p>
<p style="text-indent:43px;line-height:40px">
    <strong><span style="font-size:21px;font-family: 宋体">第七条</span></strong><span style="font-size:21px;font-family:宋体">&nbsp;甲方应及时向乙方通报基本医疗保险政策规定和业务调整情况。</span>
</p>
<p style="text-indent:42px;line-height:40px">
    <strong><span style="font-size:21px;font-family: 宋体">第八条</span></strong><span style="font-size:21px;font-family:宋体">&nbsp;乙方须使用符合财政等有关部门规定的药店票据，并单独保管、装订。严禁为参保人员开具虚假发票骗取医保基金。</span>
</p>
<p style="text-indent:43px;line-height:40px">
    <strong><span style="font-size:21px;font-family:宋体">第九条 </span></strong><span style="font-size:21px;font-family:宋体">哈尔滨市城镇职工基本医疗保险个人账户资金在定点零售药店，可购买包括【健】字号保健药品在内的所有药品，和血糖检测仪、血压计、频谱治疗仪等医疗保健器械。在规定范围内个人账户资金也可自愿为家庭成员（包括配偶、祖父母、外祖父母、父母、兄弟姐妹、子女、孙子女、外孙子女）使用。乙方应为持卡购药者提供医疗保险药店结算凭据。</span>
</p>
<p style="text-indent:43px;line-height:40px">
    <span style="font-size:21px;font-family:宋体">离休人员个人账户资金只能在零售药店购买统筹范围内药品。</span>
</p>
<p style="text-indent:43px;line-height:40px">
    <strong><span style="font-size:21px;font-family:宋体">第十条 </span></strong><span style="font-size:21px;font-family:宋体">乙方应为参保人员提供社会保障卡设置或修改密码服务，参保人员如需设置或修改密码，即本人可持有效身份证及社会保障卡到药店设置或修改密码，如他人代办，必须出示社会保障卡所有人和代办人的有效身份证明，乙方不得以任何理由推诿拒绝。</span>
</p>
<p style="text-indent:43px;line-height:40px">
    <strong><span style="font-size:21px;font-family:宋体">第十一条 </span></strong><span style="font-size:21px;font-family:宋体">乙方所售的药品和医疗保健器械等应据实上传，不得串换商品名称录入医疗保险管理信息系统。参保人员使用个人账户及现金同时支付结算费用时（个人账户余额不足），应将参保人个人承担部分全额统计在医保结算单中。</span>
</p>
<p style="text-indent:43px;line-height:40px">
    <strong><span style="font-size:21px;font-family:宋体">第十二条 </span></strong><span style="font-size:21px;font-family:宋体">乙方对所售药品要实行明码标价制度，并按药品分类管理规定设立处方药和非处方药专柜。所购药品为非处方药，不受品种、数量的限制。所购药品为处方药，按处方药量规定销售。参保人销售单据每日装订成册，保存2年，以备查验。</span>
</p>
<p style="text-indent:32px;line-height:40px">
    <strong><span style="font-size:21px;font-family:宋体">第十三条 </span></strong><span style="font-size:21px;font-family:宋体">参保人员持外配处方到乙方调剂，乙方要严格按照国家处方调剂的规定认真调剂，严格把关，妥善交付，并给予用药指导。如因调剂不当出现药事责任，由乙方承担赔偿损失，甲方按有关规定予以相应处理。乙方无正当理由，不得拒绝参保人员按外配处方调剂的请求，若认定外配处方配伍或剂量有疑义时，要告知参保人员，原开处方的医生修改后再给予调剂。</span>
</p>
<p style="line-height: 40px">
    <span style="font-size:21px;font-family:宋体">&nbsp;&nbsp;</span><strong><span style="font-size:21px;font-family:宋体">第十四条</span></strong><span style="font-size:21px;font-family:宋体">&nbsp;乙方出售的药品和医疗保健器械，必须保证进货渠道正规、进货票据合法、进货品种齐全，不得出售假药、劣药及不符合标准的医疗保健器械，对售出的药品及医疗保健器械应有质量保证信誉卡，信誉卡内容包括：品种名称、产地、批号、购买数量金额及日期等。</span>
</p>
<p style="text-indent:43px;line-height:40px">
    <strong><span style="font-size:21px;font-family: 宋体">第十五条&nbsp;</span></strong><span style="font-size:21px;font-family:宋体">乙方不得擅自联接医保网络并结算费用，或将在非乙方发生的费用通过乙方上传结算。</span>
</p>
<p style="text-indent:35px;line-height:35px">
    <strong><span style="font-size:21px;font-family: 宋体">第十六条</span></strong><span style="font-size:21px;font-family:宋体">&nbsp;乙方不得利用个人账户、肝肾肺心脏等移植术后抗排异治疗资金串换现金、销售政策范围外项目，与参保人员、医院合谋骗取医疗保险金等违规违法行为。</span>
</p>

<p style="text-indent:40px;line-height:40px">
    <strong><span style="font-size:21px;font-family: 宋体">第十七条</span></strong><span style="font-size:21px;font-family:宋体">&nbsp;购药人持社会保障卡在乙方购药，当日结算次数超过2次或单笔结算金额超过200元的，需由乙方收银人员负责核对购药人有效身份证件（居民身份证、机动车驾驶证、户口簿等法定有效证件），并按要求录入购药人身份证号码，以保证参保人员的个人账户资金安全。</span>
</p>
<p style="text-indent:43px;line-height:40px">
    <strong><span style="font-size:21px;font-family: 宋体">第十八条</span></strong><span style="font-size:21px;font-family:宋体">&nbsp;甲方每月按乙方申报确认的医保支付金额的<span style="font-size: 19px; font-family: 宋体; text-decoration: underline;">${options[0]}</span><span style="font-size:19px;font-family:宋体">％拨付，另<span style="font-size: 19px; font-family: 宋体; text-decoration: underline;">${options[1]}</span><span style="font-size:19px;font-family:宋体">％部分年终经考核评分后一次拨付。乙方须于每月初前5个工作日（节假日顺延）核对上月发生的结算数据，无误后要及时进行网上申报确认。当月未发生业务的也需按要求进行网上申报确认。乙方需指定一名操作员专门负责医保网上申报结算确认工作，要求实名制录入相关信息。因乙方原因网上申报不及时的，甲方将暂停拨付相关费用，待乙方申报确认报告甲方后，年度终结清算前拨付；上年度申报数据次年2月份仍未申报的，由系统按上传中心数据统一自动确认。乙方应在1月前5个工作日（节假日顺延）报送上年度数据纸介结算报表，未及时报送的，暂缓拨付月结算费用。甲方应为乙方提供本年度和上年度费用发生及拨付情况的查询服务。</span>
</p>
<p style="text-indent:43px;line-height:40px">
    <strong><span style="font-size:21px;font-family: 宋体">第十九条</span></strong><span style="font-size:21px;font-family:宋体">&nbsp;乙方应积极配合甲方查询调用进出货清单、调剂记录、处方、账单、收据及有关文件资料，不得拒绝；乙方拒绝提供资料或所提供的资料与事实不符的，甲方有权停止其定点服务并暂缓拨付相关费用。</span>
</p>
<p style="text-indent:43px;line-height:40px">
    <strong><span style="font-size:21px;font-family:宋体">第二十条</span></strong><span style="font-size:21px;font-family:宋体">&nbsp;协议履行期间，乙方变更地址、名称及法定代表人，休业或停业等情况，应当在获得有关行政部门批准变更登记后10个工作日内，通过网络（电子邮箱形式）向甲方申请变更，变更时需提供行政主管部门批准材料电子扫描图片等材料。</span>
</p>
<p style="text-indent:40px;line-height:40px">
    <strong><span style="font-size:21px;font-family: 宋体">第二十一条</span></strong><span style="font-size:21px;font-family:宋体">&nbsp;为保证月结算费用及时准确到账，新申请定点的零售药店应及时向甲方提供银行账户等财务相关手续。乙方因名称变更的，还应同时办理银行账户变更手续。</span>
</p>
<p style="text-indent:40px;line-height:40px">
    <strong><span style="font-size:21px;font-family: 宋体">第二十二条</span></strong><span style="font-size:21px;font-family:宋体">&nbsp;除一方严重违约外，任何一方须解除协议时，必须提前3个月通知对方。</span>
</p>
<p style="text-indent:40px;line-height:40px">
    <strong><span style="font-size:21px;font-family: 宋体">第二十三条</span></strong><span style="font-size:21px;font-family:宋体">&nbsp;乙方如发生违规行为或被参保人员举报、投诉，甲方有权在调查期间暂缓拨付乙方发生的相关费用。</span>
</p>
<p style="text-indent:40px;line-height:40px">
    <strong><span style="font-size:21px;font-family: 宋体">第二十四条</span></strong><span style="font-size:21px;font-family:宋体">&nbsp;甲方将根据《考核办法》等有关规定具体量化考核管理乙方的服务行为。</span>
</p>
<p style="text-indent:40px;line-height:40px">
    <strong><span style="font-size:21px;font-family: 宋体">第二十五条</span></strong><span style="font-size:21px;font-family:宋体">&nbsp;乙方必须严格执行国家和省、市各项医保政策规定，加强自律，诚信服务。采取有效措施，积极配合甲方开展医疗保险政策宣传，为广大参保人员提供优质高效的医疗服务。</span>
</p>
<p style="text-indent:40px;line-height:40px">
    <strong><span style="font-size:21px;font-family: 宋体">第二十六条</span></strong><span style="font-size:21px;font-family:宋体">&nbsp;乙方违反本协议有关规定，被甲方解除服务协议的，自解除之日起一年内，甲方不受理评估乙方定点资格申请。</span>
</p>
<p style="text-indent:40px;line-height:40px">
    <strong><span style="font-size:21px;font-family: 宋体">第二十七条</span></strong><span style="font-size:21px;font-family:宋体">&nbsp;乙方发生以下情况，甲方可解除服务协议，1年内不再受理其定点服务申请。</span></span>
</p>
<p style=";margin-bottom:0;text-align:justify;text-justify:inter-ideograph;text-indent:43px;line-height:40px">
    <span style="font-size: 21px; font-family: 宋体, SimSun;">1、没有按时签订本年度服务协议，并超过规定签署时间一个月以上仍未签署的。</span>
</p>
<p style=";margin-bottom:0;text-align:justify;text-justify:inter-ideograph;text-indent:43px;line-height:40px">
    <span style="font-size: 21px; font-family: 宋体, SimSun;">2、主动放弃医疗保险定点的。</span>
</p>
<p style=";margin-bottom:0;text-align:justify;text-justify:inter-ideograph;text-indent:43px;line-height:40px">
    <span style="font-size: 21px; font-family: 宋体, SimSun;">3、连续12个月无医疗保险业务的。</span>
</p>
<p style=";margin-bottom:0;text-align:justify;text-justify:inter-ideograph;text-indent:43px;line-height:40px">
    <span style="font-size: 21px; font-family: 宋体, SimSun;">4、随意变更经营地址，未按规定向甲方备案的。</span>
</p>
<p style=";margin-bottom:0;text-align:justify;text-justify:inter-ideograph;text-indent:43px;line-height:40px">
    <span style="font-size: 21px; font-family: 宋体, SimSun;">5、暂停服务期间未进行及时、有效整改的。</span>
</p>
<p style=";margin-bottom:0;text-align:justify;text-justify:inter-ideograph;text-indent:43px;line-height:40px">
    <span style="font-size: 21px; font-family: 宋体, SimSun;">6、未通过市场监督管理部门年检的。</span>
</p>
<p style=";margin-bottom:0;text-align:justify;text-justify:inter-ideograph;text-indent:43px;line-height:40px">
    <span style="font-size: 21px; font-family: 宋体, SimSun;">7、违反协议管理有关规定，金额巨大、情节恶劣，在社会上造成不良影响的。</span>
</p>

<p style=";margin-bottom:0;text-align:justify;text-justify:inter-ideograph;text-indent:43px;line-height:40px">
    <strong><span style="font-size: 21px; font-family: 宋体, SimSun;">第二十八条</span></strong><span style="font-size: 21px">&nbsp; <span style="font-size: 21px; font-family: 宋体, SimSun;">乙方发生以下情况，甲方可解除服务协议，2年内不再受理其定点服务申请。 </span></span>
</p>
<p style=";margin-bottom:0;text-align:justify;text-justify:inter-ideograph;text-indent:43px;line-height:40px">
    <span style="font-family: 宋体, SimSun; font-size: 21px;">1、因违反协议管理有关规定被解除服务协议重新申请定点后，再次被暂停服务资格的。</span>
</p>
<p style=";margin-bottom:0;text-align:justify;text-justify:inter-ideograph;text-indent:43px;line-height:40px">
    <span style="font-family: 宋体, SimSun; font-size: 21px;">2、提供虚假申请材料的。</span>
</p>
<p style="text-indent:43px;line-height:40px">
    <span style="font-size: 21px;font-family: 宋体">3、被吊销《药品经营许可证》、《营业执照》的。</span>
</p>
<p style="text-indent:43px;line-height:40px">
    <span style="font-size: 21px;font-family: 宋体">4、其他造成严重后果或重大影响的违规行为。</span>
</p>
<p style="text-indent:43px;line-height: 40px">
    <strong><span style="font-size:21px;font-family:宋体">第二十九条</span></strong><span style="font-size:21px;font-family:宋体">&nbsp;因乙方网签协议用户名密码保管不善，导致协议内容泄露的，由乙方承担全部后果。</span>
</p>
<p style="text-indent:43px;line-height: 40px">
    <strong><span style="font-size:21px;font-family:宋体">第三十条</span></strong><span style="font-size:21px;font-family:宋体">&nbsp;如因乙方涉及民事、行政诉讼或者刑事案件，甲方被相关司法部门列为被执行人或者协助执行人的，或者其他影响甲方正常工作的情形，甲方可单方决定暂停或终止本协议，因此所造成的损失由乙方承担。</span>
</p>
<p style="line-height:40px">
    <strong><span style="font-size:21px;font-family:宋体">&nbsp;&nbsp;&nbsp;&nbsp;</span></strong><strong><span style="font-size:21px;font-family:宋体">第三十一条</span></strong><span style="font-size:21px;font-family:宋体">&nbsp;本协议执行期间出现争议时，由争议双方协商解决；协商不成的，由人力资源和社会保障行政部门提出处理意见或依法进行仲裁。对人力资源和社会保障行政部门提出的处理意见不服的，可以提起行政诉讼。</span>
</p>
<p style="text-indent:43px;line-height:40px">
    <strong><span style="font-size:21px;font-family:宋体">第三十二条</span></strong><span style="font-size:21px;font-family:宋体">&nbsp;甲方每年应通过医疗保险计算机管理系统及时通知乙方《服务协议》具体签署时间，乙方要及时查看网上通知，做好协议签署前准备工作，并及时续签《服务协议》。规定期内乙方未按时签署服务协议的，甲方有权终止其定点服务。</span>
</p>
<p style="text-indent:40px;line-height:40px">
    <strong><span style="font-size:21px;font-family: 宋体">第三十三条&nbsp;</span></strong><span style="font-size:21px;font-family:宋体">本协议未尽事宜，经甲乙双方同意，可用换文形式进行补充，效力与本协议相同。&nbsp;&nbsp;&nbsp; </span>
</p>
<p style="text-indent:40px;line-height:40px">
    <strong><span style="font-size:21px;font-family: 宋体">第三十四条</span></strong><span style="font-size:21px;font-family:宋体">&nbsp;本协议有效期自${protocol.WQ_TIME}起至${protocol.WQ_YEAR}年12月31日止。本协议一式两份，甲乙双方各执一份，具有同等效力。</span>
</p>
<p>
    <span style="font-size:21px;font-family: 宋体">&nbsp; 附件：哈尔滨市基本医疗保险定点零售药店服务质量考核办法</span>
</p>
</br>
<p style="line-height:40px">
    <span style="font-size:21px;font-family:宋体">&nbsp; &nbsp; &nbsp; 甲方：${protocol.WQ_JINSTITUTION} &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 乙方：${protocol.WQ_AKB021}</span>
</p>
<p style="text-indent:29px;line-height:40px">
    <span style="font-size:21px;font-family:宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="font-size:21px;font-family:宋体">（盖章）&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (盖章)</span>
</p>
<p style="text-indent:157px;line-height:40px">
    <span style="font-size:21px;font-family:宋体">&nbsp;</span><span style="font-family: 宋体; font-size: 21px;">&nbsp;</span>
</p>
<p style="line-height:40px">
    <span style="font-size:21px;font-family:宋体">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 法人代表： &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;法人代表：</span>
</p>
<p style="text-indent:64px;line-height:40px">
    <span style="font-size:21px;font-family:宋体">&nbsp; &nbsp; </span><span style="font-size:21px;font-family:宋体">${protocol.WQ_JNAME} &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ${protocol.WQ_NAME}</span>
</p>
<p style="text-indent:29px;line-height:40px">
    <span style="font-size:21px;font-family:宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
</p>
<p style="text-indent:85px;line-height:40px">
    <span style="font-size:21px;font-family:宋体"></span><span style="font-size:21px;font-family:宋体">${protocol.WQ_JDATE} &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;${protocol.WQ_YDATE}</span>
</p>
</body>
</html>