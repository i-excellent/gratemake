<?php

namespace app\controllers;

use yii;
use yii\web\Controller;
use app\components\MainTrait;
class AjaxController extends Controller
{
    public function actionMenu()
    {
        if (Yii::$app->request->isAjax) {
            $id=Yii::$app->request->post('menu');
            $aSubject=MainTrait::getSubject($id);
            $aSubject=json_encode($aSubject);
            echo $aSubject;
        }
    }

}
