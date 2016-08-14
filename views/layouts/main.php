<?php

/* @var $this \yii\web\View */
/* @var $content string */

use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use app\assets\AppAsset;

AppAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?= Html::csrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
</head>
<body>
<?php $this->beginBody() ?>

<div class="wrap">
    <?php NavBar::begin([
        'brandLabel' => Yii::$app->name,
        'brandUrl' => Yii::$app->homeUrl,
        'options' => [
            'class' => 'navbar-default navbar-fixed-top',
        ],
    ]);?>

    <?=Nav::widget([
        'options' => ['class' => 'navbar-nav navbar-right'],
        'items' => [
            ['label' => 'Каталог готовых работ', 'url' => ['/menu/catalog']],
            ['label' => 'Как купить работу?', 'url' => ['/site/about']],
            ['label' => 'Продать работу', 'url' => ['/work/create']],

            ['label' => 'О бирже', 'url' => ['/site/contact']],
            '<li>'
            . Html::beginForm(['/search'], 'post', ['class' => 'navbar-form navbar-left']).
            '<div class="input-group">
            <input type="text" class="form-control" placeholder="Введите текст">
            <span class="input-group-btn">
                <button class="btn btn-default" type="button">Найти!</button>
                 </span></div>'
            . Html::endForm()
            . '</li>',

            Yii::$app->user->isGuest ? (
            ['label' => 'Вход', 'url' => ['/user/login']]
            ) :
                [
                    'label' => Yii::$app->user->identity->username,
                    'items' => [
                        ['label' => 'Профиль', 'url' => '/user/settings/'],
                        ['label' => 'Ваши роботы', 'url' => '/user/profile'],
                        ['label' => 'История', 'url' => '/user/profile'],
                        '<li class="divider"></li>',
                        '<li class="dropdown-header"></li>',
                        '<li>'
                        . Html::beginForm(['/user/logout'], 'post', ['class' => 'navbar-form navbar-left'])
                        . Html::submitButton('Выход',['class'=>'form-control'])
                        . Html::endForm()
                        . '</li>',
                    ],
                ],],
    ]);?>
    <?php NavBar::end(); ?>
    <div class="container">
        <?= Breadcrumbs::widget([
            'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
        ]) ?>
        <?= $content ?>
    </div>
</div>

<footer class="footer">
    <div class="container">
        <p class="pull-left">&copy; My Company <?= date('Y') ?></p>

        <p class="pull-right"><?= Yii::powered() ?></p>
    </div>
</footer>

<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
