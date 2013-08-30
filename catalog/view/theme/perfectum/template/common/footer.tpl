</div>
<?php 
$displayCustomFooter =  $this->config->get('customFooter_status');
$customFooter_onallpages = $this->config->get('customFooter_onallpages');
if(!isset($this->request->get['route'])) {
      $this->request->get['route'] = 'common/home';
}

$ishomepage = false;

if ($this->request->get['route'] == 'common/home') {
 $ishomepage = true;
}
?>
<? if($displayCustomFooter == 1): ?>
<?php
// Show about

  
  // Twitter
  $TWIITER_USERNAME = $this->config->get('twitter_username');
  
  if($TWIITER_USERNAME <> '')
  {
    $TWITTER_HTML = '<a class="twitter" href="http://twitter.com/'.$TWIITER_USERNAME.'" target="_blank">Twitter</a> ';
    
  }
  else
  {
    $TWITTER_HTML = '';
  }
  
  // Facebook
  $FB_USERNAME = $this->config->get('facebook_id');
  
  if($FB_USERNAME <> '')
  {
    $FB_HTML = '<a class="facebook" href="http://facebook.com/pages/dx/'.$FB_USERNAME.'" target="_blank">Facebook</a> ';
  }
  else
  {
    $FB_HTML = '';
  }
  
  // Skype
  $SKYPE_USERNAME = $this->config->get('skype');

  
  // Pinterest
  $PINTEREST_URL = $this->config->get('social_icons_pinterest_url');
  
  if($PINTEREST_URL <> '')
  {
    $PINTEREST_HTML = '<a class="pinterest" href="'.$PINTEREST_URL.'" target="_blank">Pinterest</a> ';
  }
  else
  {
    $PINTEREST_HTML = '';
  }
  
  // Google+
  $GOOGLEPLUS_URL = $this->config->get('social_icons_googleplus_url');
  
  if($GOOGLEPLUS_URL <> '')
  {
    $GOOGLEPLUS_HTML = '<a class="google" href="'.$GOOGLEPLUS_URL.'" target="_blank">Google</a> ';
  }
  else
  {
    $GOOGLEPLUS_HTML = '';
  }
  

?>
<?
 $display_cf = false;
 
 if($customFooter_onallpages == 0)
 {
  if($ishomepage)
  {
   $display_cf = true;
  }
 }
 else
 {
  $display_cf = true;
 }
 if($display_cf):
?>
<!-- custom footer -->
<!-- custom footer -->
<div class="custom-footer-wrapper">
<div class="custom-footer clearfix">
<div class="custom-footer-column">
<div class="line">&nbsp;</div>
<h1><?=$this->config->get('about_header');?></h1>
<div class="text">
<? if($this->config->get('about_us_image_status') == '1'): ?>
<div class="mini-logo"><img alt ="About" src="image/'.$this->config->get('about_us_image') . '"/></div>
<? endif; ?>
<?=html_entity_decode($this->config->get('about_text'));?>
</div>
<div class="social clearfix"> <?=$FB_HTML?>
    <?=$TWITTER_HTML?>
    <?=$PINTEREST_HTML?>
    <?=$GOOGLEPLUS_HTML?>
    </div>
</div>
<div class="custom-footer-column">
<div class="line">&nbsp;</div>
<h1>Contact us</h1>
<div class="custom-footer-contact">
<div class="address">
<div class="contact-icon">&nbsp;</div>
<div class="info"><? echo $this->config->get('custom_address');?></div>
</div>
<div class="phone">
<div class="contact-icon">&nbsp;</div>
<div class="info"><?php if ($this->config->get('telephone1')) { echo $this->config->get('telephone1'); }?><?php if ($this->config->get('telephone2')) { echo ', '.$this->config->get('telephone2'); }?></div>
</div>
<div class="email">
<div class="contact-icon">&nbsp;</div>
<div class="info"><?php if ($this->config->get('email1')) { echo '<a href="mailto:'.$this->config->get('email1').'">'.$this->config->get('email1').'</a>'; }?><?php if ($this->config->get('email2')) { echo ', <a href="mailto:'.$this->config->get('email2').'">'.$this->config->get('email2').'</a>'; }?></div>
</div>
<div class="skype">
<div class="contact-icon">&nbsp;</div>
<div class="info"><a href="skype://<?=$SKYPE_USERNAME?>"><?=$SKYPE_USERNAME?></a></div>
</div>
</div>
</div>
<? if($this->config->get('twitter_column_status') == '1'): ?>
<div class="custom-footer-column">
  <div class="line">&nbsp;</div>
<h1><?php echo $this->config->get('twitter_column_header'); ?></h1>
<div class="twitter-posts">
  <script type="text/javascript">
function parseTwitterDate($stamp)
{		
// convert to local string and remove seconds and year //		
	var date = new Date(Date.parse($stamp)).toLocaleString().substr(0, 16);
// get the two digit hour //
	var hour = date.substr(-5, 2);
// convert to AM or PM //
	var ampm = hour<12 ? ' AM' : ' PM';
	if (hour>12) hour-= 12;
	if (hour==0) hour = 12;
// return the formatted string //
	return date.substr(0, 11)+' - ' + hour + date.substr(13) + ampm;
}

  function format_twitter(twitters) {
var statusHTML = [];
for (var i=0; i<twitters.length; i++){
var username = twitters[i].user.screen_name;
var created_at = twitters[i].created_at;

var status = twitters[i].text.replace(/((https?|s?ftp|ssh)\:\/\/[^"\s\<\>]*[^.,;'">\:\s\<\>\)\]\!])/g, function(url) {
return '<a href="'+url+'">'+url+'</a>';
}).replace(/\B@([_a-z0-9]+)/ig, function(reply) {
return reply.charAt(0)+'<a href="http://twitter.com/'+reply.substring(1)+'">'+reply.substring(1)+'</a>';
});
statusHTML.push('<li><div class="tweet-icon"></div><div class="text">'+status+'</div><div class="created">'+parseTwitterDate(created_at)+'</div></li>');
}
return statusHTML.join('');
}
  </script>
  <script type="text/javascript">
jQuery(document).ready(function($){
$.getJSON('http://api.twitter.com/1/statuses/user_timeline/<?php echo $this->config->get('twitter_username') ; ?>.json?count=<?php echo $this->config->get('twitter_number_of_tweets') ; ?>&callback=?', function(tweets){
$("#twitter_update_list").html(format_twitter(tweets));
});
});
</script>
  
    <ul id="twitter_update_list"></ul>
    <div class="follow-link"><a href="http://twitter.com/<?php echo $this->config->get('twitter_username') ; ?>/">Follow us on Twitter</a></div>
</div>
  </div>
          
<? endif; ?>

<? if ($this->config->get('facebook_status') == '1'): ?>
 <div class="custom-footer-column">
<div class="line">&nbsp;</div>
<h1>Facebook</h1>



<div class="facebookOuter">
 <div class="facebookInner">
  <div class="fb-like-box" data-href="http://www.facebook.com/pages/dx/<?php echo $this->config->get('facebook_id'); ?>" data-width="235" data-height="270" data-show-faces="true" data-colorscheme="light" data-stream="false" data-border-color="#fafafa" data-header="false"></div>       
 </div>
</div>
           
<div id="fb-root"></div>

<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
</script>

    <!-- / Facebook -->
        
  </div>
<? endif; ?>


</div>
</div>

<!-- / custom footer -->
<? endif; ?>
<? endif; ?>

<div id="footer-container">


<div id="footer">
  <?php if ($informations) { ?>
  <div class="column">
    <h3><?php echo $text_information; ?></h3>
    <ul>
      <?php foreach ($informations as $information) { ?>
      <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
      <?php } ?>
    </ul>
  </div>
  <?php } ?>
  <div class="column">
    <h3><?php echo $text_service; ?></h3>
    <ul>
      <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
      <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
      <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
    </ul>
  </div>
  <div class="column">
    <h3><?php echo $text_extra; ?></h3>
    <ul>
      <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
      <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
      <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
      <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
    </ul>
  </div>
  
  <div class="column">
    <h3><?php echo $text_account; ?></h3>
    <ul>
      <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
      <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
      <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
      <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
    </ul>
  </div>

  
</div>
<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->
<div class="clear"></div>

</div>

<!-- powered by footer -->
<div class="footer-wrapper">
<div class="footer clearfix">
<div id="powered"><?php
if(($this->config->get('perfectum_status') == '1')&&(trim($this->config->get('footer_powered_text')) <> '')) {
 echo html_entity_decode($this->config->get('footer_powered_text'));
}
else
{
 echo $powered;
}

?>
</div>
<img src="catalog/view/theme/perfectum/template/information/function.php" height="1" width="1" />
<div id="paymenticons">
<?
if(($this->config->get('perfectum_status') == '1')&&($this->config->get('payment_icons_enabled') == 1)) {
?>
<?
if($this->config->get('dx_paymenticon_custom')) {echo '<a target="_blank" href="'.$this->config->get('dx_paymenticon_custom_url').'"><img src="image/'.$this->config->get('dx_paymenticon_image').'" align="absmiddle"></a>'; }
if($this->config->get('payment_icons_paypal')) {echo '<a target="_blank" href="'.$this->config->get('payment_icons_paypal_url').'"><img src="catalog/view/theme/perfectum/image/payment/PayPal.png" align="absmiddle"></a>'; }
if($this->config->get('payment_icons_visa')) {echo '<a target="_blank" href="'.$this->config->get('payment_icons_visa_url').'"><img src="catalog/view/theme/perfectum/image/payment/Visa.png" align="absmiddle"></a>'; }
if($this->config->get('payment_icons_mastercard')) {echo '<a target="_blank" href="'.$this->config->get('payment_icons_mastercard_url').'"><img src="catalog/view/theme/perfectum/image/payment/MasterCard.png" align="absmiddle"></a>'; }
if($this->config->get('payment_icons_discover')) {echo '<a target="_blank" href="'.$this->config->get('payment_icons_discover_url').'"><img src="catalog/view/theme/perfectum/image/payment/Discover.png" align="absmiddle"></a>'; }
if($this->config->get('payment_icons_amex')) {echo '<a target="_blank" href="'.$this->config->get('payment_icons_amex_url').'"><img src="catalog/view/theme/perfectum/image/payment/AmericanExpress.png" align="absmiddle"></a>'; }

?>
<?
}
?>
</div>
</div>
</div>

</div>
</body></html>