<%@LANGUAGE="VBSCRIPT" CODEPAGE="950"%>
<!--#include virtual="/include/egrpDSN.inc"-->
<%
freezesize = Request("freezesize")'0
' freezesize = 2
if freezesize = "" then
	freezesize = 0
end if
note = false
' note = true
%>
<html>
	<head>
		<style type="text/css">
		.GridviewScrollC1Header TH, .GridviewScrollC1Header TD 
		{ 
			padding: 5px; 
			font-weight: bold; 
			white-space: nowrap; 
			border-right: 1px solid #F0F0F0; 
			border-bottom: 1px solid #F0F0F0; 
			background-color: #999999; 
			color:#FFFFFF; 
			text-align: left; 
			vertical-align: bottom; 
		} 
		.GridviewScrollC1Item TD 
		{ 
			padding: 5px; 
			white-space: nowrap; 
			border-right: 1px solid #F0F0F0; 
			border-bottom: 1px solid #F0F0F0; 
			background-color: #FFFFFF; 
		} 
		.GridviewScrollC1Pager  
		{ 
			border-top: 1px solid #AAAAAA; 
			background-color: #FFFFFF; 
		} 
		.GridviewScrollC1Pager TD 
		{ 
			padding-top: 3px; 
			font-size: 14px; 
			padding-left: 5px; 
			padding-right: 5px; 
		} 
		.GridviewScrollC1Pager A 
		{ 
			color: #666666; 
		} 
		.GridviewScrollC1Pager SPAN 
		{ 
			font-size: 16px; 
			font-weight: bold; 
		}
		/*�ᵲend*/
		
		<% if freezesize = 0 then%>
		/*�C����*/
        #GridView1 div.arrow { background:transparent url(images/arrows.png) no-repeat scroll 0px -16px; width:16px; height:16px; display:block;}
        #GridView1 div.up { background-position:0px 0px;}
		/*�C����end*/
		<%end if%>
		
		/*���*/
			
		
		#accordion {
				border: 1px solid #1F669B;
				width: 600px;
				height: 310px;
				font-family: Trebuchet MS, Arial, Helvetica, sans-serif;
				font-size: 11px;
				position:relative !important;
				display:block;
				overflow:hidden;
				background-repeat:no-repeat;
				background-position:top left;
		}
		
		h3 {
				font-size: 12px;
				padding: 6px 6px 4px 35px;
				margin: 0;
				color:#fff;
				border-bottom:1px solid #333333;
				cursor:pointer;
				display:block;
				background-image:url(images/tab-left.gif);
				background-position:top left;
				background-repeat:no-repeat;
		}
		
		#visible {
				background-image:url(images/tab-left-active.gif);
				border-bottom:1px solid #DA1074;
		}
		
		.panel_body {
				height:150px;
				background-color:#333333;
				display:block;
				position:relative;
				color:#FFFFFF;
		}
		
		.panel_body div {
				padding:3px 5px;
		}
		
		.panel_container{
			bottom:0px;
			margin:0px;
			padding:0px;
			background-image:url(images/tab-right.gif);
			background-position:top right;
			background-repeat:repeat-x;
			background-color:#333333;
		}
		.wrapper{
			bottom:0px;
			position:absolute;
		}
		
		</style>
		
		<script type="text/javascript" src="script/jquery.js"></script>
		<script type="text/javascript" src="script/jquery-ui.min.js"></script>
		<!--�ᵲ-->
		<script type="text/javascript" src="script/gridviewScroll.min.js"></script>
		<link rel="stylesheet"  href="css/GridviewScroll.css"/>
		<!--�]���O-->
		<script type="text/javascript" src="script/jquery.vticker.js"></script>
		
		<!--�p�T��-->
		
		<script src="script/sticky.full.js" type="text/javascript"></script>
		<link href="css/sticky.full.css" rel="stylesheet" type="text/css" />
		
		<!--���-->		
		<script type="text/javascript">  
			$(document).ready(function () {  
				
				//�ᵲ
				gridviewScroll();
				
				<% if freezesize = 0 then%>
				//�C����
				$("#GridView1 tr:odd").addClass("odd");
				$("#GridView1 tr:not(.odd)").hide();
				//$("#GridView1 tr:first-child").show();
				
				$("#GridView1 tr.odd").click(function(){
					$(this).next("tr").toggle();
					$(this).find(".arrow").toggleClass("up");
				});
				
				/*
					�Y���󶰦X���A�Ҧ����ƭӪ�����
					�Ҧp�G�Ҧ�tr���A���ƭ�
					$('tr:even')
					�Y���󶰦X���A�Ҧ��_�ƭӪ�����
					�Ҧp�G�Ҧ�tr���A�_�ƭ�
					$('tr:odd')
					�̷�index������A�ŦX���󪺲ĴX�ӡCindex�q0�}�l
					�Ҧp�Gtr���X�����ĤG��
					$('tr:eq(1)')
				*/
				<%end if%>
				
				//�]���O	
				$('#news-container').vTicker({ 
					speed: 500,
					pause: 3000,
					showItems: 3,
					animation: 'fade',
					mousePause: false
					/*
					speed -�u�ʰʵe���t��(default 700)
					pause -�u�ʵ��ݮɶ�(default 4000)
					showItems -���h�ֶ���� (default 2)
					animation -�ưʰʵe�CTo fade in/fade out use a value ��fade��
					mousePause -����u�ʹ����a��(default true)
					height -�]�mvTicker�e�����סC�]�N�T�ΩҦ����~�۰ʰ��׭p��C���O�i�ΨӧR�����ؤ������Ŷ��t�Z�C(default 0 �V it means off)
					direction  -���Ӥ�V���Ҧ����ط|���ʡC��up�� and ��down��. (default ��up��)
					*/
				});
					$('#news-container1').vTicker({
					speed: 700,
					pause: 4000,
					showItems: 1,
					animation: 'fade',
					mousePause: false
				});
				
				
			});  
			//�ᵲ
			function gridviewScroll() {  
				$('#GridView1').gridviewScroll({  
					width: 500,  
					height: 400,  
					freezesize: "<%=freezesize%>" ,
					headerrowcount: 1//,
					//bar �����]�w
					/*
					varrowtopimg: "images/arrowvt.png",
					varrowbottomimg: "images/arrowvb.png",
					harrowleftimg: "images/arrowhl.png",
					harrowrightimg: "images/arrowhr.png",
					railcolor: "#F0f0F0",
					barcolor: "#CDCDCD",
					barhovercolor: "#606060",
					bgcolor: "#F0F0F0",
					arrowsize: 30,
					railsize: 16,
					barsize: 8
					*/
					/*
					width: �e��  
					height: ����,  
					freezesize: ����ᵲ����� �w�]�O0
					headerrowcount: �W��ᵲ���C �w�]�O1
					varrowtopimg: �V�W���ϥ�
					varrowbottomimg:�V�U���ϥ�
					harrowleftimg: �V�����ϥ�
					harrowrightimg: �V�k���ϥ�
					railcolor: ���b�y�D�C��
					barcolor: ���b�C��
					barhovercolor: bar���/�I��ɪ��C��
					bgcolor: ���b�y�D�~�C��
					arrowsize: ��V�ϥ� �j�p
					railsize: ���b�y�D�j�p
					barsize: ���b�j�p
					*/
				});  
			}  
			//�p�T��
			function stickytester(note, options) {
				$.sticky(note, options, function(r) { 
					$('#results').html(JSON.stringify(r));
				});
			}
			function check_news() {
				$.ajax({
					url: 'StickyNotes.asp',
					success: function(response) {
						$.sticky(response);
					}
				});
			}
		</script> 
		
	</head>
	<body>
	<a href="http://gridviewscroll.aspcity.idv.tw/Documentation.aspx" target="_blank">�ᵲ</a >
	<a href="http://www.jankoatwarpspeed.com/expand-table-rows-with-jquery-jexpand-plugin/" target="_blank">�C����</a >
	<a href="http://www.jugbit.com/jquery-vticker-vertical-news-ticker/" target="_blank">�T������</a >
	<a href="http://thrivingkings.com/read/Sticky-A-super-simple-notification-system-built-with-jQuery" target="_blank">�p�T��</a >
	<a href="tabslide.asp" target="_blank">�T������(���)</a >
	<a href="StickyNotes.asp" target="_blank">�K�Q�K</a >
	<%if freezesize <> 0 and freezesize <> 2 then%>
	<div id="div_1">
		<div id="news-container1" >
				<ul>
					<li>News content1</li>
					<li>News content2</li>
					<li>News content3</li>
					<li>News content4</li>
					<li>News content5</li>
				</ul>
		</div>
		<div style="overflow: hidden; position: relative; height: 114px;" id="news-container">
			<ul style="position: absolute; margin: 0pt; padding: 0pt; top: 0px;">
				 
				 
				   
				<li style="margin: 0pt; padding: 0pt; height: 38px; display: list-item;">
					<div>
						4) jugbit.com jquery vticker more info more info more info more info more info
					</div>
				</li>
			<li style="margin: 0pt; padding: 0pt; height: 38px; display: list-item;">
					<div>
						1) Lorem ipsum dolor sit amet, porta at, imperdiet id neque. more info
					</div>
				</li><li style="margin: 0pt; padding: 0pt; height: 38px; display: list-item;">
					<div>

						2) Lorem ipsum dolor sit amet, consectetur adipiscing elit. more info
					</div>
				</li><li style="margin: 0pt; padding: 0pt; height: 38px;">
					<div>
						3) Lorem ipsum dolor sit amet more info more info more info more info
					</div>
				</li></ul>
		</div>
	</div>
	
	
	
	<li class="tryit" onclick="stickytester('<b>Can you see me?</b> I bet you\'re feeling warm and fuzzy inside right now.');">$.sticky('&lt;b>Can you see me?&lt;/b>...');</li>
	<li class="tryit" onclick="stickytester('Upload complete');">$.sticky('Upload complete');</li>
	<li class="tryit" onclick="stickytester('<b>You have a new message!</b>');">$.sticky('&lt;b>You have a new message!&lt;/b>');</li>
	
	<%else%>
	
	

<%
		sql = "select tremp.comp_cd,trcomp.comp_anm,tremp.dept_cd,trdept.dept_nm,tremp.emp_cd,emp_cnm,brth_dt,POST_NM "
		sql = sql & " from tremp "
		sql = sql & " left join trdept on  tremp.dept_cd = trdept.dept_cd  "
		sql = sql & " left join trcomp on tremp.comp_cd = trcomp.comp_cd "
		Set RS = Server.CreateObject("ADODB.RecordSet")
		RS.open sql,egrpDSN,1,1
%>
		<table id="GridView1" style="white-space: nowrap;width:100%;border-collapse:collapse;">
			<tr class="GridviewScrollC1Header">
			<%if freezesize = 0 then%>
				<td></td>
			<%end if%>
				<td>���u�N�X</td>
				<td>���u�W��</td>
				<td>�����q�N�X</td>
				<td>�����q²��</td>
				<td>�����N�X</td>
				<td>�����W��</td>
				<td>�ͤ�</td>
				<td>¾��</td>
			</tr>
<%
		if not rs.eof then
			if freezesize <> 0 then
				bg = "background-color: #EFEFEF;"
			end if
			do until rs.eof
%>
			<tr class="GridviewScrollC1Item">
			<%if freezesize = 0 then%>
				<td><div class="arrow"></div></td>
			<%end if%>
				<td style="<%=bg%>"><%=rs("emp_cd")%></td>
				<td style="<%=bg%>"><%=rs("emp_cnm")%></td>
				<td><%=rs("comp_cd")%></td>
				<td><%=rs("comp_anm")%></td>
				<td><%=rs("dept_cd")%></td>
				<td><%=rs("dept_nm")%></td>
				<td><%=rs("brth_dt")%></td>
				<td><%=rs("POST_NM")%></td>
			</tr>
			<%if freezesize = 0 then
				sSQL = "Select * From TREMP Where EMP_CD = '"&rs("emp_cd")&"'"
				Set cnta_RS = Server.CreateObject("ADODB.RecordSet")
				cnta_RS.open sSQL,egrpDSN,1,1
				EMP_IMG = null
				if not cnta_RS.eof then
				EMP_IMG = Trim(cnta_RS("EMP_IMG"))
				end if
			%>
			<tr class="GridviewScrollC1Item">
				<td colspan="9">
					<ul>
						<li><%If Not IsNull(EMP_IMG) Then%><img src="/include/MShowPhoto.asp?Table_Name=TREMP&Table_ID=EMP_CD&PROD_ID=<%=rs("emp_cd")%>&IMG=EMP_IMG" width="115" height="150" border="0"><%End If%> </li>
						<li class="tryit" ><%=rs("brth_dt")%></li>
						<li class="tryit" ><%=rs("POST_NM")%></li>
					</ul>
				</td>
			</tr>
<%			end if
			rs.movenext
			loop
		end if
%>
		</table>
		
	<%end if%>
		
	<div id="accordion" style="display:none">

	������

		<div class="panel_container" id="panel1">
			<h3 id="visible">Panel 1</h3>
			<div id="panel1-body" class="panel_body">
				<div>
					<ul>
						<li>a</li>
						<li>b</li>
						<li>c</li>
					</ul>
				</div>
			</div>
		</div>

		<div class="panel_container" id="panel2">

			<h3>Panel 2</h3>
			<div id="panel2-body" class="panel_body">
				<div>        
					<ul>
						<li>i</li>
						<li>ii</li>
						<li>iii</li>
					</ul>
				</div>
			</div>
				
		</div>

		<div class="panel_container" id="panel3">
			<h3>Panel 3</h3>
			<div id="panel3-body" class="panel_body">
				<div>
					<ul>
						<li>1</li>
						<li>2</li>
						<li>3</li>
					</ul>
				</div>
			</div>
		</div>

		<div class="panel_container" id="panel4">
			<h3>Panel 4</h3>
			<div id="panel4-body" class="panel_body">
				<div>
					<ul>
						<li>��</li>
						<li>��</li>
						<li>��</li>
					</ul>
				</div>
			</div>
		</div>

		<div class="panel_container" id="panel5">
			<h3>Panel 5</h3>
			<div id="panel5-body" class="panel_body">
				<div>
					<ul>
						<li>A</li>
						<li>B</li>
						<li>C</li>
					</ul>
				</div>
			</div>
		</div>

	</div>
		
	</body>
</html>