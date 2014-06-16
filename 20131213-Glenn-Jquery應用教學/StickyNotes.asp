<!doctype html>
<html lang="en">
<head>
   <meta charset="utf-8" />
   <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

   <title>HTML5Sticky - Sticky Notes for the Web !</title>


   <!-- CSS -->
   <link rel="stylesheet" href="css/main.css?version=1" />
   <link rel="stylesheet" href="css/html5sticky.css?version=1" />

   <!-- JavaScript -->
   <!--[if IE]><![endif]-->
   <!--[if lt IE 9]>
   <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
   <![endif]-->
    
   <script type="text/javascript" src="script/jquery1.6.2.js"></script>

    <script type="text/javascript" src="script/respond.min.js"></script>
    <script type="text/javascript" src="script/modernizr.custom.23610.js"></script>
    <script type="text/javascript" src="script/html5sticky.js"></script>
    <script type="text/javascript" src="script/prettyDate.js"></script>
	<script >
	
	// jQuery Play
	$(function(){

		// initial setup
		html5sticky.setup();
	   
		// get any saved notes on page load
		html5sticky.getNotes();

		// add note
		$('#addnote').click(function(){
			html5sticky.addNote();
			return false;
		});

		// delete all notes
		$('#removenotes').click(function(){
			html5sticky.deleteAllNotes();
			return false;
		});
		
		// delete note
		$('.delete_stickynote').live('click', function(){
			html5sticky.deleteNote($(this));
			return false;
		});

		// close enlarged note
		$('.close_stickynote').live('click', function(){
			html5sticky.closeNote($(this));
			return false;
		});

		// save the note
		$('.save_stickynote').live('click', function(){
			html5sticky.saveNote($(this));
			return false;
		});


	   // enlarge the note 修改
	   $(".note_common").live("click", function(event) {
		  html5sticky.enlargeNote($(this));
	   });

	   // shrink the notes 縮小
	   $('#shrink').click(function(event) {
		  html5sticky.shrink();
	   });

	   // expand the notes
	   $('#expand').click(function(event) {
		  html5sticky.expand();
	   });


	   // allow escape to close big note
	   $(document).keyup(function(e) {
		  if (e.keyCode == "27") {
			 $('#overlay').remove();
			 $('.bignore').remove();
		  }
	   });

	});
	</script>
    <link href='http://fonts.googleapis.com/css?family=Architects+Daughter' rel='stylesheet' />
</head>

<body>

	<!-- First header has an ID so you can give it individual styles, and target stuff inside it -->
	<header id="head">
	  <div class="left topsection">
         <a href="#" id="addnote" class="tooltip blue-tooltip"><img src="images/add.png" alt="Add a new sticky note"><span>Add a new sticky note</span></a>
         <a href="#" id="removenotes" class="tooltip blue-tooltip"><img src="images/remove.png" alt="Remove all sticky notes"><span>Remove all sticky notes</span></a>
      </div>

      <div class="left topsection">
         <a href="#" id="shrink" class="tooltip blue-tooltip"><img src="images/decrease.png" alt="Shrink"><span>Shrink sticky notes</span></a>
         <a href="#" id="expand" class="tooltip blue-tooltip"><img src="images/increase.png" alt="Expand"><span>Expand sticky notes</span></a>
      </div>


	</header><!-- #head -->

   <div id="main">
       
       <div class="clear">&nbsp;</div>
   </div>
   <div class="clear">&nbsp;</div>

   
More script and css style
: <a href="http://www.htmldrive.net/" title="HTML DRIVE - Free DHMTL Scripts,Jquery plugins,Javascript,CSS,CSS3,Html5 Library">www.htmldrive.net </a></body>
</html>