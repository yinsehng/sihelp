<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>哈尔滨网签协议</title>
</head>
<body>

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
    <strong><span style="font-size:48px;font-family:方正黑体简体">定点医疗机构服务</span></strong>
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
<p style="text-indent:30px">
    <span style="font-size:19px;font-family:宋体">为保障基本医疗保险参保人员的合法权益，维护医保基金安全，促进医保制度可持续发展，根据《中华人民共和国社会保险法》、人力资源社会保障部《关于完善基本医疗保险定点医药机构协议管理的指导意见》、《基本医疗保险定点医药机构协议管理经办规程》、《哈尔滨市城镇基本医疗保险暂行办法》、《哈尔滨市城镇居民基本医疗保险暂行办法》、《哈尔滨市城镇居民基本医疗保险门诊统筹暂行办法》、《哈尔滨市开展城镇居民大病保险工作实施方案》等法律法规及相关政策，经甲乙双方协商，就基本医疗保险医疗服务有关事宜签订如下协议。</span>
</p>
<p style="margin-top:16px;margin-right:0;margin-bottom:16px;margin-left:0;text-align:center;line-height:33px">
    <span style="font-size:21px;color:windowtext">第一章&nbsp; 总&nbsp; 则</span>
</p>
<p style="text-indent:37px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">第一条&nbsp; </span><span style="font-size:19px;font-family:宋体">甲乙双方应当认真贯彻国家、省以及市基本医疗保险、医疗卫生、药品监督、价格和医改等相关规定，保证参保人员享受基本医疗保险服务。</span>
</p>
<p style="text-indent:37px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">第二条&nbsp; 甲方依据乙方的服务质量、服务能力、服务价格等通过协商谈判，确定乙方的服务类别、服务范围、服务内容、付费方式。</span>
</p>
<p style="text-indent:37px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">甲方确定乙方为基本医疗保险定点医疗机构。甲乙双方约定医疗服务为（城镇职工基本医疗保险□ /城镇居民基本医疗保险（含城镇居民大病保险 ）□)，共<span style="font-size: 19px; font-family: 宋体; text-decoration: underline;">${options[0]}</span><span style="font-size:19px;font-family:宋体">项。乙方承担的基本医疗保险服务范围为（门诊 □ /居民门诊统筹 □/住院 □），共<span style="font-size: 19px; font-family: 宋体; text-decoration: underline;">${options[1]}</span><span style="font-size:19px;font-family:宋体">项。住院仅限<span style="font-size: 19px; font-family: 宋体; text-decoration: underline;">${options[2]}</span><span style="font-size:19px;font-family:宋体">科室，共<span style="font-size: 19px; font-family: 宋体; text-decoration: underline;">${options[3]}</span><span style="font-size:19px;font-family:宋体">项。</span>
</p>
<p style="line-height:37px">
    <span style="font-size:19px;font-family:宋体">&nbsp;&nbsp;&nbsp; </span><span style="font-size:19px;font-family:宋体">第三条&nbsp; 甲乙双方应指导、督促经办机构工作人员、定点医疗机构工作人员和参保人员自觉遵守医疗保险的各项规定；有权向对方提出合理化建议，管理措施调整时应及时通报对方，并听取意见；有权检举和投诉对方工作人员的违规行为。</span>
</p>
<p style="text-indent:37px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">第四条&nbsp; 甲方应及时向乙方传达基本医疗保险政策、经办规定、管理制度及业务操作流程的要求和变化情况，提供与乙方有关的参保人员信息及相关资料，做好医疗保险的管理服务工作，接受乙方咨询。</span>
</p>
<p style="text-indent:39px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">第五条&nbsp; 乙方应建立健全医疗保险管理服务机制，明确一名院级领导分管医疗保险工作，配备专职管理人员，并明确相应的职责。制定执行基本医疗保险政策法规的相应措施，并为参保人员就医提供方便。</span>
</p>
<p style="line-height:37px">
    <span style="font-size:19px;font-family:宋体">&nbsp;&nbsp;&nbsp; </span><span style="font-size:19px;font-family:宋体">协议履行期间，乙方名称、地址、法定代表人（企业负责人）、经营范围、类别（营利/非营利）、级别、床位数、诊疗科目、大型诊疗项目和银行账户等信息发生变化时，需在乙方收到批准机构变更材料10个工作日内，向甲方申请变更，变更时需提供行政主管部门批准材料的原件和复印件。 </span>
</p>
<p style="line-height:37px">
    <span style="font-size:19px;font-family:宋体">&nbsp;&nbsp;&nbsp; </span><span style="font-size:19px;font-family:宋体">第六条&nbsp; 乙方应按照卫生计生等部门批准的经营许可范围开展工作，根据国家有关法律法规以及本协议为参保人员提供合理、必要的医疗服务，严格执行首诊医师负责制和因病施治及优先使用适宜技术的原则，合理检查、合理治疗、合规收费，采取有效措施控制医疗费用的不合理增长，减轻参保患者个人负担。</span>
</p>
<p style="text-indent:38px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">第七条&nbsp; 甲方负责建立健全医保医师服务管理信息系统。乙方应按照《哈尔滨市基本医疗保险定点医疗机构服务医师管理暂行办法》的相关规定，积极配合甲方开展医保医师管理工作，做好医疗保险政策培训，定期组织医疗保险政策知识考核，并督促本单位医保医师正确履行医师工作职责。</span>
</p>
<p style="text-indent:37px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">第八条&nbsp; 乙方应当严格执行政府主管部门制定的医院财务制度、医院会计制度及收入分配制度，规范财务管理。不得将医务人员的工资和奖金与其业务收入直接挂钩。被甲方拒付的医疗费用，乙方应及时作相应财务处理。</span>
</p>
<p style="text-indent:38px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">第九条&nbsp; 乙方应在本单位显要位置悬挂基本医疗保险定点医疗机构标识；利用医院网站、宣传栏等开展多种形式医疗保险政策宣传，公示基本医疗保险的主要政策、本协议的重点内容和就医流程。公布医疗保险监督举报电话，设置医疗保险投诉信箱，对参保人员的投诉及时核实、处理。医保相关工作人员应认真学习协议及相关文件，能够做到为患者正确解答医保政策，不得以任何理由拒绝解答患者及家属的咨询，不得故意曲解医保政策。</span>
</p>
<p style="text-indent:38px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">第十条&nbsp; 甲方根据年度考核结果对乙方进行分级评价，实行分级管理，考核评价结果与医疗费用审核结算、考核资金（预留金）的返还等激励和惩戒内容挂钩。</span>
</p>
<p style="text-indent:37px;line-height:37px">
    <span style="font-size:19px">第十一条&nbsp; 甲方可对乙方医疗服务过程及相关医疗费用通过智能监控、实地检查等多种方式进行监督，根据需要对乙方医疗服务进行定期或不定期审核，审核后意见应及时反馈乙方，</span><span style="font-size: 19px">乙方对于审核意见，应在规定时限内予以回复，超过规定时限未进行回复的，甲方将按乙方认同审核意见处理。</span><span style="font-size:19px">甲方如需查看参保人员病历及有关资</span><span style="font-size:19px">料、询问当事人，乙方应予以合作。乙方有责任向甲方提供医疗服务有关的材料和数据，并确保内容真实完整。</span><span style="font-size: 19px">因提供不实资料、传输虚假数据产生的经济和法律责任由乙方承担。</span><span style="font-size:19px">对于乙方提供的资料，甲方有保密的义务。</span>
</p>
<p style="text-indent:37px;line-height:37px">
    <span style="font-size:19px">第十二条&nbsp;&nbsp; 乙方经卫生计生等部门审批，确立为医养结合性质医疗机构的，应认真贯彻落实国家、省、市相关政策规定，厘清医疗与养老相关收费项目，确保基金合理使用。</span>
</p>
<p style="text-indent:37px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">第十三条&nbsp; 甲方组织定点医疗机构临床专家对涉及基本医疗保险结算的临床诊疗施治行为、医疗纠纷、医疗事故等存在一定争议的问题作出鉴定结果</span><span style="font-size:19px;font-family:宋体">。</span>
</p>
<p style="margin-top:16px;margin-right:0;margin-bottom:16px;margin-left:0;text-align:center;line-height:37px">
    <span style="font-size:21px;font-family:宋体">第二章&nbsp;&nbsp; 诊疗服务</span>
</p>
<p style="text-indent:37px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">第十四条&nbsp; 参保人员就诊时，乙方必须提示其出示社会保障卡或城镇居民医保证，并按规定及时上传其入院信息。乙方禁止代办和留存参保人员社会保障卡或城镇居民医保证密码，严禁泄露参保人员信息。</span>
</p>
<p style="text-indent:37px;line-height:37px">
    <span style="font-size:19px;font-family:宋体;letter-spacing:-0">参保人员就诊时，乙方应进行身份识别。发现人、证不符时不得进行医疗保险结算并及时告知甲方。需住院治疗的参保患者，由乙方医保管理部门及所在科室的相关责任人根据有效证件进行身份核实，留存</span><span style="font-size:19px;font-family:宋体;letter-spacing: -0">《哈尔滨市基本医疗保险、工伤保险、生育保险参保人员住院登记信息表》，</span><span style="font-size:19px;font-family:宋体;letter-spacing:-0">并告知患者住院治疗期间随身携带社会保障卡或城镇居民医保证。不得留存参保患者社会保障卡或城镇居民医保证原件。</span>
</p>
<p style="line-height:37px">
    <span style="font-size:19px;font-family:宋体">&nbsp;&nbsp;&nbsp; </span><span style="font-size:19px;font-family:宋体">第十五条&nbsp; 乙方应为参保人员就诊建立普通门诊、特殊疾病门诊、城镇居民基本医疗保险门诊及住院病历,就诊记录应清晰、准确、完整，并妥善保存备查；乙方要积极配合甲方做好参保职工（居民）特殊疾病门诊和城镇居民门诊定点就医的选择及改选工作。</span>
</p>
<p style="line-height:37px">
    <span style="font-size:19px;font-family:宋体">&nbsp;&nbsp;&nbsp; </span><span style="font-size:19px;font-family:宋体">第十六条&nbsp; 被确定为特殊疾病门诊服务定点的医疗机构，应严格按照特殊疾病门诊相关病种进行申请、审批，</span><span style="font-size:19px;font-family:宋体">为患者建立特殊疾病门诊病历，</span><span style="font-size:19px;font-family:宋体">并严格执行登记备案、信息录入、指纹信息及“五定”管理制度，</span><span style="font-size:19px;font-family:宋体">工作人员应使用实名制操作，</span><span style="font-size:19px;font-family:宋体">恶性肿瘤门诊治疗定点医疗机构在进行初次审批和续批时，应严格执行恶性肿瘤门诊治疗审批的相关规定，审批材料应保存两年以上，以备甲方查验。</span>
</p>
<p style="line-height:37px">
    <span style="font-size:19px;font-family:宋体;letter-spacing:-0">&nbsp;&nbsp;&nbsp; </span><span style="font-size:19px;font-family:宋体;letter-spacing:-0">第十七条&nbsp; 特殊慢性病患者就诊时，乙方应严格执行《哈尔滨市医疗保险特殊慢性病门诊治疗医疗费补贴暂行办法》等相关规定，不得超范围支付，</span><span style="font-size:19px;font-family:宋体">不得以任何理由拒绝患者在门诊享受特殊慢性病待遇。</span>
</p>
<p style="text-indent:37px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">第十八条&nbsp; </span><span style="font-size:19px;font-family:宋体">乙方医保医师为参保人员提供诊疗服务开具处方时，应将医保医师姓名及处方信息一并录入到医疗保险信息系统。非医保医师为参保人员诊疗所发生的费用，甲方不予支付（急诊、急救除外）。</span>
</p>
<p style="line-height:37px">
    <span style="font-size:19px;font-family:宋体">&nbsp;&nbsp;&nbsp; </span><span style="font-size:19px;font-family:宋体">第十九条&nbsp; 乙方应保证参保患者知情同意权，通过住院《温馨提示》等形式告知患者相关权利与义务，及时向参保人员提供门诊、住院费用结算清单和住院日费用清单,建立自费项目参保人员知情确认制度。</span>
</p>
<p style="text-indent:38px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">乙方向参保人员提供自费或部分支付的医疗服务，包括药品、诊疗项目和服务设施等，需征得本人或其家属同意并签字确认。由于未签自费协议而发生费用纠纷的，应由乙方承担责任</span><span style="font-size:19px;font-family:宋体">（急诊、急救除外）</span><span style="font-size:19px;font-family:宋体">。</span>
</p>
<p style="line-height:37px">
    <span style="font-size:19px;font-family:宋体">&nbsp;&nbsp;&nbsp; </span><span style="font-size:19px;font-family:宋体">第二十条&nbsp; 乙方应建立健全转诊、转院、转科制度，及时为符合转诊、转院、转科条件的参保患者按有关规定办理相关手续。严格控制年度内转出患者人数比例。</span>
</p>
<p style="line-height:37px">
    <span style="font-size:19px;font-family:宋体">&nbsp;&nbsp;&nbsp; </span><span style="font-size:19px;font-family:宋体">第二十一条&nbsp; 乙方应对参保人员在其他同级医疗机构所做的检查化验结果，实行互认，充分予以利用，避免不必要的重复检查。</span>
</p>
<p style="text-indent:39px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">第二十二条&nbsp; 乙方应执行门诊处方外配制度，满足参保人员外配处方要求。参保人员要求到药店购药时，乙方应按规定为参保人员提供外配处方。</span>
</p>
<p style="text-indent:39px;line-height:37px">
    <span style="font-size:19px;font-family:宋体;letter-spacing:-0">第二十三条&nbsp; 甲方建立出院参保患者回访抽查机制。乙方应及时将参保人员联系电话上传到医保系统，并保证留存的地址、电话等基本信息真实完整，如甲方回访发现乙方留存的相关信息不真实，核实后拒付相应结算费用。</span>
</p>
<p style="margin-top:16px;margin-right:0;margin-bottom:16px;margin-left:0;text-align:center;line-height:37px">
    <span style="font-size:21px;font-family:宋体">第三章&nbsp;&nbsp; 目录管理</span>
</p>
<p style="text-indent:38px;line-height:37px">
    <span style="font-size:19px;font-family:宋体;letter-spacing:-0">第二十四条&nbsp; 乙方应严格执行《黑龙江省基本医疗保险、工伤保险和生育保险药品目录（2010年版）》（以下简称《药品目录》）、医疗保险诊疗项目及医疗服务设施标准，超出目录或标准范围的费用，甲方不予支付，</span><span style="font-size:19px;font-family:宋体">乙方要书面向参保人员告知使用理由和费用标准。<span style="letter-spacing:-0">乙方按甲方要求及时进行医疗保险药品目录、诊疗项目和服务设施标准的调整。</span></span>
</p>
<p style="text-indent:38px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">营利性医疗保险定点医疗机构，应根据物价等部门制定的非营利性医疗机构相关标准收费。</span>
</p>
<p style="text-indent:38px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">1</span><span style="font-size:19px;font-family:宋体">、乙方要认真贯彻执行价格主管部门药品价格规定，不得随意提高药品价格。</span>
</p>
<p style="text-indent:38px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">2</span><span style="font-size:19px;font-family:宋体">、乙方应严格执行价格主管部门制定的医疗服务收费标准，按规定的项目和标准收费。甲方可通过与乙方谈判协商的方式对价格主管部门收费标准内价格实行弹性调整。</span>
</p>
<p style="text-indent:37px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">3</span><span style="font-size:19px;font-family:宋体">、乙方应保证为参保人员提供符合基本医疗保险服务范围和标准的住院床位。</span><span style="font-size:19px;font-family:宋体">住院床位总数</span><span style="font-size:19px;font-family:宋体">不得超过卫生计生部门《关于下发医疗机构基本标准（试行）的通知》规定的同级别最大床位数。</span>
</p>
<p style="text-indent:38px;line-height:37px">
    <span style="font-size:19px;font-family:宋体;letter-spacing:-0">第二十五条&nbsp; 乙方应按照规定配备和使用基本药物，优先和合理使用《药品目录》甲类药品。《药品目录》内药品配备率要达到85%以上，目录内药品使用率要达到80%以上。药品费用占住院总费用比例不超过<span style="font-size: 19px; font-family: 宋体; text-decoration: underline;">${options[4]}</span><span style="font-size:19px;font-family:宋体">%，其中目录内药品占药品总费用比例不低于85%。自费药品占药品总费用比例<span style="font-size: 19px; font-family: 宋体; text-decoration: underline;">${options[5]}</span><span style="font-size:19px;font-family:宋体">%以下。</span><span style="font-size:19px;font-family: 宋体">乙方被确认为城镇居民基本医疗保险门诊统筹定点医疗机构的，应按照国家及省相关规定配备和使用基本药物。</span>
</p>
<p style="text-indent:37px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">第二十六条&nbsp; 医师开具西药处方须符合西医疾病诊治原则，开具中成药处方须遵循中医辩证施治原则和理法方药，对于每一最小分类下的同类药品原则上不宜叠加使用。要采取措施鼓励医师按照先甲类后乙类、先口服制剂后注射制剂、先常释剂型后缓（控）释剂型等原则选择药品，鼓励药师在调配药品时首先选择相同品种剂型中价格低廉的药品。</span>
</p>
<p style="text-indent:37px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">对《药品目录》中限定使用范围的药品，乙方应严格执行，并提供相关佐证材料便于甲方核查。严格掌握药品适应症和用药原则，凡超出药品说明书适应症和使用量以外的用药，甲方不予支付费用。</span>
</p>
<p style="text-indent:38px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">第二十七条&nbsp; 乙方提供的药品应有小包装。参保人员出院时，乙方只能提供与疾病治疗有关的药品（限口服药），急性病不得超过7天量，慢性病不得超过15天量，品种数不得超过4个。不得带检查和治疗项目出院。 </span>
</p>
<p style="text-indent:38px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">第二十八条&nbsp; 甲方随时受理具有申报资质的定点医疗机构对目录内药品的补充申报，申报同时报送药品的定价依据相关材料。乙方使用经相关部门批准生产和核定价格且符合《药品目录》支付范围的医院内制剂，其费用甲方按规定予以支付，并限于乙方内部使用；医院制剂相关信息变更时，乙方应及时向甲方提出信息变更申请；乙方因未及时申报符合药品目录规定的药品，影响参保患者医疗待遇的，乙方应承担相应责任。</span>
</p>
<p style="text-indent:38px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">第二十九条&nbsp; 乙方购销存药品及耗材过程中，应严格按国家相关法律法规管理。乙方应当建立植入类医疗器械使用内部申请制度，永久保存并按规定向参保患者或甲方检查人员提供使用记录。</span>
</p>
<p style="text-indent:38px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">第三十条&nbsp; 乙方应遵守大型诊疗设备备案制度，严格掌握各项化验和检查的适应症，不能将特殊检查项目（如彩超、CT、MRI等）列为常规检查。应建立特殊检查项目内部申请审核制度，有关资料存档备查。甲方对特殊检查治疗实行阳性控制指标，CT&gt;60%、ECT&gt;70%、MRI&gt;70%。</span>
</p>
<p style="text-indent:37px;line-height: 37px">
    <span style="font-size:19px;font-family:宋体">第三十一条&nbsp; 乙方应当按照省和本统筹地区医疗服务项目和价格收费标准及其说明等规定进行收费。未经卫生计生部门和价格主管部门批准的项目不得收费，不得套用、提高收费标准或分解收费。</span>
</p>
<p style="text-indent:38px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">乙方经卫生计生和价格主管部门批准的新收费项目，应当凭批准文件和有关材料向甲方申请，双方对申请项目经协商谈判确定医保支付标准的,按医保支付标准执行；未经同意的，其费用甲方不予支付。</span><span style="font-size: 19px;font-family: 宋体">乙方以科研、临床验证为目的收治参保人员所发生的相关费用，甲方不予支付。</span>
</p>
<p style="margin-top:16px;margin-right:0;margin-bottom:16px;margin-left:0;text-align:center;line-height:37px">
    <span style="font-size:21px;font-family:宋体">第四章&nbsp; 费用结算管理</span>
</p>
<p style="line-height:37px">
    <span style="font-size:19px;font-family:宋体">&nbsp;&nbsp;&nbsp; </span><span style="font-size:19px;font-family:宋体">第三十二条&nbsp; 基本医疗保险基金实行预算管理，甲方在当年基金收入预算的基础上，根据近年医疗保险基金实际支付情况，结合参保人数、年龄结构、疾病谱变化、政策调整和待遇水平等因素，科学编制年度基金支出预算。经双方协商同意，住院医疗费用的费用给付标准如下：</span>
</p>
<p style="text-indent:37px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">1</span><span style="font-size:19px;font-family:宋体">、确定乙方为城镇职工基本医疗保险总额控制付费方式管理定点医疗机构，本年度住院统筹费用总额控制指标（以下简称为总控指标）为<span style="font-size: 19px; font-family: 宋体; text-decoration: underline;">${options[6]}</span><span style="font-size:19px;font-family:宋体">万元，将年度总控指标按12个月平均分配，实行按月申报，审核结算。乙方申报费用在月份额度内的，甲方按申报额支付；超出月份额度的，甲方按月份额度支付，超出部分甲方暂缓支付，年终清算时一并计算。甲方可在年度中期或年终清算方案中对上述额度作适当调整。原则上平均每一住院人次结算费用应控制在<span style="font-size: 19px; font-family: 宋体; text-decoration: underline;">${options[7]}</span><span style="font-size:19px;font-family:宋体">元。连续一个月以上没有住院费用结算的，总控指标按月核减。</span>
</p>
<p style="text-indent:37px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">乙方第四季度的住院人次及住院医疗费不得超出或低于前三个季度均数的15%，并与年终清算挂钩。</span>
</p>
<p style="text-indent:37px;line-height:33px">
    <span style="font-size:19px;font-family:宋体">2</span><span style="font-size:19px;font-family:宋体">、职工基本医疗保险甲方按年度平均每一住院人次结算费用<span style="font-size: 19px; font-family: 宋体; text-decoration: underline;">${options[8]}</span><span style="font-size:19px;font-family:宋体">元与乙方结算，实际费用高于或等于住院次均结算费用指标按住院次均结算费用指标结算，实际费用低于住院次均结算费用指标按指标结算，原则上一个年度内住院统筹费用总额应控制在不超过</span><span style="font-size:19px;font-family:宋体"><span style="font-size: 19px; font-family: 宋体; text-decoration: underline;">${options[9]}</span><span style="font-size:19px;font-family:宋体"></span><span style="font-size:19px;font-family:宋体">万元。居民基本医疗保险甲方按年度平均每一住院人次结算费用<span style="font-size: 19px; font-family: 宋体; text-decoration: underline;">${options[10]}</span><span style="font-size:19px;font-family:宋体">元与乙方结算。</span>
</p>
<p style="text-indent:37px;line-height:37px">
    <span style="font-size:19px;font-family:宋体;letter-spacing:-0">3</span><span style="font-size:19px;font-family:宋体;letter-spacing:-0">、精神类专科医院专科疾病治疗，城镇职工医疗保险平均住院床日费用按<span style="font-size: 19px; font-family: 宋体; text-decoration: underline;">${options[11]}</span><span style="font-size:19px;font-family:宋体">元结算，乙方年度总床日数不超过<span style="font-size: 19px; font-family: 宋体; text-decoration: underline;">${options[12]}</span><span style="font-size:19px;font-family:宋体">天；城镇居民医疗保险平均住院床日费用按<span style="font-size: 19px; font-family: 宋体; text-decoration: underline;">${options[13]}</span><span style="font-size:19px;font-family:宋体">元结算，乙方年度总床日数不超过<span style="font-size: 19px; font-family: 宋体; text-decoration: underline;">${options[14]}</span><span style="font-size:19px;font-family:宋体">天。按床日费用结算的精神病专科医院收治长期住院参保患者可每两个月做一次在院结算，结算费用必须为当次结算期内的全部费用。每年度末（12月31日前）将所有患者办理一次出院结算。</span>
</p>
<p style="text-indent:37px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">4</span><span style="font-size:19px;font-family:宋体">、</span><span style="font-size:19px;font-family:宋体">乙方为单病种结算定点医疗机构，可对符合规定的住院费用按单病种结算，甲方需根据级别不同规定统筹金支付额和个人负担限额，个人不设起付标准，治疗过程中不受基本医疗保险药品、诊疗项目和服务设施支付范围限制。应由医疗保险基金支付的，乙方记账后，按月向甲方申报结算。单病种结算费用记入总额控制指标统一清算。甲方应根据政策调整、物价上涨等因素，适时调整医保统筹支付标准。</span>
</p>
<p style="text-indent:37px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">5</span><span style="font-size:19px;font-family:宋体">、职工基本医疗保险统筹支付的费用包括基本医疗保险统筹基金、大额医疗救助金、公务员医疗补助金支付或部分支付的费用。居民医疗保险结算费用包括基本医疗保险统筹基金支付或部分支付的费用。</span>
</p>
<p style="text-indent:37px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">6</span><span style="font-size:19px;font-family:宋体">、</span><span style="font-size:19px;font-family:宋体">医疗照顾人员在乙方住院所发生的结算费用，统一纳入哈尔滨市城镇职工基本医疗保险基金结算申报表中，按照城镇职工基本医疗保险的付费方式和结算办法统一管理。年度终结后，医疗照顾人员超出普通参保患者住院待遇部分，如乙方发生住院超支情况，将给予相应补偿。</span>
</p>
<p style="text-indent:37px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">7</span><span style="font-size:19px;font-family:宋体">、城镇居民在乙方发生大病保险医疗费用，由乙方先行垫付，中国人寿保险股份有限公司黑龙江省分公司自接受甲方大病保险结算数据后的15个工作日内，将参保居民发生的大病保险医疗费用全额拨付乙方。甲方负责督促中国人寿保险股份有限公司黑龙江省分公司按时足额拨付乙方大病保险医疗费用。</span>
</p>
<p style="text-indent:37px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">第三十三条&nbsp; 乙方必须严格掌握入院标准和出院标准及</span><span style="font-size:19px;font-family:宋体">重症监护病房收治标准，</span><span style="font-size:19px;font-family:宋体">经双方协商：职工医疗保险以参保人员每百门(急)诊人次的比例核定住院结算人</span><span style="font-size:19px;font-family:宋体">次，乙方每百门(急)诊住院人次核定为<span style="font-size: 19px; font-family: 宋体; text-decoration: underline;">${options[15]}</span><span style="font-size:19px;font-family:宋体">，实际住院人次与住院人数之比核定为<span style="font-size: 19px; font-family: 宋体; text-decoration: underline;">${options[16]}</span><span style="font-size:19px;font-family:宋体">，按年度结算，超出部分甲方将根据实际情况核减结算人次。乙方要按照有关规定，年住院参保人员的次均费用中自费部分比例平均不得超过<span style="font-size: 19px; font-family: 宋体; text-decoration: underline;">${options[17]}</span><span style="font-size:19px;font-family:宋体">%，超过部分甲方在年终结算时扣除。同时，自费部分必须全额统计在《哈尔滨市职工（居民）医疗保险住院费用结算单》中。</span>
</p>
<p style="text-indent:37px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">第三十四条&nbsp; 甲方应认真执行《哈尔滨市城镇职工基本医疗保险费用结算暂行办法》的有关规定，城镇居民医疗保险结算方式参照城镇职工医疗保险有关规定执行</span><span style="font-size:21px;font-family:宋体">。</span><span style="font-size:19px;font-family:宋体">乙方不得减少或虚报服务数量、降低服务质量标准，不得将费用控制标准分解到每个具体参保患者。</span>
</p>
<p style="text-indent:37px;line-height:33px">
    <span style="font-size:19px;font-family:宋体">第</span><span style="font-size:19px;font-family:宋体">三十五条&nbsp; 乙方应按甲方下达的住院总控指标、住院次均费用定额结算指标、住院人次合理增长比例和自费比例等医疗费用控制指标管理，并应保证医疗质量，降低重复住院率、住院日均费用、平均住院日及药品费用占医疗费用比例等。因政策调整、医疗费用实际发生情况等原因造成乙方费用超支，年度终结后经甲方审核认定（扣减违规不合理费用），可根据当年基金收支实际情况，按照超支部分分担、结余全部次年留用原则，年度清算时制定相应具体医疗费用超支补偿方案。本年度住院超支部分分担补偿范围为：乙方年度总控指标（或住院次均结算总额）的10%左右，按阶梯式递减分担补偿。</span>
</p>
<p style="text-indent:37px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">第三十六条&nbsp; 甲乙双方应积极研究探索参保患者医疗费用结算支付方式，尽可能避免乙方垫付过多费用。</span><span style="font-size:19px;font-family:宋体">甲方及时审核并按规定向乙方拨付应由医疗保险基金支付的医疗费用。</span>
</p>
<p style="text-indent:38px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">第三十七条&nbsp; </span><span style="font-size:19px;font-family:宋体">甲方通过智能监控、实地检查等多种方式，对乙方提供的医疗服务进行监督审核，对于乙方发生的不合理费用，甲方有权拒付相关费用。乙方如有异议，可在接到拒付通知后20个工作日内向甲方作出书面说明，甲方根据实际情况进行相应处理。乙方违规行为涉及的项目费用，按照上传的违规项目整体费用计算。</span>
</p>
<p style="line-height:37px">
    <span style="font-size:19px;font-family:宋体">&nbsp;&nbsp;&nbsp; </span><span style="font-size:19px;font-family:宋体">第</span><span style="font-size:19px;font-family:宋体">三十八条&nbsp; 乙方应按照医保相关规定为参保人员即时结算医疗费用。参保人员在乙方就医结算时，只需交纳按规定应当由参保人员个人承担的费用，乙方应当开具专用票据。其余费用由甲方按本协议与乙方结算。乙方应向患者或家属出具由市医保信息系统提供的《哈尔滨市职工（居民）医疗保险住院费用结算单》、《哈尔滨市城镇居民大病保险住院结算单》及《医疗费用明细表》，并由参保患者或其家属签字确认，出院结算的费用总额必须与所有住院处方汇总费用相符。乙方应在72小时内为需要转院继续治疗的参保人员完成出院费用结算。</span>
</p>
<p style="text-indent:37px;line-height:37px">
    <span style="font-size: 19px;font-family: 宋体">第三十九条 </span><span style="font-size:19px;font-family:宋体">&nbsp;乙方确定为哈尔滨市统筹地区之外异地定点医疗机构的，原则上应按当地物价部门规定的医疗服务项目及价格规定执行，并与黑龙江省医疗服务价格项目相对应，高于黑龙江省价格标准的，差价部分由参保患者个人承担，低于黑龙江省价格标准的，应按实际价格录入。未列入黑龙江省医疗服务价格项目的，应由参保患者个人承担。</span>
</p>
<p style=";margin-bottom:0;text-align:justify;text-justify: inter-ideograph;line-height:37px">
    <span style="font-size:19px">&nbsp;&nbsp;&nbsp; </span><span style="font-size:19px">第四十条 &nbsp;甲方每月按乙方申报确认的医保支付金额的90%拨付，另10%部分年终经考核评分后一次拨付。乙方须于每月初前5个工作日（节假日顺延）核对上月发生的结算数据，无误后要及时进行网上申报确认。当月未发生业务的也需按要求进行网上申报确认。</span><span style="font-size:19px">乙方需指定一名操作员专门负责医保网上申报结算确认工作，并且要求实名制录入相关信息。因乙方原因网上申报不及时的，甲方将暂停拨付相关费用，待乙方申报确认报告甲方后，年度终结清算前拨付；上年度申报数据次年2月份仍未申报的，由系统按上传中心数据统一自动确认。</span><span style="font-size:19px;color:windowtext">乙方应在1月前5个工作日（节假日顺延）报送</span><span style="font-size:19px;color:windowtext">上年度数据纸介结算报表，</span><span style="font-size:19px">未及时报送的，暂缓拨付月结算费用。甲方应为乙方提供本年度和上年度费用发生及拨付情况的查询服务。</span>
</p>
<p style="line-height:37px">
    <span style="font-size:19px;letter-spacing: -0">&nbsp;&nbsp;&nbsp; </span><span style="font-size:19px;letter-spacing:-0">第四十一条&nbsp;</span><span style="text-indent: 37px; font-size: 19px; font-family: 宋体;">乙方进行住院退结算操作，应向甲方提出书面申请，甲方批准后方可进行。</span><span style="text-indent: 37px; font-size: 19px; font-family: 宋体;">如因退结算导致乙方当月申报数据出现负值，甲方将在乙方未支付的费用中予以扣除。</span>
</p>
<p style="text-indent:37px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">经甲方核实的乙方违规行为涉及的结算费用统筹支付为零的，按照乙方定额结算指标或上年度人均费用核定。</span>
</p>
<p style="text-indent:37px;line-height:37px">
    <span style="font-size:19px">第四十二条&nbsp;</span><span style="font-family: 宋体; font-size: 19px; text-indent: 43px;">职工基本医疗保险参保人员处于欠费封锁状态住院治疗时，乙方应按正常状态录入医保系统，并按医保患者相关规定统一管理。出院时仍处于封锁状态的，应在医保系统内自费结算。</span>
</p>
<p style="text-indent:39px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">第四十三条 乙方如发生医疗纠纷或医疗责任事故，应自发生之日起15日内以书面形式通知甲方。在医疗事故鉴定委员会做出是否属于医疗事故之前，该纠纷涉及的费用，甲方暂不予支付。经认定为医疗事故的，由于医疗事故及其后续治疗所产生的医疗费用甲方不予支付。</span>
</p>
<p style="text-indent:43px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">第四十四条&nbsp;</span><span style="font-size:19px;font-family:宋体">解除</span><span style="font-size:19px;font-family:宋体">定点服务</span><span style="font-size:19px;font-family:宋体">协议的</span><span style="font-size:19px;font-family:宋体">，乙方自收到《哈尔滨城镇职工（居民）基本医疗保险清算告知单》之日起十个工作日内完成未申报和未结算费用的处理工作；超过十个工作日仍未申报确认的费用，甲方将统一审核确认；仍在院未结算的相关费用数据，甲方将作为无效数据予以处理。</span>
</p>
<p style="text-indent:37px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">第四十五条&nbsp;<span style="letter-spacing:-0">乙方对于15日内非急诊、急救的以同一疾病入同一所医院的患者所发生的费用，按一次住院结算指标核算。参保人员住院发生的医疗费用不足定点医疗机构相应起付标准的，不计算一个平均住院结算人次指标</span>。</span>
</p>
<p style="text-indent:37px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">第四十六条 乙方应采取有效措施减轻参保患者的个人负担。在其住院期间不得诱导参保患者到院外购买药品、器械等方式增加患者个人负担。</span>
</p>
<p style="text-indent:36px;line-height: 37px">
    <span style="font-size:19px;font-family:宋体;letter-spacing:-0">第四十七条</span><span style="font-size:19px;font-family:宋体;letter-spacing:-0">&nbsp;</span><span style="font-size:19px;font-family:宋体">甲方根据医疗保险政策和本协议指标以及参保人员满意度等内容对乙方医疗保险医疗服务进行年度考评。甲方可以委托第三方就参保人员满意度进行调查。</span>
</p>
<p style="margin-top:16px;margin-right:0;margin-bottom:16px;margin-left:0;text-align:center;line-height:37px">
    <span style="font-size:21px;font-family:宋体">第五章&nbsp; 信息传输管理</span>
</p>
<p style="text-indent:37px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">第四十八条&nbsp; 甲乙双方应满足对方的信息安全管理要求，保证双方信息系统的安全性及可靠性。甲方应保障医疗保险信息系统中参保人员信息、政策参数等基础信息的准确性。乙方必须具备规范的医院管理信息系统（以下简称：HIS系统），并积极推进HIS系统接口建设工作，保证信息系统符合甲方的技术和接口标准，在规定时限内实现与医保信息系统有效对接。乙方应及时做好因医疗保险政策及业务流程调整带来的HIS系统升级工作。</span>
</p>
<p style=";margin-bottom:0;text-align:justify;text-justify: inter-ideograph;text-indent:37px;line-height:37px">
    <span style="font-size:19px">乙方应将参保人员基本住院信息在入院24小时（节假日顺延）内及时上传。因医保卡丢失、欠费补费等特殊情况急需住院治疗的，经医院医保办核实后可延长至七个工作日。乙方应如实准确的录入参保患者入院及出院诊断信息，存在多个诊断的，应一并上传。</span>
</p>
<p style="text-indent:37px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">第四十九条 甲乙双方应当严格遵守国家、省、市信息系统安全管理的相关规定。双方应协调做好医保信息系统的安全工作，保障网络畅通、系统稳定运行，确保数据传输高效、参保人员结算方便快捷，保证参保人员基本信息和结算信息的完整性、准确性和安全性。乙方须及时准确录入、传送参保患者的数据，并确保传送数据与实际发生费用的一致性。甲乙双方不得泄露参保人员参保就医等有关信息。</span>
</p>
<p style="text-indent:37px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">第五十条 甲乙双方信息系统出现故障，应有应急对策，双方均有义务向参保人做好解释工作，不得推诿、扯皮。</span>
</p>
<p style="line-height:37px">
    <span style="font-size:19px;font-family:宋体">&nbsp;&nbsp;&nbsp; </span><span style="font-size:19px;font-family:宋体">第五十一条 甲方负责医疗保险计算机管理系统的软件开发、网络建设和对相关人员培训。乙方应设置信息管理科室，明确专人负责信息系统管理及设备的保养和维护。信息管理科室应与医保科室相互配合，明确岗位职责，合理设置信息系统管理权限。通讯费、终端设备及维修费用由乙方负担。</span>
</p>
<p style="margin-top:16px;margin-right:0;margin-bottom:15px;margin-left:0;text-align:center;line-height:37px">
    <span style="font-size:21px;font-family:宋体">第六章&nbsp; 违约责任</span>
</p>
<p style="text-indent:37px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">第五十二条 甲方有下列情形之一的，乙方可要求甲方纠正，或提请人力资源和社会保障行政部门督促甲方整改：</span>
</p>
<p style="text-indent:37px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">1</span><span style="font-size:19px;font-family:宋体">、未及时告知乙方医疗保险政策和管理制度、操作流程变化情况的。</span>
</p>
<p style="text-indent:37px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">2</span><span style="font-size:19px;font-family:宋体">、未按本协议规定进行医疗费用结算的。</span>
</p>
<p style="text-indent:37px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">3</span><span style="font-size:19px;font-family:宋体">、工作人员违反《社会保险工作人员纪律规定》的。</span>
</p>
<p style="text-indent:37px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">4</span><span style="font-size:19px;font-family:宋体">、其他违反基本医疗保障法律、法规行为的。</span>
</p>
<p style="text-indent:37px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">第五十三条 甲方可根据乙方违约情节的轻重，予以约谈乙方主要负责人、限期整改、通报批评、暂缓拨付、拒付费用、扣除定额结算指标（指实行定额结算的定点医疗机构）、暂停服务、解除协议、移交人力资源和社会保障行政部门等处理。</span>
</p>
<p style="text-indent:37px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">1</span><span style="font-size:19px;font-family:宋体">、过度检查、过度治疗，违反用药管理规定、超适应症用药，或违反物价政策、分解收费的；</span>
</p>
<p style="text-indent:37px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">2</span><span style="font-size:19px;font-family:宋体">、将基本医疗保险范围外的医疗费用纳入医保支付的,串换医保目录内外项目，申报与实际使用不符，虚构服务量的；</span>
</p>
<p style="text-indent:37px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">3</span><span style="font-size:19px;font-family:宋体">、</span><span style="font-size: 19px;font-family: 宋体">隐瞒事实或阻挠甲方监督、管理工作，不及时按甲方要求提供医疗服务相关资料的；</span>
</p>
<p style="text-indent:37px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">4</span><span style="font-size:19px;font-family:宋体">、将甲方因乙方违规行为而拒付的费用，转嫁于参保患者的； </span>
</p>
<p style="text-indent:37px;line-height:33px">
    <span style="font-size:19px;font-family:宋体">5</span><span style="font-size:19px;font-family:宋体">、挂床住院、分解住院，将不符合入院标准的参保人员收治入院，推诿符合入院标准的参保人员入院治疗，将不符合出院标准的患者催赶出院或令其自费住院 </span><span style="font-size: 19px;font-family: 宋体">，将住院期间需院内转科治疗的参保人员，办理中途出院结算手续的；</span>
</p>
<p style="text-indent:37px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">6</span><span style="font-size:19px;font-family:宋体">、</span><span style="font-size: 19px;font-family: 宋体">以医保定点名义从事商业广告和促销活动，诱导</span><span style="font-size:19px;font-family:宋体">不符合入院标准的参保人员就医的；</span>
</p>
<p style="line-height:37px">
    <span style="font-size:19px;font-family:宋体">&nbsp;&nbsp;&nbsp; 7</span><span style="font-size:19px;font-family:宋体">、通过冒名顶替就医、伪造医疗文书或凭证等手段，骗取医保基金的；</span>
</p>
<p style="text-indent:37px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">8</span><span style="font-size:19px;font-family:宋体">、使用假、劣药品或医用材料的；</span>
</p>
<p style="text-indent:37px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">9</span><span style="font-size:19px;font-family:宋体">、将科室或房屋承包、出租给个人或其他机构，并以本医疗机构名义开展诊疗活动，且发生医保费用结算的；</span>
</p>
<p style="text-indent:37px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">10</span><span style="font-size:19px;font-family:宋体">、私自联网并申请结算有关医保费用、为未取得医保定点资格的医疗机构提供医保结算服务，或超出《医疗机构执业许可证》准许范围、执业地址提供医疗服务项目，并发生医保费用结算的；</span>
</p>
<p style="line-height:37px">
    <span style="font-size:19px;font-family:宋体">&nbsp;&nbsp;&nbsp; 11</span><span style="font-size:19px;font-family:宋体">、其他违反医疗保险政策规定，造成医疗保险基金损失或造成严重社会影响的。</span>
</p>
<p style="text-indent:37px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">第五十四条 甲方在监管过程中，发现乙方存在严重违规情况时，可委托第三方机构进行延伸检查。</span>
</p>
<p style="text-indent:37px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">第五十五条 甲方可根据乙方医保医师违约情节的轻重，对乙方医保医师予以扣分、约谈、通报、暂停服务资格、取消申请资格等处理。甲方可将发生严重违规问题的乙方医保医师相应情况通报卫生计生部门。</span>
</p>
<p style="text-indent:38px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">第五十六条 乙方停业、歇业或迁移经营地址时间超过3个月未发生医保费用结算的，解除服务协议。</span>
</p>
<p style="text-indent:37px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">第五十七条 收治参保患者住院的定点医疗机构连续12个月没有发生医保住院费用结算，甲方停止乙方收治参保患者住院服务。1年内不再受理住院申请。</span>
</p>
<p style=";margin-bottom:0;text-align:justify;text-justify:inter-ideograph;text-indent:37px;line-height:37px">
    <span style="font-size:19px">第五十八条 乙方发生以下情况，甲方解除服务协议，1年内不再受理定点申请。</span>
</p>
<p style=";margin-bottom:0;text-align:justify;text-justify:inter-ideograph;text-indent:37px;line-height:37px">
    <span style="font-size:19px">1</span><span style="font-size:19px">、没有按时签订本年度服务协议的，并超过规定签署时间一个月以上仍未签署的。</span>
</p>
<p style=";margin-bottom:0;text-align:justify;text-justify:inter-ideograph;text-indent:37px;line-height:37px">
    <span style="font-size:19px">2</span><span style="font-size:19px">、主动放弃医疗保险定点的。</span>
</p>
<p style=";margin-bottom:0;text-align:justify;text-justify:inter-ideograph;text-indent:37px;line-height:37px">
    <span style="font-size:19px">3</span><span style="font-size:19px">、连续12个月无医疗保险业务的。</span>
</p>
<p style=";margin-bottom:0;text-align:justify;text-justify:inter-ideograph;text-indent:37px;line-height:37px">
    <span style="font-size:19px">4</span><span style="font-size:19px">、未按规定向甲方申报随意变更经营地址的。</span>
</p>
<p style=";margin-bottom:0;text-align:justify;text-justify:inter-ideograph;text-indent:37px;line-height:37px">
    <span style="font-size:19px">5</span><span style="font-size:19px">、违反协议管理有关规定被暂停服务2次的。</span>
</p>
<p style=";margin-bottom:0;text-align:justify;text-justify:inter-ideograph;text-indent:37px;line-height:37px">
    <span style="font-size:19px">6</span><span style="font-size:19px">、</span><span style="font-size:19px">暂停服务期间未进行及时、有效整改的。</span>
</p>
<p style=";margin-bottom:0;text-align:justify;text-justify:inter-ideograph;text-indent:37px;line-height:37px">
    <span style="font-size:19px">7</span><span style="font-size:19px">、乙方被确定为定点医疗机构2个月内无法安装医保专线，未配备完善的软、硬件的。</span>
</p>
<p style=";margin-bottom:0;text-align:justify;text-justify:inter-ideograph;text-indent:37px;line-height:37px">
    <span style="font-size:19px">第五十九条 乙方发生以下情况，甲方解除服务协议，2年内不再受理定点申请。 </span>
</p>
<p style=";margin-bottom:0;text-align:justify;text-justify:inter-ideograph;text-indent:37px;line-height:37px">
    <span style="font-size:19px">1</span><span style="font-size:19px">、因违反协议管理有关规定被解除服务协议重新申请定点后，再次被暂停服务的。</span>
</p>
<p style=";margin-bottom:0;text-align:justify;text-justify:inter-ideograph;text-indent:37px;line-height:37px">
    <span style="font-size:19px">2</span><span style="font-size:19px">、提供虚假定点申请材料的。</span>
</p>
<p style=";margin-bottom:0;text-align:justify;text-justify:inter-ideograph;text-indent:37px;line-height:37px">
    <span style="font-size:19px">3</span><span style="font-size:19px">、年度内发生三次及以上医疗事故并造成严重后果的。</span>
</p>
<p style=";margin-bottom:0;text-align:justify;text-justify:inter-ideograph;text-indent:37px;line-height:37px">
    <span style="font-size:19px">4</span><span style="font-size:19px">、乙方受到卫生计生部门吊销《医疗机构执业许可证》处罚的。</span>
</p>
<p style="text-indent:37px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">5</span><span style="font-size:19px;font-family: 宋体">、其他造成严重后果或重大影响的违规行为。</span>
</p>
<p style="text-indent:37px;line-height: 37px">
    <span style="font-size:19px;font-family:宋体">第六十条</span><span style="font-size:19px;font-family:宋体">&nbsp; </span><span style="font-size:19px;font-family:宋体">如因</span><span style="font-size:19px;font-family:宋体">乙方涉及民事、行政诉讼或者刑事案件，甲方被相关司法部门列为被执行人或者协助执行人的，或者其他影响甲方正常工作的情形，甲方可单方决定暂停或终止本协议，因此所造成的损失由乙方承担。</span>
</p>
<p style="margin-top:16px;margin-right:0;margin-bottom:16px;margin-left:0;text-align:center;line-height:37px">
    <span style="font-size:21px;font-family:宋体">第七章&nbsp; 附则</span>
</p>
<p style="text-indent:37px;line-height: 37px">
    <span style="font-size:19px;font-family:宋体;color:windowtext">第六十一条</span><span style="font-size:19px;color:windowtext">&nbsp;</span><span style="font-size:19px;font-family:宋体;color:windowtext">协议执行期间，国家法律、法规和政策有调整的，应按新的规定执行。若新规定与本协议不一致时，经双方协商，可按照新规定对本协议进行修改和补充，其效力与本协议同等。</span>
</p>
<p style="text-indent:37px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">第六十二条</span><span style="font-size:19px">&nbsp;</span><span style="font-size:19px;font-family:宋体">协议执行过程中发生的争议，应首先通过协商解决。双方协商不成的，由人力资源和社会保障行政部门提出处理意见或依法进行仲裁。对人力资源和社会保障行政部门提出的处理意见不服的，可以提起行政诉讼。</span>
</p>
<p style=";margin-bottom:0;text-align:justify;text-justify: inter-ideograph;line-height:37px">
    <span style="font-size:19px;color:windowtext">&nbsp;&nbsp;&nbsp; </span><span style="font-size:19px;color:windowtext">第六十三条 本协议有效期自${protocol.WQ_TIME}起至${protocol.WQ_YEAR}年12月31日止。</span>
</p>
<p style=";margin-bottom:0;text-align:justify;text-justify: inter-ideograph;text-indent:37px;line-height:37px">
    <span style="font-size:19px;color:windowtext">第</span><span style="font-size:19px">六十四</span><span style="font-size:19px;color:windowtext">条&nbsp;</span><span style="font-size:19px">协议执行期间，国家法律、法规有调整的，甲乙双方按照新规定执行本协议，如无法达成协议，双方可解除协议。</span>
</p>
<p style="text-indent:37px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">第六十五条 协议期间，甲乙双方无论以何种理由解除协议，必须提前3个月通知对方；甲方可根据对乙方履行协议情况的考评结果，作出续签或缓签</span><span style="font-size:19px;font-family:宋体">下年度协议的决定，并通知乙方。</span>
</p>
<p style="text-indent:37px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">第六十六条 本协议未尽事宜，经甲乙双方同意，以换文形式进行补充，效力与本协议相同。</span>
</p>
<p style="text-indent:37px;line-height:37px">
    <span style="font-size:19px;font-family:宋体">第六十七条&nbsp;</span><span style="font-size:19px;font-family:宋体">本协议一式两份，甲乙双方各执一份，具有同等效力。</span>
</p>
<p style=";margin-bottom:0;text-align:justify;text-justify: inter-ideograph;line-height:33px">
    <span style="font-size:19px;color:windowtext">&nbsp; &nbsp; 附件：《</span><span style="font-size:19px">哈尔滨市医疗、工伤、生育定点医疗机构服务质量考核办法》</span>
</p>
<p style=";margin-bottom:0;text-align:justify;text-justify: inter-ideograph;line-height:33px">
    <span style="font-size:19px;color:windowtext">&nbsp;</span>
</p>
<p style=";margin-bottom:0;text-align:justify;text-justify: inter-ideograph;line-height:33px">
    <span style="font-size:19px;color:windowtext">&nbsp; &nbsp; 甲方：${protocol.WQ_JINSTITUTION} &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 乙方：${protocol.WQ_AKB021}</span>
</p>
<p style=";margin-bottom:0;text-align:justify;text-justify: inter-ideograph;text-indent:103px;line-height:33px">
    <span style="font-size:19px;color:windowtext">&nbsp;</span>
</p>
<p style=";margin-bottom:0;text-align:justify;text-justify: inter-ideograph;text-indent:103px;line-height:33px">
    <span style="font-size:19px;color:windowtext">（盖章） &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;（盖章）</span>
</p>
<p style="text-indent:65px;line-height:33px">
    <span style="font-size:19px;font-family:宋体">法人代表： &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;法人代表：</span>
</p>
<p style="text-indent:103px;line-height:33px">
    <span style="font-size:19px;font-family:宋体">${protocol.WQ_JNAME}　　　　　&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${protocol.WQ_NAME}</span>
</p>
<p style="text-indent:65px;line-height:33px">
    <span style="font-size:19px;font-family:宋体"></span><span style="font-size:19px;font-family:宋体">${protocol.WQ_JDATE}　　　　　&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${protocol.WQ_YDATE}</span>
</p>
<p style="text-align:center;text-indent:43px">
    <strong><span style="font-size:21px;font-family:仿宋_GB2312">&nbsp;</span></strong>
</p>
<p>
    <br/>
</p>
</body>
</html>