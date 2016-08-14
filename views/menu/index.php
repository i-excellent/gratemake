<?php
/* @var $this yii\web\View */
/* @var $menuList app\models\Menu */
?>
<?php foreach ($menuList as $menu):?>
    <div><a href="../work/<?=$menu['url']?>" class="btn btn-default btn-md">
            <span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> <?=$menu['name'];?> <span class="badge">  <?=$menu['count'];?></span>
        </a></div>
            <?php if(!empty($menu['subjects'])):?>
                <?php foreach ($menu['subjects'] as $subject):?>
                    <?php if($subject['count']==0):?>
                    <?=$subject['name'];?>,
                    <?php else:?>
                    <a href="../work/<?=$menu['url']?>/<?=$subject['url']?>"><?=$subject['name'];?>[<?=$subject['count'];?>]</a>,
                    <?php endif?>
                <?php endforeach;?>
            <?php endif?>
<?php endforeach;?>






