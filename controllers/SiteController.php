<?php

namespace app\controllers;

use app\components\MainTrait;
use app\models\Subject;
use Yii;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\filters\VerbFilter;
use app\models\LoginForm;
use app\models\ContactForm;

class SiteController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['logout'],
                'rules' => [
                    [
                        'actions' => ['logout'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    /**
     * @inheritdoc
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }

    /**
     * Displays homepage.
     *
     * @return string
     */
    public function actionIndex()
    {
    /*    $res=Subject::find()->asArray()->all();
        foreach ($res as $row){
            $customer = Subject::findOne($row['id']);
            $row['name'] = MainTrait::getTranslit($row['name']);             // замена на англ
            $row['name'] = str_replace(' ', '_', $row['name']);             //замена пробелов
            $row['name'] = mb_strtolower ($row['name']);                   //нижний регистр
            $row['name']=preg_replace('#\(?(\w)\)?#s','$1',$row['name']); //удалить круглые скобки
            $customer->url = $row['name'];

            $customer->update();
        }
   */
        return $this->render('index');
    }

    /**
     * Displays contact page.
     *
     * @return string
     */
    public function actionContact()
    {

        return $this->render('contact');
    }

    /**
     * Displays about page.
     *
     * @return string
     */
    public function actionAbout()
    {
        return $this->render('about');
    }
}
