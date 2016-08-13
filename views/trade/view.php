<?php

use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Trade */
?>
<div class="trade-view">
 
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'id_user_seller',
            'id_user_buyer',
            'id_work',
            'time',
            'price',
        ],
    ]) ?>

</div>
