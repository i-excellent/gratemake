<?php
use yii\bootstrap\ActiveForm;
use yii\helpers\Html;
use app\models\Menu;
use yii\helpers\ArrayHelper;
use yii\helpers\Url;

?>
<div class="panel panel-default" xmlns="http://www.w3.org/1999/html">
    <div class="panel-heading">
        <h3 class="panel-title">
            Фильтр работ
        </h3>
    </div>
    <div class="panel-body">
        <div class="form-group">
        <?php Html::beginForm(Url::to(['search/index']),'get',[]) ?>
        <div class="panel">
           <?=Html::input('search',null,null,['class'=>'form-control','placeholder'=>'Поиск по теме'])?>
        </div>
        <div class="panel">
                <label>Предмет</label>
            <?=Html::dropDownList('item_type_id',null,ArrayHelper::map(Menu::find()->all(),'id' ,'name'),
                ['class'=>'form-control'])?>
        </div>
        <div class="panel">
            <label>Тип работы</label>
            <?=Html::dropDownList('item_work','',\app\models\Work::getType(),['class'=>'form-control'])?>
        </div>
        <div class="panel">
            <label>Год сдачи</label>
            <?=Html::dropDownList('item_work',null,[0=>'Не важно',1=>'2000-'.date('Y'),2=>'2010-'.date('Y'),3=>date('Y'),],['class'=>'form-control'])?>
        </div>
        <div class="panel">
            <label>Количество страниц</label>
        <?=Html::dropDownList('item_work',null,[0=>'Не важно',2=>'1-20',3=>'20-50',4=>'50+',],['class'=>'form-control'])?></div>
        <div class="panel">
            <div class="checkbox">
                <label>
                    <?=Html::checkbox('min',null)?>
                    Безплатно
                </label>
            </div>
            <div class="checkbox">
                <label>
                    <?=Html::checkbox('min',null)?>
                    Новые
                </label>
            </div>
        </div>
        <?=Html::submitButton('Применить фильтр',['class'=>'btn btn-default form-control'])?>
        <?php Html::endForm(); ?>
    </div>
    </div>

</div>
