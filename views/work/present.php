<?php
use yii\helpers\Url;
/* @var $work app\models\Work */
$subject=$work->getSubject()->asArray()->one();
$user=$work->getUser()->asArray()->one();
Url::remember();
$this->title = 'Публикации';
$this->params['breadcrumbs'][] =  [
    'template' => "<li>{link}</li>\n", //  шаблон для этой ссылки
    'label' => 'Каталог', // название ссылки
    'url' => ['/menu/catalog'] // сама ссылка
];
$this->params['breadcrumbs'][] =  [
    'template' => "<li>{link}</li>\n", //  шаблон для этой ссылки
    'label' => $subject['name'], // название ссылки
    'url' => ['/menu/'.$subject['url']] // сама ссылка
];
$this->params['breadcrumbs'][] = $this->title;

?>
<div class="container-fluid">
    <div class="content-wrapper">
        <div class="item-container">
            <div class="row">
                <div class="col-md-5">
                    <div class="product col-md-12 service-image-left">
                        <center>
     <img id="item-display" src="http://www.corsair.com/Media/catalog/product/g/s/gs600_psu_sideview_blue_2.png" alt="">
                            </img>
                        </center>
                    </div>
                </div>
                <div class="col-md-7">
                    <div class="product-title"><?=$work->theme?></div>
                    <div class="product-desc">Предмет:<?=$subject['name']?></div>
                    <div class="product-desc">Автор:<?= $user['username']?></div>
                    <hr>
                    <?php if($work->price>1):?>
                    <div class="product-price"><?=$work->price?>  Руб.</div>
                    <?php else:?>
                    <div class="product-stock">Бесплатно</div>
                    <?php endif;?>
                    <hr>
                    <div class="btn-group cart">
                        <a href="/work/download/" type="button" class="btn btn-success">
                            Скачать
                        </a>
                    </div>
                    <div class="btn-group wishlist">
                        <button type="button" class="btn btn-danger">
                            Add to wishlist
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="col-md-12 product-info">
                <ul id="myTab" class="nav nav-tabs nav_tabs">

                    <li class="active"><a href="#service-one" data-toggle="tab">Введение</a></li>
                    <li><a href="#service-two" data-toggle="tab">Содержание</a></li>
                    <li><a href="#service-three" data-toggle="tab">Литература</a></li>

                </ul>
                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane fade in active" id="service-one">

                        <section class="container product-info">
                            <?=$work->description?>
                        </section>

                    </div>
                    <div class="tab-pane fade" id="service-two">
                        <section class="container">
                        <?=$work->content?>
                        </section>

                    </div>
                    <div class="tab-pane fade" id="service-three">
                        <section>
                            <?=$work->bibliography?>
                        </section>
                    </div>
                </div>
                <hr>
            </div>
        </div>
    </div>
</div>