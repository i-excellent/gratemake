<?php
/* @var $row app\models\Work */

foreach ($row as $item):?>
<div class="row">
        <div class="[ col-xs-12  col-sm-12 ]">
            <ul class="event-list">
                <li>
                    <time datetime="2014-07-20 0000">
                        <span class="day">8</span>
                        <span class="month">Jul</span>
                        <span class="year">2014</span>
                        <span class="time">12:00 AM</span>
                    </time>
                    <div class="info">
                        <h2 class="title"><?=$item['theme']?></h2>
                        <p class="desc">
                            <?=$desc =(strlen($item['description'])>230)?substr($item['description'], 0, 411).'...':$item['description'];?>
                            </p>
                        <ul>
                            <li style="width:50%;"><a href="#website"><span class="fa fa-globe"></span> Website</a></li>
                            <li style="width:50%;"><span class="fa fa-money"></span>
                                <?=$desc =(strlen($item['price'])>230)?substr($item['price'], 0, 227).'...':$item['price'];?>
                            </li>
                        </ul>
                    </div>
                    <div class="social">
                        <ul>
                            <li class="facebook" style="width:33%;"><a href="#facebook"><span class="fa fa-facebook"></span></a></li>
                            <li class="twitter" style="width:34%;"><a href="#twitter"><span class="fa fa-twitter"></span></a></li>
                            <li class="google-plus" style="width:33%;"><a href="#google-plus"><span class="fa fa-google-plus"></span></a></li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
    </div>
<?php endforeach;?>
<?php
echo "<pre>";
print_r($row);
echo "</pre>";
?>

