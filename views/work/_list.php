<?php
use yii\widgets\LinkPager;
/* @var $row app\models\Work */
/* @var $pages app\controllers\WorkController */

foreach ($row as $item):?>
<div class="row">
        <div class="[ col-xs-12  col-sm-12 ]">
            <ul class="event-list">
                <li>
                    <div class="info">
                        <h2 class="title"><a href="/work/present/<?=$item['id']?>"><?=$item['theme']?></a></h2>
                        <p class="desc">
                            <?=$desc =(strlen($item['description'])>600)?substr($item['description'], 0, 599).'...':$item['description'];?>
                            </p>
                        <ul>
                            <li style="width:25%;"><a href="#website"><span class="fa fa-globe"></span>
                                    Защита: <?=$protect=(!empty($item['year']))?$item['year'].' г.':'(Не указано)';?></a></li>
                            <li style="width:25%;"><a href="#website"><span class="fa fa-globe"></span>
                                    Страницы: <?=$page=(!empty($item['count_page']))?$item['count_page']:'(Не указано)';?></a></li>
                            <li style="width:25%;"><a href="#website"><span class="fa fa-globe"></span>
                                    Просмотры:<?=$item['views']?></a></li>
                            <li style="width:25%;"><span class="fa fa-money"></span>
                                Цена:<?=$price =($item['price']>1)?$item['price'].' Руб':'Бесплатно';?>
                            </li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
    </div>
<?php endforeach;?>
<div class="product-per-page pull-left">
    <?= LinkPager::widget([
        'pagination' => $pages,
        'lastPageLabel' => true,
        'firstPageLabel' => true,
    ]);
    ?>
</div>
