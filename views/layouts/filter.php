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
    <div class="form-group">
        <?=Html::beginForm(Url::to(['/work']),'get',[]) ?>
    <div class="panel-body">
        <div class="panel">
           <?=Html::input('text','search',Yii::$app->request->get('search'),['class'=>'form-control','placeholder'=>'Поиск по теме'])?>
        </div>
        <div class="panel">
                <label>Предмет</label>
            <?=Html::dropDownList('menu',Yii::$app->request->get('menu'),array_merge([null=>'Выберите направление'],ArrayHelper::map(Menu::find()->all(),'id' ,'name')),
                ['class'=>'form-control'])?>
        </div>
        <div class="panel">
            <label>Тип работы</label>
            <?=Html::dropDownList('type',Yii::$app->request->get('type'),array_merge([null=>'Выберите тип'],\app\models\Work::getType()),['class'=>'form-control'])?>
        </div>
        <div class="panel">
            <label>Год сдачи</label>
            <?=Html::dropDownList('year',Yii::$app->request->get('year'),[1960=>'Не важно',2000=>'2000',2010=>'2010',date('Y')=>date('Y'),],
                ['class'=>'form-control'])?>
        </div>
        <div class="panel">
            <label>Количество страниц</label>
        <?=Html::dropDownList('page',Yii::$app->request->get('page'),[null=>'Не важно','20'=>'20+','50+'=>'50+','80'=>'80+',],['class'=>'form-control'])?></div>
        <div class="panel">
            <div class="checkbox">
                <label>
                    <?=Html::checkbox('free',Yii::$app->request->get('free'))?>
                    Безплатно
                </label>
            </div>
            <div class="checkbox">
                <label>
                    <?=Html::checkbox('new',Yii::$app->request->get('new'))?>
                    Новые
                </label>
            </div>
        </div>
        <?=Html::submitButton('Применить фильтр',['class'=>'btn btn-default form-control'])?>
        <?=Html::endForm(); ?>
    </div>
    </div>

</div>
