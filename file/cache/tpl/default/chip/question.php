<?php defined('IN_XHXXFB') or exit('Access Denied');?><span onmouseover="if(Dd('question').style.display=='none') reloadquestion();"><span id="question" style="display:none;"><span id="questionstr"></span>&nbsp;&nbsp;<a href="javascript:reloadquestion();">[换个问题]</a><br/></span>
<input name="answer" id="answer" type="text" size="30"/><span id="canswer"></span>
</span>
<script type="text/javascript">
function reloadquestion() {
Dd('question').style.display = '';
Dd('canswer').innerHTML = '';
Dd('answer').value = '';
Dd('canswer').innerHTML = '';
$('#xhxxfb_question').remove();
s = document.createElement("script");
s.type = "text/javascript";
s.id = "xhxxfb_question";
s.src = "<?php echo DT_PATH;?>api/captcha.png.php?action=question&refresh="+Math.random()+".js";
document.body.appendChild(s);
}
function checkanswer(s) {
s = s.trim();
var t = encodeURIComponent(s);
if(t.indexOf('%E2%80%86') != -1) s = decodeURIComponent(t.replace(/%E2%80%86/g, ''));
if(s.length < 1) {
Dd('answer').focus; return;
}
$.post(AJPath, 'action=question&answer='+s,
function(data) {
if(data == '0') {
Dd('canswer').innerHTML = '&nbsp;&nbsp;<img src="<?php echo DT_SKIN;?>image/check_right.gif" align="absmiddle"/>';
<?php if($DT_MOB['os'] == 'ios') { ?>
Dd('answer').value = s;
<?php } ?>
} else {
Dd('answer').focus;
Dd('canswer').innerHTML = '&nbsp;&nbsp;<img src="<?php echo DT_SKIN;?>image/check_error.gif" align="absmiddle"/>';
}
}
);
}
$(function() {
$('#answer').bind('keyup blur', function() {
checkanswer($('#answer').val());
});
});
</script>