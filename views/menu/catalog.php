<?php
use yii\helpers\Url;
use yii\helpers\Html;
use yii\bootstrap\Modal;
use kartik\grid\GridView;
use johnitvn\ajaxcrud\CrudAsset;
use johnitvn\ajaxcrud\BulkButtonWidget;

/* @var $this yii\web\View */
/* @var $menuList app\models\Menu */

CrudAsset::register($this);
$this->title = 'Каталог работ';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="row">
    <div class="col-md-3">
        <?= $this->render('@app/views/layouts/filter');?>
    </div>
    <div class="col-md-9">
        <?=$this->render('index', ['menuList' => $menuList]);?>
    </div>
</div>