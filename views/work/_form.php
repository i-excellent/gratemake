<?php
use yii\helpers\Html;
use app\models\Work;
use app\components\MainTrait;
use yii\widgets\ActiveForm;
use kartik\file\FileInput;
/* @var $this yii\web\View */
/* @var $model app\models\Work */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="work-form">

    <div class="row">
        <?php $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data']])?>
        <div class="col-md-6">
            <?=$form->field($model,'theme')->textInput([])?>
            <?=$form->field($model,'id_type')->dropDownList(Work::getType());?>
            <?=$form->field($model,'id_menu',['options'=>['onchange'=>'getSubject()']])->dropDownList(MainTrait::getDropList(MainTrait::getMenu()));?>
            <?=$form->field($model,'id_subject')->dropDownList(MainTrait::getDropList(MainTrait::getSubject(1)));?>
            <?=$form->field($model,'price')->textInput(['value'=>'0'])->label('Цена без комиссии сервиса(Руб.)')?>
            <?=$form->field($model,'year')->textInput()?>
            <?=$form->field($model,'count_page')->textInput()?>
            <?= $form->field($model, 'file')->widget(FileInput::classname(), [
                'options'=>['accept'=>'file/*'],

                'pluginOptions'=>[
                    'showUpload' => false,
                    'allowedFileExtensions'=>['txt','doc','docx','pdf']
                ]
            ]);
            ?>
        </div>
        <div class="col-md-6">
            <?=$form->field($model,'description')->textarea(
                ['id'=>'description'])->label('Описание работы:(своими словами, 20-100 слов):')?>
            <?=$form->field($model,'content')
                ->textarea(['id'=>'content'])->label('Содержание работы:(перчислите по пунктам разделы и главы):')?>
            <?=$form->field($model,'bibliography')->textarea(['id'=>'bibliography'])
                ->label('Список литературы:')?>

        </div>

    </div>
	<?php if (!Yii::$app->request->isAjax){ ?>
	  	<div class="form-group">
	        <?= Html::submitButton($model->isNewRecord ? 'Сохранить' : 'Редактировать', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
	    </div>
	<?php } ?>

    <?php ActiveForm::end(); ?>
    
</div>
