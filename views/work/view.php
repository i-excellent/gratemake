<?php

use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Work */
?>
<div class="work-view">
 
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'id_menu',
            'id_subject',
            'id_user',
            'id_type',
            'theme',
            'name_file',
            'count_page',
            'description:ntext',
            'price',
            'time_public',
            'save_name',
            'year',
            'bibliography:ntext',
            'content:ntext',
            'views',
            'crypte_views:ntext',
        ],
    ]) ?>

</div>
