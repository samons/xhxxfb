<?php defined('IN_XHXXFB') or exit('Access Denied');?><?php if(is_array($tags)) { foreach($tags as $i => $t) { ?><a href="<?php echo $MODULE[$moduleid]['linkurl'];?>search.php?kw=<?php echo urlencode($t['word']);?>"<?php if($target) { ?> target="<?php echo $target;?>"<?php } ?>
 class="b" rel="nofollow"><?php echo $t['word'];?></a>&nbsp; <?php } } ?>