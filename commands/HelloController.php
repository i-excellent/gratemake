<?php
/**
 * @link http://www.yiiframework.com/
 * @copyright Copyright (c) 2008 Yii Software LLC
 * @license http://www.yiiframework.com/license/
 */

namespace app\commands;

use yii\console\Controller;
use app\models\Subject;
use app\components\MainTrait;
use yii\web\NotFoundHttpException;

/**
 * This command echoes the first argument that you have entered.
 *
 * This command is provided as an example for you to learn how to create console commands.
 *
 * @author Qiang Xue <qiang.xue@gmail.com>
 * @since 2.0
 */
class HelloController extends Controller
{
    /**
     * This command echoes what you have entered as the message.
     * @param string $message the message to be echoed.
     */
    public function actionIndex($message = 'hello world')
    {
        echo $message . "\n";
    }

    public function actionUrlSubject()
    {
        $res=Subject::find()->asArray()->all();
        foreach ($res as $row){
            $customer = Subject::findOne($row['id']);
            $str = MainTrait::getTranslit($row['name']);             // замена на англ
            $str = str_replace(' ', '_', $str);             //замена пробелов
            $str = mb_strtolower ($str);                   //нижний регистр
            $url=preg_replace('#\(?(\w)\)?#s','$1',$str); //удалить круглые скобки
            $customer->url = $url;

            if ($customer->update() == false) {
                throw new NotFoundHttpException('Failed:'.$row['name'].'->'.$url);
            }
        }
        return true;
    }
}
