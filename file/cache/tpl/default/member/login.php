<?php defined('IN_XHXXFB') or exit('Access Denied');?><?php include template('header');?>
<style type="text/css">
.tips {position:absolute;z-index:100;width:300px;background:url('image/tips_bg.gif') no-repeat 0 bottom;overflow:hidden;margin:-5px 0 0 -10px;}
.tips div{background:url('image/tips_top.gif') no-repeat;line-height:22px;padding:8px 10px 8px 35px;}
</style>
<br/>
<div class="m">
<table width="100%" cellpadding="0" cellspacing="0">
<tr>
<td width="20">&nbsp;</td>
<td width="300"><img src="<?php echo DT_SKIN;?>image/login_h.gif" alt="" width="300" height="35"/></td>
<td>&nbsp;</td>
</tr>
</table>
</div>
<div class="m">
<table width="100%" cellpadding="0" cellspacing="0">
<tr bgcolor="#2D92DA">
<td width="20"> </td>
<td width="300" bgcolor="#FFFFFF" background="<?php echo DT_SKIN;?>image/login_b.gif">
<form method="post" action="<?php echo $DT['file_login'];?>" onsubmit="return Dcheck();">
<input name="forward" type="hidden" value="<?php echo $forward;?>"/>
<input name="auth" type="hidden" value="<?php echo $auth;?>"/>
<table width="290" cellpadding="3" cellspacing="3" align="right">
<tr>
<td colspan="3" class="f_gray">您尚未登录，或者访问了一个需要登录的页面..</td>
</tr>
<tr onmouseover="Ds('tusername');" onmouseout="Dh('tusername');">
<td align="right">
<select name="option">
<option value="username">用户名</option>
<option value="passport">昵称</option>
<option value="email">Email</option>
<option value="mobile">手机号</option>
<option value="company">公司名</option>
<option value="userid">会员ID</option>
</select>
</td>
<td><input name="username" type="text" id="username" value="<?php echo $username;?>" style="width:140px"/></td>
<td>
<div class="tips" id="tusername" style="display:none;">
<div>如果忘记了用户名，请在左侧选择其他登录名称<br/>例如Email、手机号、公司名等</div>
</div>
</td>
</tr>
<tr onmouseover="Ds('tpassword');" onmouseout="Dh('tpassword');">
<td align="right">密 码：</td>
<td><?php include template('password', 'chip');?></td>
<td>
<div class="tips" id="tpassword" style="display:none;">
<div>如果忘记了密码，请<a href="send.php" class="f_b">点击这里</a>自主找回或联系本站工作人员协助找回</div>
</div>
</td>
</tr>
<?php if($MOD['captcha_login']) { ?>
<tr>
<td align="right">验证码：</td>
<td><?php include template('captcha', 'chip');?></td>
<td></td>
</tr>
<?php } ?>
<tr>
<td align="right"></td>
<td><span title="选中后 一月内不用再次登录 网吧或公共计算机请勿选"><input type="checkbox" name="cookietime" value="1" id="cookietime"<?php if($MOD['login_remember']) { ?> checked<?php } ?>
/><label for="cookietime">记住我</label></span>
<span title="选中后 将直接进入商务室 不返回登录前的页面"><input type="checkbox" name="goto" value="1" id="goto"<?php if($MOD['login_goto']) { ?> checked<?php } ?>
/><label for="goto">进入商务室</label></span>
</td>
<td></td>
</tr>
<tr>
<td></td>
<td><input type="submit" name="submit" value=" 登 录 "/>&nbsp;&nbsp;<a href="send.php">忘记了密码？</a></td>
<td></td>
</tr>
<tr>
<?php if($oa) { ?>
<tr>
<td align="right">其他登录：</td>
<td>
<?php if(is_array($OAUTH)) { foreach($OAUTH as $k => $v) { ?>
<?php if($v['enable']) { ?><a href="<?php echo DT_PATH;?>api/oauth/<?php echo $k;?>/connect.php" title="<?php echo $v['name'];?>"><img src="<?php echo DT_PATH;?>api/oauth/<?php echo $k;?>/ico.png" alt="<?php echo $v['name'];?>"/></a> &nbsp;<?php } ?>
<?php } } ?>
</td>
<td></td>
</tr>
<?php } ?>
</table>
</form>
</td>
<td width="20">&nbsp;</td>
<td bgcolor="#FFFFFF" width="350" valign="top"><img src="<?php echo DT_SKIN;?>image/login_say.gif" alt="" width="350" height="140"/></td>
<td width="30">&nbsp;</td>
<td class="f_white" style="line-height:180%;">
还没有会员账号?<br/>立即免费注册一个(仅需要大约1分钟)...<br/><br/>
<input type="button" value=" 立即免费注册 " class="pd3 px14 f_b ls1" style="background:#F8B003;" onclick="Go('<?php echo $DT['file_register'];?>?forward=<?php echo urlencode($forward);?>');"/>
</td>
</tr>
</table>
</div>
<div class="m">
<table width="100%" cellpadding="0" cellspacing="0">
<tr>
<td width="20">&nbsp;</td>
<td width="300"><img src="<?php echo DT_SKIN;?>image/login_f.gif" alt="" width="300" height="25"/></td>
<td>&nbsp;</td>
</tr>
</table>
</div>
<br/>
<br/>
<script type="text/javascript">
if(Dd('username').value == '') {
Dd('username').focus();
} else {
Dd('password').focus();
}
function Dcheck() {
if(Dd('username').value == '') {
confirm('请输入登录名称');
Dd('username').focus();
return false;
}
if(Dd('password').value == '') {
confirm('请输入密码');
Dd('password').focus();
return false;
}
<?php if($MOD['captcha_login']) { ?>
if(!is_captcha(Dd('captcha').value)) {
confirm('请填写验证码');
Dd('captcha').focus();
return false;
}
<?php } ?>
return true;
}
</script>
<?php include template('footer');?>