<?php
/**
 * Created by PhpStorm.
 * User: zond
 * Date: 01.07.2016
 * Time: 18:26
 */

namespace app\controllers;

use app\components\BaseController;
use app\components\MainTrait;
use yii;
use app\models\Work;
use yii\web\UploadedFile;
use yii\helpers\BaseFileHelper;

class WorkController extends BaseController
{


    public function actionUpload(){
        $model = new Work();
        if (Yii::$app->request->isPost) {

            if ($model->load(Yii::$app->request->post()))
            {
                $model->file = UploadedFile::getInstance($model, 'file');
            if ($model->upload()) {
                return true;
            }
        }}

        return $this->render('upload', ['model' => $model]);
    }
    public function actionCreate()
    {
        $model = new Work();
        
        if ($model->load(Yii::$app->request->post())) {

            $image = $model->upload();
            iconv("UTF-8", "ISO-8859-1//TRANSLIT", $image->name);
            $model->name_file=MainTrait::getTranslit($image->name);
            $model->id_user=Yii::$app->user->identity->id;
            if ($model->save()) {

                if ($image !== false) {
                    $path = $model->getAvatarFile();
                    $distDir = dirname($path);
                    BaseFileHelper::createDirectory($distDir);
                    // save original image
                    $image->saveAs($path);
                    
                }

                $referrer = $this->getReferrerUrl();

                return $this->redirect(($referrer?:['index']));
            }
        }

        if (!$model->hasErrors()) {
            $this->setReferrerUrl();
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }
}