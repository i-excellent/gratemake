<?php
use app\models\Work;
use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use kartik\file\FileInput;
use app\components\MainTrait;

/**
 * @param $model app\models\Work
 */
$this->title = 'Публикацыя роботы';
$this->params['breadcrumbs'][] = $this->title;
?>

        <div class="row">
            <?php $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data']])?>
            <div class="col-md-6">
                <?=$form->field($model,'theme')->textInput([])?>
                <?=$form->field($model,'id_type')->dropDownList(Work::getType());?>
                <?=$form->field($model,'id_menu')->dropDownList(MainTrait::getDropList(MainTrait::getMenu()));?>
                <?=$form->field($model,'id_subject')->dropDownList(MainTrait::getDropList(MainTrait::getSubject(1)));?>
                <?=$form->field($model,'price')->textInput(['value'=>'0'])->label('Цена без комиссии сервиса(Руб.)')?>
                <?= $form->field($model, 'file')->widget(FileInput::classname(), [
                    'options'=>['accept'=>'file/*'],

                    'pluginOptions'=>[
                        'showUpload' => false,
                        'allowedFileExtensions'=>['txt','doc','docx','pdf']
                    ]
                ]);
                ?>

                <?= Html::submitButton('Загрузить', ['class' => 'btn btn-primary',]) ?>
            </div>
            <div class="col-md-6">
                <?=$form->field($model,'description')->textarea(
                    ['id'=>'description'])->label('Описание работы:(своими словами, 20-100 слов):')?>
                <?=$form->field($model,'content')
                    ->textarea(['id'=>'content'])->label('Содержание работы:(перчислите по пунктам разделы и главы):')?>
                <?=$form->field($model,'bibliography')->textarea(['id'=>'bibliography'])
                    ->label('Список литературы:')?>
                <?=$form->field($model,'year')->textInput()?>
                <?=$form->field($model,'count_page')->textInput()?>
            </div>
            <?php ActiveForm::end()?>
        </div>
<script src="//cdn.ckeditor.com/4.5.10/basic/ckeditor.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", CKEDITOR.replace( 'description' ));
    document.addEventListener("DOMContentLoaded", CKEDITOR.replace( 'content' ));
    document.addEventListener("DOMContentLoaded", CKEDITOR.replace( 'bibliography' ));
</script>