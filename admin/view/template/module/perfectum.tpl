<?php echo $header; ?>
<link  href="http://fonts.googleapis.com/css?family=PT+Sans:regular,italic,700,700italic&subset=latin" rel="stylesheet" type="text/css" >
<link rel="stylesheet" type="text/css" href="view/stylesheet/css/colorpicker.css" />
<script type="text/javascript" src="view/javascript/jquery/colorpicker.js"></script>
<script type="text/javascript" src="../catalog/view/theme/perfectum/js/jquery.form.js"></script>
		
<link rel="stylesheet" type="text/css" href="../catalog/view/theme/perfectum/stylesheet/dd.css" />
<script type="text/javascript" src="../catalog/view/theme/perfectum/js/jquery.dd.min.js"></script>

<div id="content">
<style type="text/css">
.htabs.vert a {
	background:#F5F5F5;
	color:#000;
	font-family:"PT Sans";
	font-size:15px;
}
.htabs.vert a:hover {
	background:#fff;
}
a:hover {
	color:#969B9D;
}
.font-preview {
	<?
	if (!isset($perfectum_header_fontsize)) {
                	
		 $perfectum_header_fontsize = '28';
            
	}
	?>
	font-size:<?=$perfectum_header_fontsize?>px;

}

.htabs.vert {
	width:130px;
	float:left;
	padding-left:0px;
}
.htabs.vert a {
	width:130px;
	text-align:left;
	padding-top:10px;
	padding-bottom:10px;
}
.htabs.vert img {
	margin-right:10px;
}
.htabs.vert a:last-child {
	border-bottom: 1px solid #DDDDDD;
}
.theme_support {
	color:#24527d!important;
}
.hcontent.vert {
	border-left: 1px solid #DDDDDD;
	border-top: 1px solid #DDDDDD;
	margin-left:160px;
	min-height:440px;
	padding-top:10px;
}
.hcontent.vert > div {
	margin-left:20px;
}
.hcontent.vert div.selector {
	margin-left:0px!important;
}
.htabs.vert a:hover {
	color:#000;
}
.htabs.vert .selected {
	background:#fff;
	color:#F15A3B;
	border-right:none;
	padding-top:10px!important;
	padding-bottom:10px!important;
}
.heading h1 {

	
	color:#000!important;
}
.tdhead {
	background:#f6f6f6;
	color:#1c71a9!important;
	font-weight:bold;
	text-transform:uppercase;
}
h1 {
	font-weight:normal;
	font-size:24px!important;
	margin-top:0px!important;
	padding-top:0px!important;
	color:#F2532F;
	border-bottom:1px solid #DDDDDD;
	text-transform:uppercase;
}
h2 {
	
	color:#24527d!important;
	font-weight:300!important;
	font-size:24px!important;
	margin-top:0px!important;
	padding-top:0px!important;
}
h3 {
	
	font-weight:300!important;
	font-size:24px!important;
	margin:0px!important;
	padding:0px!important;
	border-bottom:1px dotted #000;
}
.box > .content {
    border-top: 1px solid #CCCCCC;

}
#tab_colors .form input, #layout_product_showsalebadge_color {
	color:#fff;
	text-shadow:1px 1px 1px #000;
	padding:3px;
	width:50px;
	text-transform:uppercase;
	border:1px solid #ccc;
	margin-left:5px;
	background-image:none!important;
	-moz-box-shadow:inset 0px 0px 1px 0px #777777;
	-webkit-box-shadow:inset 0px 0px 1px 0px #777777;
	box-shadow:inset 0px 0px 1px 0px #777777;

}
.color-buttons {
	background:#f3f3f3;
	padding:10px;
	margin-top:10px;
	text-align:left;
	min-width:780px;
	margin-bottom:20px;
}
.color-buttons input,.color-buttons select {
	padding:4px;
}
.color-buttons a  {
	background: #F2532F;
	padding:5px;
	color: #fff;
	text-decoration:none;
	
	padding-left:15px;
	padding-right:15px;
	font-weight:bold;
	
}

.color-buttons a:last-child {
	background:#000;
	color:red;
}
.color-buttons a:hover {
	color:#fff;
	background:#000;
}
.save-buttons {
	float:right;
}
.save-buttons a {
	background:#F2532F;
	padding:7px;
	
	font-weight:bold;
	margin-left:10px;
	color: #fff;
	text-decoration:none;
	text-shadow:0px 1px 1px #666;
}
.save-buttons a:first-child {
	background:#56a702;
}
#exportColors {
	float:left;
	margin-left:10px;
}
.save-buttons a:hover {
	
	color:yellow;
}
#select-patern-image {
	margin-left:10px;
	margin-top:-10px;
}
.notification {
    background: #EAF7D9;
    border: 1px solid #BBDF8D;
    font-size:16px;
    padding:7px;
    text-align:center;
    color:#185b0f;
}
.dd, .dd div {
	width:auto!important;
}

.dd #select-patern_child  {
	height:300px!important;
}

.ddTitleText {
	min-width: 250px!important;
}
.ddcommon .ddChild  {
	width:250px!important;
}
.dd .ddChild li img  {
	width: 40px!important;
}
.dd .ddTitle .ddTitleText img  {
	max-width:100px!important;
}
</style>

<script type="text/javascript"><!--

$(document).ready(function() {
	
   var options = {
	
	  success: function() {
	       
		$(".notification").slideDown().delay(2000).slideUp();
		
		$('html, body').animate({ scrollTop: 0 }, 'slow'); 
	  }
   };
   
   $("#form").ajaxForm(options);
   
   
   var themesData = new Array();
   
   function getThemeList()
   {
	$("#import_scheme_name").html('');	
	
	// Get color themes
	$.get('../catalog/view/theme/perfectum/js/admin_ajax.php?act=import_colors', function(data) {
	
	var schemesList = data.split("^");
	
	for(i=0;i<schemesList.length-1;i++)
	{
		var colorList = schemesList[i].split(',');
		
		var themeid = i;
		
		// Make theme list
		var valueList = colorList[1].split(':');
		var o = new Option(valueList[1], themeid);
		$("#import_scheme_name").append(o);
		
		// Store theme data in array
		themesData.push(schemesList[i]);
		
	}
	
	//$.uniform.update();
	
   });
   }
   
   function updateColorBg()
   {
	$.each($('#tab_colors input'), function() {
		$(this).css('background-color', '#'+$(this).val());
	     });
	
	$('#layout_product_showsalebadge_color').css('background-color', '#'+$('#layout_product_showsalebadge_color').val());
   }
   
  getThemeList();
   
  updateColorBg();


  $("#deleteColors").click(function(){
	
	$.get('../catalog/view/theme/perfectum/js/admin_ajax.php?act=delete_colors&themeid='+$("#import_scheme_name").val(), function(data) {
		alert(data);
		getThemeList();
		
	      });
  });

  $("#importColors").click(function(){
	
	var loadthemeid = ($("#import_scheme_name").val());
	
	var themeData = themesData[loadthemeid];
	
	var colorList = themeData.split(',');
	
	for(j=2;j<colorList.length-1;j++)
	{
		var valueList = colorList[j].split(':');

		$('[name='+valueList[0]+']').val(valueList[1]);
	}
	
	updateColorBg();
	
  });
  
  $("#exportColors").click(function(){
	
	var expData = '';
	
	$.each($('#tab_colors input'), function() {
		expData = expData + $(this).attr("name")+':'+$(this).val()+',';

        });
	expData = 'color_scheme_name:' + $('#color_scheme_name').val() + ',' + expData + '^';
	//alert(expData);
	
	$.get('../catalog/view/theme/perfectum/js/admin_ajax.php?act=export_colors&data='+expData, function(data) {
		alert(data);
		getThemeList();
		
	      });
  });
  
  // from footer JS
	
	function strpos (haystack, needle, offset) {
		var i = (haystack+'').indexOf(needle, (offset || 0));
		return i === -1 ? false : i;
	      }
	      
	
		
	var activeFont = 0;
	
	$('.font-family-select').change(function(){
		
		activeFont = 1;
		
		getWeightList();
		getSubsetsList();
		
		
		$('head #googlefont').remove();
		var link = "<link href='http://fonts.googleapis.com/css?family="+$(this).val()+":"+weightString+"&subset="+subsetsString+"' id='googlefont' rel='stylesheet' type='text/css'>";
		$('head').append(link);
		
		var fontname = 	$(this).val().replace(/\+/g," ");
		
		$('.font-preview').css("font-family",'"'+fontname+'"');
		$('.font-preview').css("font-style","normal");
		$('.font-preview').css("font-weight",$("#perfectum_header_font_weight").val());
		
		
	});
	
	$('.font-family-select2').change(function(){
		
		activeFont = 2;
		
		getWeightList();
		getSubsetsList();
		
		/*
		$('head #googlefont2').remove();
		var link = "<link href='http://fonts.googleapis.com/css?family="+$(this).val()+":"+weightString+"&subset="+subsetsString+"' id='googlefont2' rel='stylesheet' type='text/css'>";
		$('head').append(link);
		*/
		var fontname = 	$(this).val().replace(/\+/g," ");
		
		$('.font-preview').css("font-family",'"'+fontname+'"');
		$('.font-preview').css("font-style","normal");
		$('.font-preview').css("font-weight",$("#perfectum_buttons_font_weight").val());
		
	});
	
	$('.font-weight-select').change(function(){
		
		activeFont = 1;
		
		var weight = $("#perfectum_header_font_weight").val().replace(/\italic/g,"");
		
		$('.font-preview').css("font-weight",weight);
		
		if(weight.length < $("#perfectum_header_font_weight").val().length)
		{
			$('.font-preview').css("font-style","italic");
		}
		else
		{
			$('.font-preview').css("font-style","normal");
		}
		
		$('.font-preview').css("font-family",'"'+$("#perfectum_header_font").val()+'"');
		
		if($("#perfectum_header_font_weight").val()=='regular')
		{
			$('.font-preview').css("font-weight","normal");			
		}
	});
	
	$('.font-weight-select2').change(function(){
		
		activeFont = 2;
		
		var weight = $("#perfectum_buttons_font_weight").val().replace(/\italic/g,"");
		
		$('.font-preview').css("font-weight",weight);
		
		if(weight.length < $("#perfectum_buttons_font_weight").val().length)
		{
			$('.font-preview').css("font-style","italic");
		}
		else
		{
			$('.font-preview').css("font-style","normal");
		}
		$('.font-preview').css("font-family",'"'+$("#perfectum_buttons_font").val()+'"');
		
		if($("#perfectum_buttons_font_weight").val()=='regular')
		{
			$('.font-preview').css("font-weight","normal");			
		}
		
	});
	
	$('.size-select').change(function(){
			
			$('.font-preview').css("font-size",$(this).val()+'px');
		
	});
	
	$('#tab_colors .form input').ColorPicker({
		onSubmit: function(hsb, hex, rgb, el) {
			$(el).val(hex);
			$.each($('#tab_colors input'), function() {
				$(this).css('background-color', '#'+$(this).val());
			     });
			$(el).ColorPickerHide();
		},
		onBeforeShow: function () {
			$(this).ColorPickerSetColor(this.value);
		}
	})
	.bind('keyup', function(){
		$(this).ColorPickerSetColor(this.value);
	});
	
	$('#layout_product_showsalebadge_color').ColorPicker({
		onSubmit: function(hsb, hex, rgb, el) {
			$(el).val(hex);
			$('#layout_product_showsalebadge_color').css('background-color', '#'+$('#layout_product_showsalebadge_color').val());
			$(el).ColorPickerHide();
		},
		onBeforeShow: function () {
			$(this).ColorPickerSetColor(this.value);
		}
	})
	.bind('keyup', function(){
		$(this).ColorPickerSetColor(this.value);
	});

<?php
if (!isset($perfectum_header_font)) {
                	
            	$perfectum_header_font = 'PT Sans';
}
if (!isset($perfectum_buttons_font)) {
                	
            	$perfectum_buttons_font = 'PT Sans';
}
if (!isset($perfectum_header_font_weight)) {
                	
            	$perfectum_header_font_weight = 'regular';
}
if (!isset($perfectum_buttons_font_weight)) {
                	
            	$perfectum_buttons_font_weight = 'regular';
}
if (!isset($perfectum_header_font_subset)) {
                	
            	$perfectum_header_font_subset = 'cyrillic';
}
if (!isset($perfectum_buttons_font_subset)) {
                	
            	$perfectum_buttons_font_subset = 'cyrillic';
}
?>
  
	
  function getFontsList()
  {
	$("#perfectum_header_font").html('');	
	$("#perfectum_header_font_weight").html('');
	$("#perfectum_header_font_subset").html('');
	
	$("#perfectum_buttons_font").html('');	
	$("#perfectum_buttons_font_weight").html('');
	$("#perfectum_buttons_font_subset").html('');
	
	// Get color themes
	$.get('../catalog/view/theme/perfectum/js/admin_ajax.php?act=get_fonts', function(data) {
	
	var fontsList = data.split("\n");
	

	for(i=0;i<fontsList.length-1;i++)
	{
		var familyList = fontsList[i].split(':');
		
		var o = new Option(familyList[0], familyList[0]);
		$("#perfectum_header_font").append(o);
	
	}
	
	$("#perfectum_buttons_font").html("<option selected value=\"<?=$perfectum_buttons_font?>\"><?=str_replace("+"," ",$perfectum_buttons_font)?></option>"+$("#perfectum_header_font").html());
	
	$("#perfectum_header_font").prepend("<option selected value=\"<?=$perfectum_header_font?>\"><?=str_replace("+"," ",$perfectum_header_font)?></option>");
	
	//$.uniform.update(); 
   });
  }
  
  var weightString = "";
  var weightString2 = "";
  
  function getWeightList()
  {
	// Get color themes
	$.get('../catalog/view/theme/perfectum/js/admin_ajax.php?act=get_fonts', function(data)
	{
	
		var fontsList = data.split("\n");
		
		for(i=0;i<fontsList.length-1;i++)
		{
			var familyList = fontsList[i].split(':');
			if((activeFont == 0)||(activeFont == 1))
			if(familyList[0]==$("#perfectum_header_font").val())
			{
				var weightList = familyList[1].split(',');
				
				weightString = "";
				
				$("#perfectum_header_font_weight").html('');
				
				for(j=0;j<weightList.length;j++)
				{
					
					var q = new Option(weightList[j], weightList[j]);
					$("#perfectum_header_font_weight").append(q);
					
					if(j==(weightList.length-1))
					{
						weightString = weightString + weightList[j];
						
						$('head #googlefont').remove();
						var link = "<link href='http://fonts.googleapis.com/css?family="+$("#perfectum_header_font").val()+":"+weightString+"&subset="+subsetsString+"' id='googlefont' rel='stylesheet' type='text/css'>";
						$('head').append(link);
					}
					else
					{
						weightString = weightString + weightList[j]+',';
						
					}
					
				}
				
				
			}
			
			// buttons font
			if((activeFont == 0)||(activeFont == 2))
			if(familyList[0]==$("#perfectum_buttons_font").val())
			{
				var weightList = familyList[1].split(',');
				
				weightString2 = "";
				
				$("#perfectum_buttons_font_weight").html('');
				
				for(j=0;j<weightList.length;j++)
				{
					
					var q = new Option(weightList[j], weightList[j]);
					$("#perfectum_buttons_font_weight").append(q);
					
					if(j==(weightList.length-1))
					{
						weightString2 = weightString2 + weightList[j];
						
						$('head #googlefont2').remove();
						var link = "<link href='http://fonts.googleapis.com/css?family="+$("#perfectum_buttons_font").val()+":"+weightString2+"&subset="+subsetsString2+"' id='googlefont2' rel='stylesheet' type='text/css'>";
						$('head').append(link);
					}
					else
					{
						weightString2 = weightString2 + weightList[j]+',';
						
					}
					
				}
				
				
			}
			
		}
	
		if(activeFont == 0)
		{
			$("#perfectum_header_font_weight").prepend("<option selected value=\"<?=$perfectum_header_font_weight?>\"><?=$perfectum_header_font_weight?></option>");
			$("#perfectum_buttons_font_weight").prepend("<option selected value=\"<?=$perfectum_buttons_font_weight?>\"><?=$perfectum_buttons_font_weight?></option>");
		}
	
		//$.uniform.update();
		
	});
  
  }
  
  var subsetsString = "";
  var subsetsString2 = "";
  
  function getSubsetsList()
  {
	// Get color themes
	$.get('../catalog/view/theme/perfectum/js/admin_ajax.php?act=get_fonts', function(data)
	{
	
		var fontsList = data.split("\n");
		
		
		for(i=0;i<fontsList.length-1;i++)
		{
			var familyList = fontsList[i].split(':');
			if((activeFont == 0)||(activeFont == 1))
			if(familyList[0]==$("#perfectum_header_font").val())
			{
				var subsetsList = familyList[2].split(',');
				
				subsetsString = "";
				
				$("#perfectum_header_font_subset").html('');
				for(j=0;j<subsetsList.length;j++)
				{
					
					var q = new Option(subsetsList[j], subsetsList[j]);
					$("#perfectum_header_font_subset").append(q);
					
					if(j==(subsetsList.length-1))
					{
						subsetsString = subsetsString + subsetsList[j];
					}
					else
					{
						subsetsString = subsetsString + subsetsList[j]+',';
					}
				}
				
				
			}
			// buttons font
			if((activeFont == 0)||(activeFont == 2))
			if(familyList[0]==$("#perfectum_buttons_font").val())
			{
				var subsetsList = familyList[2].split(',');
				
				subsetsString2 = "";
				
				$("#perfectum_buttons_font_subset").html('');
				for(j=0;j<subsetsList.length;j++)
				{
					
					var q = new Option(subsetsList[j], subsetsList[j]);
					$("#perfectum_buttons_font_subset").append(q);
					
					if(j==(subsetsList.length-1))
					{
						subsetsString2 = subsetsString2 + subsetsList[j];
					}
					else
					{
						subsetsString2 = subsetsString2 + subsetsList[j]+',';
					}
				}
				
				
			}
				
		}
	
		if(activeFont == 0)
		{
			$("#perfectum_header_font_subset").prepend("<option selected value=\"<?=$perfectum_header_font_subset?>\"><?=$perfectum_header_font_subset?></option>");
			$("#perfectum_buttons_font_subset").prepend("<option selected value=\"<?=$perfectum_buttons_font_subset?>\"><?=$perfectum_buttons_font_subset?></option>");
		}

		//$.uniform.update(); 
	});
  }
  
  // Init fonts
  getFontsList();
  getWeightList();
  getSubsetsList();
  
  
  // show default preview
  $('.font-preview').css("font-family","<?=$perfectum_header_font?>");
  $('.font-preview').css("font-style","<? if(strpos($perfectum_header_font_weight, "italic")) { echo 'italic'; } else { echo 'normal'; }?>");
  $('.font-preview').css("font-weight","<?=$perfectum_header_font_weight?>");

  /*$("#perfectum_header_font").html('');	
  $("#perfectum_header_font_weight").html('');
  $("#perfectum_header_font_subset").html('');
  */
  $('#tab_colors input:text').focus(
   
    function(){ 
        $(this).css('background-color', '#'+$(this).val());
    });

    $('#tab_colors input:text').blur(
    function(){
        $(this).css('background-color', '#'+$(this).val());
    });
    
    // $("input:not(.no-uniform):not(.dd input), textarea:not(.no-uniform), button:not(.no-uniform), select:not(.no-uniform)").uniform();
    
    $(".dd-menu").msDropdown();
    
   
    
});

--></script>
<div class="breadcrumb">
  <?php foreach ($breadcrumbs as $breadcrumb) { ?>
  <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
  <?php } ?>
</div>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>


       <?php 
        
        // set default values if no values were entered
       
        
	
	
	/*color*/
	if(empty($perfectum_color_body_bg)) { $perfectum_color_body_bg ="FFFFFF"; }
	if(empty($perfectum_button_bg)) { $perfectum_button_bg ="F2532F"; }
	if(empty($perfectum_button_hoverbg)) { $perfectum_button_hoverbg ="000000"; }
	if(empty($perfectum_topmenu_bg)) { $perfectum_topmenu_bg ="1E1E21"; }
	
        // BG
        if(empty($perfectum_body_bg_pattern)) {
        	$perfectum_body_bg_pattern ="no_pattern";
        }
        
       
        ?>
<div class="box">

  <div class="content">
	<div class="save-buttons"><a onclick="$('#form').submit();"><?php echo $button_save; ?> theme settings</a><a onclick="location = '<?php echo $cancel; ?>';"><?php echo $button_cancel; ?></a></div><h2>Welcome to Perfectum theme options panel</h2>
	<div class="notification" style="display:none;">Theme settings saved!</div>
	<p>
	
      Changes will be visible <b>only</b> if you select <b>Enabled</b> for "Enable custom theme options" selector. <span style="color:red;">If you enabled theme options first time you <b>must</b> click <b>Save theme settings button!</b></span>
	
  </p>
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
    <div style="color:green;font-weight:bold;">Enable custom theme options? &nbsp;</span><select name="perfectum_status">
              <?php
														if ($perfectum_status) {
															?>
              <option value="1" selected="selected"><?php
															echo $text_enabled;
															?></option>
			<option value="0"><?php
															echo $text_disabled;
															?></option>
              <?php
														} else {
															?>
              <option value="1"><?php
															echo $text_enabled;
															?></option>
			<option value="0" selected="selected"><?php
															echo $text_disabled;
															?></option>
              <?php
														}
														?>
            </select><br><br></div> 
	   
	    
    <div id="tabs" class="htabs vert"><a
	href="#tab_layout"><img src="../catalog/view/theme/perfectum/image/admin/layout.png"> General</a><a href="#tab_colors"><img src="../catalog/view/theme/perfectum/image/admin/colors.png"> Colors</a><a
	href="#tab_bg"><img src="../catalog/view/theme/perfectum/image/admin/background.png"> Backgrounds</a><a href="#tab_fonts"><img src="../catalog/view/theme/perfectum/image/admin/fonts.png"> Fonts</a>
	<a
	href="#tab_slider"><img src="../catalog/view/theme/perfectum/image/admin/slider.png"> Revo Slider</a>
	<a
	href="#tab_custommenu"><img src="../catalog/view/theme/perfectum/image/admin/menu.png"> Main Menu</a>
	
	
   <a
	href="#tab_contact"><img src="../catalog/view/theme/perfectum/image/admin/contact.png"> Footer</a>
	<a
	href="#tab_customcode"><img src="../catalog/view/theme/perfectum/image/admin/code.png"> Custom code</a>
	<a class="theme_support" 
	href="#theme_support"><img src="../catalog/view/theme/perfectum/image/admin/support.png"> Theme support</a>
    </div>
   <div class="hcontent vert">
      <div id="tab_colors">
	
	
	
  
   
   
   
	<h1>Theme colors</h1>
	In this section, you can change theme colors. To change the color of element just <b>click inside text field</b> and use color picker. Choose color and <b>click <img src="../catalog/view/theme/perfectum/image/admin/picker.png" align="absmiddle"/> icon</b> at the bottom right of color picker window to Save color</b>. 
	<p style="display:none;">You can create you own color schemes and save / load it when you want. Dont forget to click <b>Save theme settings</b> button to apply new colors.</p>
	<div class="color-buttons" style="margin-left:0px;display:none;"><div style="float:left;margin-left:0px;"><input id="color_scheme_name" class="color_scheme_name" name="color_scheme_name" value="My theme"> 
	</div><a id="exportColors">Save color scheme</a>   <div style="float:right;margin-left:0px;"><select name="import_scheme_name" id="import_scheme_name">
          
             

            </select> <a id="importColors">Load color scheme</a> <a id="deleteColors">Delete selected scheme</a></div><div style="clear:both"></div></div>
	
	
	 <div id="tabs_1" class="htabs">
	 <a href="#tab_colors_1">Main colors</a>
	
	 </div>

   <div class="hcontent">
      <div id="tab_colors_1">
      
       <table class="form">
      
        <tr>
          <td>Body background (for Boxed theme layout)</td>
          <td>#<input id="perfectum_color_body_bg" type="text" name="perfectum_color_body_bg" value="<?php echo $perfectum_color_body_bg ; ?>" ></td>
        </tr>
	<tr>
          <td>Active color (buttons, links)</td>
          <td>#<input id="perfectum_button_bg" type="text" name="perfectum_button_bg" value="<?php echo $perfectum_button_bg ; ?>" ></td>
        </tr>
	<tr>
          <td>Hover color (buttons, links)</td>
          <td>#<input id="perfectum_button_hoverbg" type="text" name="perfectum_button_hoverbg" value="<?php echo $perfectum_button_hoverbg ; ?>" ></td>
        </tr>
	<tr>
          <td>Top menu background</td>
          <td>#<input id="perfectum_topmenu_bg" type="text" name="perfectum_topmenu_bg" value="<?php echo $perfectum_topmenu_bg ; ?>" ></td>
        </tr>
	
      </table>
       <p>You can change every theme element style and colors in Custom code > Custom CSS.</p>
      </div>
      
   </div>
	
    
    
      
     
      </div>
   
      <!-- end colors tab -->
    
      <div id="tab_bg">
	<h1>Theme backgrounds</h1>
	<p><b>NOTE:</b> This settings will work if your selected "Boxed" theme layout in "General" tab.</p>

       
      <table class="form">
              
        
        
            <tr>
          <td>Background pattern:
             <?php if (!isset($perfectum_body_bg_pattern)) {
                	
		 $perfectum_body_bg_pattern = 'no_pattern';
            }
          
           
            ?>
           
          
          </td>
          <td>
            <select name="perfectum_body_bg_pattern" id="select-patern" class="no-uniform dd-menu">
          
              <option value="<?=$perfectum_body_bg_pattern?>"selected="selected" data-image="../catalog/view/theme/perfectum/image/bg/<?=$perfectum_body_bg_pattern;?>.png">Current pattern</option>
	      <option value="no_pattern" data-image="../catalog/view/theme/perfectum/image/bg/no_pattern.png">No Pattern</option>

<?php 

for ($i = 1; $i <= 174; $i++) {
	
	echo '<option data-image="../catalog/view/theme/perfectum/image/bg/'.$i.'.png" value="'. $i . '">Pattern '.$i.' (transparent)</option>';
}

for ($i = 1000; $i <= 1031; $i++) {
	

	
	echo '<option data-image="../catalog/view/theme/perfectum/image/bg/'.$i.'.png" value="'. $i . '">Pattern '.$i.' (color)</option>';
}
?>
            </select>
            </td>  
            </tr> 
            <tr>   
           <td>Upload your own background pattern: </br>
           <?php 
           if(isset($dx_bg_image) && $dx_bg_image == '1'){
           	 ?>
           	 <input type="radio"  name="dx_bg_image" value="1" CHECKED/> Yes<br />
			<input type="radio" name="dx_bg_image" value="0"> No
           	<?php 
           }     else {   ?>
           <input type="radio"  name="dx_bg_image" value="1" /> Yes<br />
			<input type="radio" name="dx_bg_image" value="0" CHECKED> No
         <?php   } ?>
	<br><br> <a onclick="image_upload('dx_image', 'perfectum_preview');">Change image</a>
           </td>
              <td>
             
              <input type="hidden" name="dx_image" value="<?php echo $dx_image; ?>" id="dx_image" />
                <img src="<?php echo $perfectum_preview; ?>" alt="" id="perfectum_preview" class="image" onclick="image_upload('dx_image', 'perfectum_preview');" /></td>         
          </td>
        </tr>
        
              <tr>   
           <td>Upload your image as full size background: </br>
           <?php 
           if(isset($dx_full_bg_image) && $dx_full_bg_image == '1'){
           	 ?>
           	 <input type="radio"  name="dx_full_bg_image" value="1" CHECKED/> Yes<br />
			<input type="radio" name="dx_full_bg_image" value="0"> No
           	<?php 
           }     else {   ?>
           <input type="radio"  name="dx_full_bg_image" value="1" /> Yes<br />
			<input type="radio" name="dx_full_bg_image" value="0" CHECKED> No
         <?php   } ?>
	 <br><br><a onclick="image_upload('dx_full_image', 'perfectum_full_preview');" >Change image</a>
           </td>
              <td>
             
              <input type="hidden" name="dx_full_image" value="<?php echo $dx_full_image; ?>" id="dx_full_image" />
                <img src="<?php echo $perfectum_full_preview; ?>" alt="" id="perfectum_full_preview" class="image" onclick="image_upload('dx_full_image', 'perfectum_full_preview');" /></td>         
          </td>
        </tr>
        
        <!--
	<tr>
        <td>
        Partially transparent content background:
        
        </td>
        
       <td>
        <?php 
           if(isset($perfectum_transparent_content) && $perfectum_transparent_content == '1'){
           	 ?>
           	 <input type="radio"  name="perfectum_transparent_content" value="1" CHECKED/> Yes<br />
			<input type="radio" name="perfectum_transparent_content" value="0"> No
           	<?php 
           }     else {   ?>
           <input type="radio"  name="perfectum_transparent_content" value="1" /> Yes<br />
			<input type="radio" name="perfectum_transparent_content" value="0" CHECKED> No
         <?php   } ?>
        </td>
        
        </tr>-->
      </table> 
      </div>
        <!-- end tab bg -->
	
       <div id="tab_fonts">
	<h1>Theme fonts</h1>
	
	<table class="form">
		<tr><td>Font preview:</td>
		<td><span class="font-preview">Grumpy wizards make toxic brew for the evil Queen and Jack.</span></td>
		</tr>
		<!--<tr><td colspan="2" class="tdhead">Body font</td></tr>
                <tr>
          <td>Body font:</td>
          <td>
	  
          <select name="perfectum_body_font">

              <?php if (isset($perfectum_body_font)) {
              $selected = "selected";
              ?>
              <option value="Arial" <?php if($perfectum_body_font=='Arial'){echo $selected;} ?>>Arial</option>
              <option value="Verdana" <?php if($perfectum_body_font=='Verdana'){echo $selected;} ?>>Verdana</option>
              <option value="Helvetica" <?php if($perfectum_body_font=='Helvetica'){echo $selected;} ?>>Helvetica</option>
              
              <option value="Lucida Grande" <?php if($perfectum_body_font=='Lucida Grande'){echo $selected;} ?>>Lucida Grande</option>
              <option value="Trebuchet MS" <?php if($perfectum_body_font=='Trebuchet MS'){echo $selected;} ?>>Trebuchet MS</option>
              <option value="Times New Roman" <?php if($perfectum_body_font=='Times New Roman'){echo $selected;} ?>>Times New Roman</option>
              <option value="Tahoma" <?php if($perfectum_body_font=='Tahoma'){echo $selected;} ?>>Tahoma</option>
              <option value="Georgia" <?php if($perfectum_body_font=='Georgia'){echo $selected;} ?>>Georgia</option>
                           
              <?php } else { ?>
              <option value="Arial"selected="selected">Arial</option>
              <option value="Verdana">Verdana</option>    
           <option value="Helvetica">Helvetica</option>
              <option value="Lucida Grande">Lucida Grande</option>
             <option value="Trebuchet MS">Trebuchet MS</option>
            <option value="Times New Roman">Times New Roman</option>
             <option value="Tahoma">Tahoma</option>
            <option value="Georgia">Georgia</option>
              
              <?php } ?>
            </select>  Default font: Arial      
          </td>
        </tr>
				 <tr>
          <td>Body text font size:
              <?php if (!isset($perfectum_body_fontsize)) {
                	
		 $perfectum_body_fontsize = '12';
            }
          
           
            ?>
          
          
          </td>
          <td>
          <select name="perfectum_body_fontsize">
          
              <option value="<?=$perfectum_body_fontsize?>"selected="selected"><?=$perfectum_body_fontsize?></option>

<?php 

for ($i = 10; $i <= 25; $i++) {
	
	echo '<option value="'. $i . '">' . $i .'</option>';
}
?>
            </select>   Default: 12
            </td>  
            </tr>-->
				 <tr><td colspan="2" class="tdhead">Headers font</td></tr>
		<tr>
          <td>Headers font:
              
          
            <br>Default font: PT Sans regular</b>
          </p>
          
          </td>
          <td>
          <select name="perfectum_header_font" class="font-select font-family-select" id="perfectum_header_font">
 
            </select>
	  &nbsp;Weight: <select name="perfectum_header_font_weight" class="font-select font-weight-select" id="perfectum_header_font_weight"></select> &nbsp;Subset: <select name="perfectum_header_font_subset" class="font-select" id="perfectum_header_font_subset"></select>
	  
          </td>
	  </tr>
		<!--<tr>
          <td>Headers text font size:
         <?php if (!isset($perfectum_header_fontsize)) {
                	
		 $perfectum_header_fontsize = '28';
            }
          
           
            ?>
          
          
          </td>
          <td>
          <select name="perfectum_header_fontsize" class="size-select">
          
              <option value="<?=$perfectum_header_fontsize?>"selected="selected"><?=$perfectum_header_fontsize?></option>

<?php 

for ($i = 17; $i <= 35; $i++) {
	
	echo '<option value="'. $i . '">' . $i .'</option>';
}
?>
            </select> Default: 28 
            </td>  
            </tr>
	    -->
		<tr>
	  <td>Headers font transform:</td>
	  <td>
		<select name="perfectum_fonts_transform">

              <?php
	      $selected_1 = '';
	      if (!isset($perfectum_fonts_transform)) {
		$selected_1 = "selected";
	      }
	      
              ?>
              <option value="uppercase" <?php if($perfectum_fonts_transform=='uppercase'){echo 'selected';} ?>>Uppercase letters</option>
	      <option value="capitalize" <?php if($perfectum_fonts_transform=='capitalize'){echo 'selected';} ?>>Capitalize letters</option>
              <option value="none" <?php echo $selected_1; if($perfectum_fonts_transform=='none'){echo 'selected';} ?>>None (Default)</option>
                 
            </select>        
		
          </td>
        </tr>
		<tr><td colspan="2" class="tdhead">Body font</td></tr>
                  <tr>
          <td>Body font:
              
	    <br>Default font: PT Sans regular
          </p>
          
          </td>
          <td>
          <select name="perfectum_buttons_font" class="font-select2 font-family-select2" id="perfectum_buttons_font">
		 
            </select> &nbsp;Weight: <select name="perfectum_buttons_font_weight" class="font-select2 font-weight-select2" id="perfectum_buttons_font_weight"></select> &nbsp;Subset: <select name="perfectum_buttons_font_subset" class="font-select2" id="perfectum_buttons_font_subset"></select>
          </td>
	  </tr>
		 <tr>
          <td>Body text font size:
              <?php if (!isset($perfectum_buttons_fontsize)) {
                	
		 $perfectum_buttons_fontsize = '12';
            }
          
           
            ?>
          
          
          </td>
          <td>
          <select name="perfectum_buttons_fontsize" class="size-select">
          
              <option value="<?=$perfectum_buttons_fontsize?>"selected="selected"><?=$perfectum_buttons_fontsize?></option>

<?php 

for ($i = 10; $i <= 25; $i++) {
	
	echo '<option value="'. $i . '">' . $i .'</option>';
}
?>
            </select>   Default: 12
            </td>  
            </tr>   
		 
	</table>
       </div>
       <!-- end tab fonts -->
       <div id="tab_layout">
	<h1>General theme settings</h1>
	 <div id="tabs_4" class="htabs">
	 <a href="#tab_general_1">Layout</a>
	 <a href="#tab_general_2">Category page</a>
	 <a href="#tab_general_3">Product page</a>
	 <a href="#tab_general_4">Contact page</a>
	 </div>

	<div class="hcontent">
	   <div id="tab_general_1">
		<table class="form">
	<tr>
		<td><b>Responsive layout:</b></td>
		<td><select name="perfectum_layout_responsive">
              <?php
														if ($perfectum_layout_responsive) {
															?>
              <option value="1" selected="selected"><?php
															echo $text_enabled;
															?></option>
			<option value="0"><?php
															echo $text_disabled;
															?></option>
              <?php
														} else {
															?>
              <option value="1"><?php
															echo $text_enabled;
															?></option>
			<option value="0" selected="selected"><?php
															echo $text_disabled;
															?></option>
              <?php
														}
														?>
            </select></td>
	</tr>
	<tr>
		<td><b>Theme Layout:</b></td>
		<td><select name="perfectum_layout_boxed">
              <?php
														if ($perfectum_layout_boxed) {
															?>
              <option value="1" selected="selected"><?php
															echo 'Boxed (980px)';															?></option>
			<option value="0"><?php
															echo 'Fullwidth (100%)';
															?></option>
              <?php
														} else {
															?>
              <option value="1"><?php
															echo 'Boxed (980px)';	
															?></option>
			<option value="0" selected="selected"><?php
															echo 'Fullwidth (100%)';
															?></option>
              <?php
														}
														?>
            </select></td>
	</tr>
	<tr>
		<td><b>Add shadow to Boxed Layout:</b></td>
		<td><select name="perfectum_layout_boxed_shadow">
 <?php
														if ($perfectum_layout_boxed_shadow) {
															?>
              <option value="1" selected="selected"><?php
															echo $text_enabled;
															?></option>
			<option value="0"><?php
															echo $text_disabled;
															?></option>
              <?php
														} else {
															?>
              <option value="1"><?php
															echo $text_enabled;
															?></option>
			<option value="0" selected="selected"><?php
															echo $text_disabled;
															?></option>
              <?php
														}
														?>
            </select></td>
	</tr>
	
	<tr>
	  <td>Carousel for modules:</td>
	  <td>
		<select name="perfectum_effects_carousel">

              <?php
	      $selected_1 = '';
	      if (!isset($perfectum_effects_carousel)) {
		$selected_1 = "selected";
	      }
	      
              ?>
              <option value="enable" <?php echo $selected_1; if($perfectum_effects_carousel=='enable'){echo 'selected';} ?>>Enable (default)</option>
              <option value="disable" <?php if($perfectum_effects_carousel=='disable'){echo 'selected';} ?>>Disable</option> If you disable this option your products will display as multi line grid (like on Category page)
                 
            </select>        
		
          </td>
        </tr>
	<tr><td colspan="2" class="tdhead">HomePage promo block</td></tr>
	<tr>
		<td>Block content:</td>
		<td><textarea name="perfectum_layout_promoblock_content" id="perfectum-promoblock-ckeditor" rows="10" cols="50"><?php
		echo trim($perfectum_layout_promoblock_content);
		?></textarea><br><br>This block content will be displayed below the homepage slider.
		</td>
	</tr>
      </table>
	   </div>
	   
	   <div id="tab_general_2">
		<table class="form">
		<tr>
	  <td>Default products display type:</td>
	  <td>
		<select name="perfectum_layout_pdisplay">

              <?php
	      $selected_1 = '';
	      if (!isset($perfectum_layout_pdisplay)) {
		$selected_1 = "selected";
	      }
	      
              ?>
              <option value="list" <?php echo $selected_1; if($perfectum_layout_pdisplay=='list'){echo 'selected';} ?>>List (default)</option>
              <option value="grid" <?php if($perfectum_layout_pdisplay=='grid'){echo 'selected';} ?>>Grid</option>
     
                 
            </select>       
		
          </td>
        </tr>  
	<tr>
	<?
	if (!isset($perfectum_layout_refsearch))
	{
		$perfectum_layout_refsearch = true;
	}
	?>
		<td>Show "Refine search" block:</td>
		<td><select name="perfectum_layout_refsearch">
              <?php
														if ($perfectum_layout_refsearch) {
															?>
              <option value="1" selected="selected"><?php
															echo $text_enabled;
															?></option>
			<option value="0"><?php
															echo $text_disabled;
															?></option>
              <?php
														} else {
															?>
              <option value="1"><?php
															echo $text_enabled;
															?></option>
			<option value="0" selected="selected"><?php
															echo $text_disabled;
															?></option>
              <?php
														}
														?>
            </select></td>
	</tr>
	<tr>
	  <td>Shorten product names in Grid display if name longer than (letters):</td>
	  <td>
	      <?php
	    
	      if (!isset($perfectum_layout_shortenby)) {
		$perfectum_layout_shortenby = 34;
	      }
	      
              ?>
	      
		<input name="perfectum_layout_shortenby" style="width:30px" value="<?=$perfectum_layout_shortenby?>">  (Default value: 34) Used in modules, product grid display.
		       
          </td>
        </tr>
	 
      </table>
	   </div>
	   
	    <div id="tab_general_3">
		<table class="form">
		
		<tr>
	  <td>Product image effect:</td>
	  <td>
		<select name="perfectum_effects_productimage">

              <?php
	      $selected_1 = '';
	      if (!isset($perfectum_effects_productimage)) {
		$selected_1 = "selected";
	      }
	      
              ?>
              <option value="zoom" <?php echo $selected_1; if($perfectum_effects_productimage=='zoom'){echo 'selected';} ?>>Mouseover Zoom (default)</option>
              <option value="lightbox" <?php if($perfectum_effects_productimage=='lightbox'){echo 'lightbox';} ?>>Mouseclick Lightbox</option>
                 
            </select>        
		
          </td>
        </tr>
		<tr>
	  <td>Related products display:</td>
	  <td>
		<select name="perfectum_layout_related">

              <?php
	      $selected_1 = '';
	      if (!isset($perfectum_layout_related)) {
		$selected_1 = "selected";
	      }
	      
              ?>
              <option value="tab" <?php echo $selected_1; if($perfectum_layout_related=='tab'){echo 'selected';} ?>>As Tab (default)</option>
              <option value="carousel" <?php if($perfectum_layout_related=='carousel'){echo 'selected';} ?>>As carousel</option>
     
                 
            </select> How will look related products display at the Product details page.   
		
          </td>
        </tr>
	
	<tr><td colspan="2" class="tdhead">Products "Sale" badge</td></tr>
		<tr>
		<td><b>Show "Sale" badge for products with discount:</b></td>
		<?
		if(!isset($layout_product_showsalebadge_color))
		{
			$layout_product_showsalebadge_color = 'F2532F';
		}
		
		if(!isset($layout_product_showsalebadge))
		{
			$layout_product_showsalebadge = 1;
		}
		
		if(!isset($layout_product_showsalebadge_title))
		{
			$layout_product_showsalebadge_title = "Sale";
		}
		?>
		<td><select name="layout_product_showsalebadge">
              <?php
														if ($layout_product_showsalebadge) {
															?>
              <option value="1" selected="selected"><?php
															echo $text_enabled;
															?></option>
			<option value="0"><?php
															echo $text_disabled;
															?></option>
              <?php
														} else {
															?>
              <option value="1"><?php
															echo $text_enabled;
															?></option>
			<option value="0" selected="selected"><?php
															echo $text_disabled;
															?></option>
              <?php
														}
														?>
            </select></td>
	</tr>
		<tr>
		<td>Sale badge title:</td>
		<td><input type="text" name="layout_product_showsalebadge_title"
			value="<?php
			echo $layout_product_showsalebadge_title;
			?>"></td>
	</tr>
		<tr>
		<td>Sale badge color:</td>
		<td>#<input type="text" id="layout_product_showsalebadge_color" name="layout_product_showsalebadge_color"
			value="<?php
			echo $layout_product_showsalebadge_color;
			?>"> Default: F2532F</td>
	</tr>
	 <tr><td colspan="2" class="tdhead">Product custom Tab</td></tr>
	 <tr>
		<td><b>Enable custom tab:</b></td>
		<td><select name="layout_product_customtab">
              <?php
														if ($layout_product_customtab) {
															?>
              <option value="1" selected="selected"><?php
															echo $text_enabled;
															?></option>
			<option value="0"><?php
															echo $text_disabled;
															?></option>
              <?php
														} else {
															?>
              <option value="1"><?php
															echo $text_enabled;
															?></option>
			<option value="0" selected="selected"><?php
															echo $text_disabled;
															?></option>
              <?php
														}
														?>
            </select></td>
	</tr>
	<tr>
		<td>Tab title:</td>
		<td><input type="text" name="layout_product_customtab_title"
			value="<?php
			echo $layout_product_customtab_title;
			?>"></td>
	</tr>

	<tr>
		<td>Tab content:</td>
		<td><textarea name="layout_product_customtab_content" id="perfectum-customtab-ckeditor" rows="10" cols="50"><?php
		echo trim($layout_product_customtab_content);
		?></textarea>
		</td>
	</tr>
      </table>
	   </div>
	   <div id="tab_general_4">
		<table class="form">
	 <tr>
		<td><b>Enable custom block<br> on contact page:</b></td>
		<td><select name="layout_product_customcontactblock">
              <?php
														if ($layout_product_customcontactblock) {
															?>
              <option value="1" selected="selected"><?php
															echo $text_enabled;
															?></option>
			<option value="0"><?php
															echo $text_disabled;
															?></option>
              <?php
														} else {
															?>
              <option value="1"><?php
															echo $text_enabled;
															?></option>
			<option value="0" selected="selected"><?php
															echo $text_disabled;
															?></option>
              <?php
														}
														?>
            </select></td>
	</tr>
	 <tr>
		<td>Block content:</td>
		<td><textarea name="layout_product_customcontactblock_content" id="perfectum-customcontactblock-ckeditor" rows="10" cols="50"><?php
		echo trim($layout_product_customcontactblock_content);
		?></textarea><br><br>You can add your shop information or Google Map to display on your contacts page.
		</td>
	</tr>
		</table>
	   </div>
	   
	</div>
	
	
      </div>
      <div id="tab_custommenu">
	<h1>Main menu customization</h1>
	
	 <div id="tabs_3" class="htabs">

	 <a href="#tab_header_1">Custom menu items</a>
	 <a href="#tab_header_2">Custom block</a>

	 </div>

   <div class="hcontent">
      
      
      <div id="tab_header_1">
      <p>You can add custom items to your main menu.</p>
	<table class="form">
	<tr>
		<td><b>Enable custom main menu items:</b></td>
		<td><select name="perfectum_layout_custommenu">
              <?php
														if ($perfectum_layout_custommenu) {
															?>
              <option value="1" selected="selected"><?php
															echo $text_enabled;
															?></option>
			<option value="0"><?php
															echo $text_disabled;
															?></option>
              <?php
														} else {
															?>
              <option value="1"><?php
															echo $text_enabled;
															?></option>
			<option value="0" selected="selected"><?php
															echo $text_disabled;
															?></option>
              <?php
														}
														?>
            </select></td>
	</tr>
	<tr>
		<td>Custom menu position:</td>
		<td><select name="perfectum_layout_custommenu_position">
              <?php
														if ($perfectum_layout_custommenu_position) {
															?>
              <option value="1" selected="selected"><?php
															echo 'Append to OpenCart menu items';
															?></option>
			<option value="0"><?php
															echo 'Show instead of OpenCart menu';
															?></option>
              <?php
														} else {
															?>
              <option value="1"><?php
															echo 'Append to OpenCart menu items';
															?></option>
			<option value="0" selected="selected"><?php
															echo 'Show instead of OpenCart menu';
															?></option>
              <?php
														}
														?>
            </select> You can replace standard OpenCart menu with Custom Menu or append it</td>
	</tr>
	<tr>
	
		<td>Custom menu item 1:</td><td> Text: <input type="text" name="perfectum_layout_custommenu_item1_text" value="<?php echo $perfectum_layout_custommenu_item1_text; ?>"> URL: <input type="text" name="perfectum_layout_custommenu_item1_url" value="<?php echo $perfectum_layout_custommenu_item1_url; ?>"></td></tr>
		<tr><td>Custom menu item 2:</td><td> Text: <input type="text" name="perfectum_layout_custommenu_item2_text" value="<?php echo $perfectum_layout_custommenu_item2_text; ?>"> URL: <input type="text" name="perfectum_layout_custommenu_item2_url" value="<?php echo $perfectum_layout_custommenu_item2_url; ?>"></td></tr>
		<tr><td>Custom menu item 3:</td><td> Text: <input type="text" name="perfectum_layout_custommenu_item3_text" value="<?php echo $perfectum_layout_custommenu_item3_text; ?>"> URL: <input type="text" name="perfectum_layout_custommenu_item3_url" value="<?php echo $perfectum_layout_custommenu_item3_url; ?>"></td></tr>
		<tr><td>Custom menu item 4:</td><td> Text: <input type="text" name="perfectum_layout_custommenu_item4_text" value="<?php echo $perfectum_layout_custommenu_item4_text; ?>"> URL: <input type="text" name="perfectum_layout_custommenu_item4_url" value="<?php echo $perfectum_layout_custommenu_item4_url; ?>"></td></tr>
		<tr><td>Custom menu item 5:</td><td> Text: <input type="text" name="perfectum_layout_custommenu_item5_text" value="<?php echo $perfectum_layout_custommenu_item5_text; ?>"> URL: <input type="text" name="perfectum_layout_custommenu_item5_url" value="<?php echo $perfectum_layout_custommenu_item5_url; ?>"></td></tr>
		<tr><td>Custom menu item 6:</td><td> Text: <input type="text" name="perfectum_layout_custommenu_item6_text" value="<?php echo $perfectum_layout_custommenu_item6_text; ?>"> URL: <input type="text" name="perfectum_layout_custommenu_item6_url" value="<?php echo $perfectum_layout_custommenu_item6_url; ?>"></td></tr>
		<tr><td>Custom menu item 7:</td><td> Text: <input type="text" name="perfectum_layout_custommenu_item7_text" value="<?php echo $perfectum_layout_custommenu_item7_text; ?>"> URL: <input type="text" name="perfectum_layout_custommenu_item7_url" value="<?php echo $perfectum_layout_custommenu_item7_url; ?>"></td></tr>
		<tr><td>Custom menu item 8:</td><td> Text: <input type="text" name="perfectum_layout_custommenu_item8_text" value="<?php echo $perfectum_layout_custommenu_item8_text; ?>"> URL: <input type="text" name="perfectum_layout_custommenu_item8_url" value="<?php echo $perfectum_layout_custommenu_item8_url; ?>"></td></tr>
		<tr><td>Custom menu item 9:</td><td> Text: <input type="text" name="perfectum_layout_custommenu_item9_text" value="<?php echo $perfectum_layout_custommenu_item9_text; ?>"> URL: <input type="text" name="perfectum_layout_custommenu_item9_url" value="<?php echo $perfectum_layout_custommenu_item9_url; ?>"></td></tr>
		<tr><td>Custom menu item 10:</td><td> Text: <input type="text" name="perfectum_layout_custommenu_item10_text" value="<?php echo $perfectum_layout_custommenu_item10_text; ?>"> URL: <input type="text" name="perfectum_layout_custommenu_item10_url" value="<?php echo $perfectum_layout_custommenu_item10_url; ?>"></td>
		
	</tr>
	</table>
	
      </div>
      <div id="tab_header_2">
      <p>You can show special block in your main menu with your custom HTML content (text, images, video, etc)</p>
	<table class="form">
	<tr>
		<td><b>Enable custom top menu block:</b></td>
		<td><select name="perfectum_layout_custommenu_block">
              <?php
														if ($perfectum_layout_custommenu_block) {
															?>
              <option value="1" selected="selected"><?php
															echo $text_enabled;
															?></option>
			<option value="0"><?php
															echo $text_disabled;
															?></option>
              <?php
														} else {
															?>
              <option value="1"><?php
															echo $text_enabled;
															?></option>
			<option value="0" selected="selected"><?php
															echo $text_disabled;
															?></option>
              <?php
														}
														?>
            </select></td>
	</tr>
	<tr>
		<td>Position:</td>
		<td><select name="perfectum_layout_custommenu_block_position">
              <?php
														if ($perfectum_layout_custommenu_block_position) {
															?>
              <option value="1" selected="selected">Right</option>
			<option value="0">Left</option>
              <?php
														} else {
															?>
              <option value="1">Right</option>
			<option value="0" selected="selected">Left</option>
              <?php
														}
														?>
            </select></td>
	</tr>
	<tr><td>Menu item title:</td><td><input type="text" name="perfectum_layout_custommenu_block_title" value="<?php echo $perfectum_layout_custommenu_block_title; ?>"></td></tr>
		<td>Block content (HTML):</td><td><textarea name="perfectum_layout_custommenu_block_content" id="custom_menu_block_content" rows="10" style="width:100%"><?php
		echo trim($perfectum_layout_custommenu_block_content);
		?></textarea></td></tr>
		<? if (!$perfectum_layout_custommenu_block_width) {
			
			$perfectum_layout_custommenu_block_width = 400;
		
		}
		?>
		<tr><td>Block width (px)<br>Recommended: <b><?=$perfectum_layout_custommenu_block_width;?></b></td><td><input type="text" name="perfectum_layout_custommenu_block_width" value="<?php echo $perfectum_layout_custommenu_block_width; ?>"></td></tr>
	</tr>
	</table>
      </div>
   </div>
	
	
	
      </div>
      <!-- end tab layout -->
      <div id="tab_customcode">
	<h1>Custom CSS/Javascript code</h1>
	<p><b>Note:</b> this place for advanced users only. If you write wrong code here you can break theme work and design.</p>
	<table class="form">
	<tr>
		<td><b>Custom CSS code:</b></td>
		<td><textarea name="perfectum_custom_css" rows="10" style="width:100%"><?php
		echo trim($perfectum_custom_css);
		?></textarea></td>
	</tr>
	<tr>
		<td><b>Custom JavaScript code:</b></td>
		<td><textarea name="perfectum_custom_js" rows="10" style="width:100%"><?php
		echo trim($perfectum_custom_js);
		?></textarea></td>
	</tr>
	</table>
      </div>
      <!-- end tab code -->

<div id="tab_slider">
	<h1>Revolution slider configuration</h1>
	<p><b>Note:</b> You can turn off Revolution slider and use simple Flexslider (Extensions > Modules > Slideshow) instead.</p>
	<table class="form">
	<tr>
		<td><b>Enable Revolution slider on HomePage:</b></td>
		<td><select name="perfectum_slider_enable">
              <?php
														if ($perfectum_slider_enable) {
															?>
              <option value="1" selected="selected"><?php
															echo $text_enabled;
															?></option>
			<option value="0"><?php
															echo $text_disabled;
															?></option>
              <?php
														} else {
															?>
              <option value="1"><?php
															echo $text_enabled;
															?></option>
			<option value="0" selected="selected"><?php
															echo $text_disabled;
															?></option>
              <?php
														}
														?>
            </select></td>
	</tr>
	<tr>
		<td><b>Autoplay:</b></td>
		<td><select name="perfectum_slider_autoplay">
              <?php
														if ($perfectum_slider_autoplay) {
															?>
              <option value="1" selected="selected"><?php
															echo $text_enabled;
															?></option>
			<option value="0"><?php
															echo $text_disabled;
															?></option>
              <?php
														} else {
															?>
              <option value="1"><?php
															echo $text_enabled;
															?></option>
			<option value="0" selected="selected"><?php
															echo $text_disabled;
															?></option>
              <?php
														}
														?>
            </select></td>
	</tr>
	<tr>
	  <td>Autoplay delay (msec):</td>
	  <td>
	      <?php
	    
	      if (!isset($perfectum_slider_autoplay_delay)) {
		$perfectum_slider_autoplay_delay = 9000;
	      }
	      
              ?>
	      
		<input name="perfectum_slider_autoplay_delay" style="width:40px" value="<?=$perfectum_slider_autoplay_delay?>"> Default value: 9000
		       
          </td>
        </tr>
	<tr>
		<td><b>Slides code:</b></td>
		<td><textarea name="perfectum_slider_code" rows="10" style="width:100%;height:500px;"><?php
		echo trim($perfectum_slider_code);
		?></textarea></td>
	</tr>
	
	</table>
      </div>
      <!-- end tab slider -->
<div id="tab_contact">

<h1>Footer customization</h1>
  
	    <b>Enable Custom Footer:  &nbsp;</b>
		<select name="customFooter_status">
              <?php
														if ($customFooter_status) {
															?>
              <option value="1" selected="selected"><?php
															echo $text_enabled;
															?></option>
			<option value="0"><?php
															echo $text_disabled;
															?></option>
              <?php
														} else {
															?>
              <option value="1"><?php
															echo $text_enabled;
															?></option>
			<option value="0" selected="selected"><?php
															echo $text_disabled;
															?></option>
              <?php
														}
														?>
            </select>
            <br>
	    <b>Show custom Footer on all pages:  &nbsp;</b>
		<select name="customFooter_onallpages">
              <?php
														if ($customFooter_onallpages) {
															?>
              <option value="1" selected="selected"><?php
															echo $text_enabled;
															?></option>
			<option value="0"><?php
															echo $text_disabled;
															?></option>
              <?php
														} else {
															?>
              <option value="1"><?php
															echo $text_enabled;
															?></option>
			<option value="0" selected="selected"><?php
															echo $text_disabled;
															?></option>
              <?php
														}
														?>
            </select> If Disabled custom footer will be visible on homepage only
            <br>
	    <br>
	    
 <div id="tabs_2" class="htabs">
	 <a href="#tab_footer_1">Custom column</a>
	 <a href="#tab_footer_2">Contact info</a>
	 <a href="#tab_footer_3">Facebook</a>
	 <a href="#tab_footer_4">Twitter</a>
	 <a href="#tab_footer_7">Social icons</a>
	 <a href="#tab_footer_5">Payment Icons</a>
	 <a href="#tab_footer_6">Powered by</a>
	 </div>

   <div class="hcontent">
   
      <div id="tab_footer_1">
      <table class="form">
	
	<tr>
		<td>Column Header:</td>
		<td><input type="text" name="about_header"
			value="<?php
			echo $about_header;
			?>"></td>
	</tr>

	<tr>
		<td>Column text:</td>
		<td><textarea name="about_text" id="perfectum-about-ckeditor" rows="10" cols="50"><?php
		echo trim($about_text);
		?></textarea>
		</td>
	</tr>
	<tr>
 <td>Image: </br>
           <?php 
           if(isset($about_us_image_status) && $about_us_image_status == '1'){
           	 ?>
           	 <input type="radio"  name="about_us_image_status" value="1" CHECKED/> Yes<br />
			<input type="radio" name="about_us_image_status" value="0"> No
           	<?php 
           }     else {   ?>
           <input type="radio"  name="about_us_image_status" value="1" /> Yes<br />
			<input type="radio" name="about_us_image_status" value="0" CHECKED> No
         <?php   } ?>
	 <br><br><a onclick="image_upload('about_us_image', 'about_us_image_preview');">Change image</a>
           </td>
	<td>
             
              <input type="hidden" name="about_us_image" value="<?php echo $about_us_image; ?>" id="about_us_image" />
                <img src="<?php echo $about_us_image_preview; ?>" alt="" id="about_us_image_preview" class="image" onclick="image_upload('about_us_image', 'about_us_image_preview');" /></td>         
          </td>
	
	
	</tr>

</table>
      </div>
      <div id="tab_footer_2">
      <table class="form">
	
	<tr><td colspan="2"> Fill in contact details you want to be displayed in your custom footer. If you don't want some of contact details to be displayed, just leave these fields empty</td></tr>
	
		
	<tr>
		<td>Address:</td>
		<td><input type="text" name="custom_address"
			value="<?php
			echo $custom_address;
			?>"></td>
	</tr>
	
	<tr>
		<td>Phone 1:</td>
		<td><input type="text" name="telephone1"
			value="<?php
			echo $telephone1;
			?>"></td>
	</tr>

	<tr>
		<td>Phone 2:</td>
		<td><input type="text" name="telephone2"
			value="<?php
			echo $telephone2;
			?>"></td>
	</tr>
	
		<tr>
		<td>Fax</td>
		<td><input type="text" name="fax"
			value="<?php
			echo $fax;
			?>"></td>
	</tr>
	
	
	<tr>
		<td>E-mail 1:</td>
		<td><input type="text" name="email1"
			value="<?php
			echo $email1;
			?>"></td>
	</tr>

	<tr>
		<td>E-mail 2:</td>
		<td><input type="text" name="email2"
			value="<?php
			echo $email2;
			?>"></td>
	</tr>
	
	
	

</table>
      </div>
      <div id="tab_footer_3">
      <table class="form">
	
	<tr>
		<td><b>Facebook Column Status:</b></td>
		<td><select name="facebook_status">
              <?php
														if ($facebook_status) {
															?>
              <option value="1" selected="selected"><?php
															echo $text_enabled;
															?></option>
			<option value="0"><?php
															echo $text_disabled;
															?></option>
              <?php
														} else {
															?>
              <option value="1"><?php
															echo $text_enabled;
															?></option>
			<option value="0" selected="selected"><?php
															echo $text_disabled;
															?></option>
              <?php
														}
														?>
            </select></td>
	</tr>
	
		<tr>
		<td>Facebook page ID:<br>(Sample ID: 115403961948855)</td>
		<td><input type="text" name="facebook_id"
			value="<?php
			echo $facebook_id;
			?>"> You can get your facebook page ID by page url <a target="_blank" href="http://wallflux.com/facebook_id/">here</a>.</td>
	</tr>
	
	
</table>
      </div>
      <div id="tab_footer_4">
      <table class="form">
	<tr>
		<td><b>Twitter Column Status:</b></td>
		<td><select name="twitter_column_status">
              <?php
														if ($twitter_column_status) {
															?>
              <option value="1" selected="selected"><?php
															echo $text_enabled;
															?></option>
			<option value="0"><?php
															echo $text_disabled;
															?></option>
              <?php
														} else {
															?>
              <option value="1"><?php
															echo $text_enabled;
															?></option>
			<option value="0" selected="selected"><?php
															echo $text_disabled;
															?></option>
              <?php
														}
														?>
            </select></td>
	</tr>
	
	<tr>
		<td>Twitter column header name: </td>
		<td><input type="text" name="twitter_column_header"
			value="<?php
			echo $twitter_column_header;
			?>"></td>
	</tr>
	
		<tr>
		<td>
            <label style="width: 110px">Tweets number:</label></td><td>
            <select name="twitter_number_of_tweets">
              <option value="1"<?php if($twitter_number_of_tweets == '1') echo ' selected="selected"';?>>1</option>
              <option value="2"<?php if($twitter_number_of_tweets == '2') echo ' selected="selected"';?>>2</option>
              <option value="3"<?php if($twitter_number_of_tweets == '3') echo ' selected="selected"';?>>3</option>
            </select></td>
         </tr>

          <tr><td>
            <label style="width: 110px">Twitter username: </label></td>
            <td><input type="text" name="twitter_username" value="<?php echo $twitter_username; ?>" /></td>
          </tr>
		
		
		
	</tr>
</table>
      </div>
      
      <div id="tab_footer_7">
	Leave url field empty if you don't want to display this social icon in footer
      <table class="form">
		
	<tr>

		<td>Facebook: </td>
		<td>
 Use "Facebook" tab to configurate this icon</td>
	</tr>
	
	<tr>

		<td>Twitter: </td>
		<td>
 Use "Twitter" tab to configurate this icon</td>
	</tr>
	
	
	
	<tr>

		<td>Skype username: </td>
		<td>
 
<input type="text" name="skype" 
			value="<?php
			echo $skype;
			?>"></td>
	</tr>
	<tr>

		<td>Pinterest url: </td>
		<td>

<input type="text" name="social_icons_pinterest_url" 
			value="<?php
			echo $social_icons_pinterest_url;
			?>"></td>
	</tr>
	
	<tr>

		<td>Google+ url: </td>
		<td>

<input type="text" name="social_icons_googleplus_url" 
			value="<?php
			echo $social_icons_googleplus_url;
			?>"></td>
	</tr>
	
	
</table>
      </div>
      
      <div id="tab_footer_5">
      <table class="form">
	<tr>
		<td><b>Show payment icons:</b></td>
		<td><select name="payment_icons_enabled">
              <?php
														if ($payment_icons_enabled) {
															?>
              <option value="1" selected="selected"><?php
															echo $text_enabled;
															?></option>
			<option value="0"><?php
															echo $text_disabled;
															?></option>
              <?php
														} else {
															?>
              <option value="1" selected="selected"><?php
															echo $text_enabled;
															?></option>
			<option value="0"><?php
															echo $text_disabled;
															?></option>
              <?php
														}
														?>
            </select></td>
	</tr>
	
	<tr>
	<? if ($payment_icons_paypal) {
		$checked = ' checked';
	}
	else
	{
		$checked = '';
	}
	?>
		<td>PayPal: </td>
		<td><label>
<input type="checkbox" name="payment_icons_paypal" <?=$checked;?>>
Show
</label>
<img src="../catalog/view/theme/perfectum/image/payment/PayPal.png" align="absmiddle"> url: 
<input type="text" name="payment_icons_paypal_url" 
			value="<?php
			echo $payment_icons_paypal_url;
			?>"></td>
	</tr>
	
	<tr>
	<? if ($payment_icons_visa) {
		$checked = ' checked';
	}
	else
	{
		$checked = '';
	}
	?>
		<td>Visa: </td>
		<td><label>
<input type="checkbox" name="payment_icons_visa" <?=$checked;?>>
Show
</label>
<img src="../catalog/view/theme/perfectum/image/payment/Visa.png" align="absmiddle"> url: 
<input type="text" name="payment_icons_visa_url" 
			value="<?php
			echo $payment_icons_visa_url;
			?>"></td>
	</tr>
		
	<tr>
	<? if ($payment_icons_mastercard) {
		$checked = ' checked';
	}
	else
	{
		$checked = '';
	}
	?>
		<td>MasterCard: </td>
		<td><label>
<input type="checkbox" name="payment_icons_mastercard" <?=$checked;?>>
Show
</label>
<img src="../catalog/view/theme/perfectum/image/payment/MasterCard.png" align="absmiddle"> url: 
<input type="text" name="payment_icons_mastercard_url" 
			value="<?php
			echo $payment_icons_mastercard_url;
			?>"></td>
	</tr>		
		
	<tr>
	<? if ($payment_icons_discover) {
		$checked = ' checked';
	}
	else
	{
		$checked = '';
	}
	?>
		<td>Discover: </td>
		<td><label>
<input type="checkbox" name="payment_icons_discover" <?=$checked;?>>
Show
</label>
<img src="../catalog/view/theme/perfectum/image/payment/Discover.png" align="absmiddle"> url: 
<input type="text" name="payment_icons_discover_url" 
			value="<?php
			echo $payment_icons_discover_url;
			?>"></td>
	</tr>

	<tr>
	<? if ($payment_icons_amex) {
		$checked = ' checked';
	}
	else
	{
		$checked = '';
	}
	?>
		<td>Amex: </td>
		<td><label>
<input type="checkbox" name="payment_icons_amex" <?=$checked;?>>
Show
</label>
<img src="../catalog/view/theme/perfectum/image/payment/AmericanExpress.png" align="absmiddle"> url: 
<input type="text" name="payment_icons_amex_url" 
			value="<?php
			echo $payment_icons_amex_url;
			?>"></td>
	</tr>
	
	
	  <tr>   
           <td>Upload payment icon: </br>
           <?php 
           if(isset($dx_paymenticon_custom) && $dx_paymenticon_custom == '1'){
           	 ?>
           	 <input type="radio"  name="dx_paymenticon_custom" value="1" CHECKED/> Yes<br />
			<input type="radio" name="dx_paymenticon_custom" value="0"> No
           	<?php 
           }     else {   ?>
           <input type="radio"  name="dx_paymenticon_custom" value="1" /> Yes<br />
			<input type="radio" name="dx_paymenticon_custom" value="0" CHECKED> No
         <?php   } ?>
	 <br><br><a onclick="image_upload('dx_paymenticon_image', 'perfectum_preview_payment');">Change image</a>
           </td>
              <td>
             
              <input type="hidden" name="dx_paymenticon_image" value="<?php echo $dx_paymenticon_image; ?>" id="dx_paymenticon_image" />
                <img src="<?php echo $perfectum_preview_payment; ?>" alt="" id="perfectum_preview_payment" class="image" onclick="image_upload('dx_paymenticon_image', 'perfectum_preview_payment');" align="absmiddle" />
		 url: 
<input type="text" name="dx_paymenticon_custom_url" 
			value="<?php
			echo $dx_paymenticon_custom_url;
			?>"></td>
	      </td>         
          </td>
        </tr>
	
</table>
      </div>
      
      <div id="tab_footer_6">
      <table class="form">	
	<tr>
		<td>Powered by text:</td>
		<td><textarea name="footer_powered_text" id="perfectum-powered-ckeditor" rows="10" cols="50"><?php
		echo trim($footer_powered_text);
		?></textarea>
		</td>
	</tr>
	
</table>
      </div>
      
  </div>

	

</div>


<div id="theme_support">
	<h1>Perfectum theme for Open Cart 1.5.5. Theme version: <a href="http://perfectum-oc.any-themes.com/Documentation/release-history.html" target="_blank">1.0.2</a></h1>
	<p style="font-weight:bold">Theme designed and developed by <a href="http://themeforest.net/user/dedalx">dedalx</a>.</p>
<p>Thank you for buying my theme! If you have any questions or problems with my item you can contact me via <a href="http://themeforest.net/user/dedalx">Theme Forest contact form</a>.</p>
<p>If you like my theme dont forget to rate theme with stars (you can do it in your Downloads tab, inside your ThemeForest profile. Just click on stars! This little thing helps me to make new theme updates! Thank you!</p>
<p>
Now my personal blog available at <a href="http://dedalx.com">dedalx.com</a>!
</p>

<h3><a href="https://twitter.com/dedalx" target="_blank">Follow me on twitter</a> or <a href="https://www.facebook.com/dedalxDev" target="_blank">join my facebook page</a> to get noticed about all theme updates and news!</h3>
<br>
<a href="http://codecanyon.net/user/dedalx/follow/"><img src="http://any-themes.com/images/followcc.png"/></a> <a href="http://codecanyon.net/feeds/users/dedalx"><img src="http://any-themes.com/images/rsscc.png"/></a><br>
<a href="http://themeforest.net/user/dedalx/follow/"><img src="http://any-themes.com/images/followtf.png"/></a> <a href="http://themeforest.net/feeds/users/dedalx"><img src="http://any-themes.com/images/rsstf.png"/></a><br>
<a href="http://graphicriver.net/user/dedalx/follow/"><img src="http://any-themes.com/images/followgr.png"/></a> <a href="http://graphicriver.net/feeds/users/dedalx"><img src="http://any-themes.com/images/rssgr.png"/></a><br>
<a href="https://twitter.com/dedalx"><img src="http://any-themes.com/images/followtwitter.png"/></a> <a href="http://www.facebook.com/dedalxDev"><img src="http://any-themes.com/images/followfb.png"/></a><br>
<a href="http://instagram.com/dedalx"><img src="http://any-themes.com/images/followig.png"/></a>
</div>


   </div>
<div class="save-buttons"><a onclick="$('#form').submit();"><?php echo $button_save; ?> theme settings</a><a onclick="location = '<?php echo $cancel; ?>';"><?php echo $button_cancel; ?></a></div>
    </form>
  </div>
</div>

<script type="text/javascript"><!--
$('#tabs a').tabs();

$('#tabs_1 a').tabs();
$('#tabs_2 a').tabs();
$('#tabs_3 a').tabs();
$('#tabs_4 a').tabs();
//--></script>
<script type="text/javascript">

$(document).ready(function() {
	
	
	 });
</script>

<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="view/javascript/jquery/ckeditor.jquery.js"></script> 


<script type="text/javascript"><!--
$('#perfectum-about-ckeditor').ckeditor();
$('#perfectum-powered-ckeditor').ckeditor();
$('#custom_menu_block_content').ckeditor();
$('#perfectum-customtab-ckeditor').ckeditor();
$('#perfectum-customcontactblock-ckeditor').ckeditor();
$('#perfectum-promoblock-ckeditor').ckeditor();

//--></script> 

<script type="text/javascript"><!--
function image_upload(field, preview) {
	$('#dialog').remove();
	
	$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');
	
	$('#dialog').dialog({
		title: '<?php echo $text_image_manager; ?>',
		close: function (event, ui) {
			if ($('#' + field).attr('value')) {
				$.ajax({
					url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>',
					type: 'GET',
					data: 'image=' + encodeURIComponent($('#' + field).attr('value')),
					dataType: 'text',
					success: function(data) {
						
						$('#' + preview).replaceWith('<img src="' + data + '" alt="" id="' + preview + '" class="image" onclick="image_upload(\'' + field + '\', \'' + preview + '\');" />');
					}
				});
			}
		},	
		bgiframe: false,
		width: 700,
		height: 400,
		resizable: false,
		modal: false
	});
};

/*
 * Image preview script 
 */
 
this.imagePreview = function(){	
	/* CONFIG */
		
		xOffset = 10;
		yOffset = 30;
		
		// these 2 variable determine popup's distance from the cursor
		// you might want to adjust to get the right result
		
	/* END CONFIG */
	$("a.preview").hover(function(e){
		
		this.t = this.title;
		this.title = "";	
		var c = (this.t != "") ? "<br/>" + this.t : "";
		$("body").append("<p id='preview' style='display:none;'><img src='"+ this.href +"' alt='Image preview' />"+ c +"</p>");								 
		$("#preview")
			.css("top",(e.pageY - xOffset) + "px")
			.css("left",(e.pageX + yOffset) + "px")
			.css("position","absolute")
			.fadeIn();						
    },
	function(){
		this.title = this.t;	
		$("#preview").remove();
    });	
	$("a.preview").mousemove(function(e){
		$("#preview")
			.css("top",(e.pageY - xOffset) + "px")
			.css("left",(e.pageX + yOffset) + "px");
	});			
};


// starting the script on page load
$(document).ready(function(){
	imagePreview();
});
//--></script> 
<?php echo $footer; ?>