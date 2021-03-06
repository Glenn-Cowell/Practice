<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
  <title>Mootools Fancy Sliding Tab Menu</title>
  <meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<script type="text/javascript" src="script/mootools.js"></script>
	<script type="text/javascript" src="script/tabslide.js"></script>
	

	<style>
	
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

</head>
<body>
<div id="accordion">

的的的

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
					<li>Ⅰ</li>
					<li>Ⅱ</li>
					<li>Ⅲ</li>
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
<script>init();</script>


</body>
</html>