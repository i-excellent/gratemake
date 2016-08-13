<?php

namespace app\components;

use app\models\Users;
use Yii;
use yii\filters\AccessControl;
use yii\filters\VerbFilter;
use yii\web\Controller;

class BaseController extends Controller
{
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only'  => '', // for all actions
                'rules' => [

                    // allow for administrators
                    [
                        'allow' => true,
                        'roles' => [
                            '@'
                        ],
                    ],
                ]
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['post'],
                ],
            ],
        ];
    }

    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
        ];
    }

    protected function setReferrerUrl()
    {
        Yii::$app->session->set('REFFERER_URL', Yii::$app->request->referrer);
    }

    protected function getReferrerUrl()
    {
        return Yii::$app->session->get('REFFERER_URL', '');
    }

}