<?php
use yii\helpers\Url;
use yii\helpers\Html;
use yii\bootstrap\Modal;
use kartik\grid\GridView;
use johnitvn\ajaxcrud\CrudAsset;
use johnitvn\ajaxcrud\BulkButtonWidget;

/* @var $this yii\web\View */
/* @var $searchModel app\models\search\SearchWork */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Works';
$this->params['breadcrumbs'][] = $this->title;

CrudAsset::register($this);

?>
<div class="row">
    <div class="col-md-3">
        <?= $this->render('_menu') ?>
    </div>
    <div class="col-md-9">
        <?=$this->render('@app/views/trade/index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);?>
    </div>
</div>
