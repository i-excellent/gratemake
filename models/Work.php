<?php

namespace app\models;

use Yii;
use \yii\db\ActiveRecord;
use yii\helpers\ArrayHelper;
use yii\web\UploadedFile;
use app\components\MainTrait;

/**
 * This is the model class for table "work".
 *
 * @property integer $id
 * @property integer $id_menu
 * @property integer $id_subject
 * @property integer $id_user
 * @property integer $id_type
 * @property string $name_file
 * @property integer $count_page
 * @property string $description
 * @property double $price
 * @property string $time_public
 * @property integer $views
 * @property string $crypte_views
 * @property string $theme
 */
class Work extends ActiveRecord
{
    /**
     * @var UploadedFile
     */

    public $file = '';
    private $fileDir = '/uploads/users';
    /**
     * @inheritdoc
     */
    //Work type
    const DIPLOM = 1;
    const REFERAT = 2;
    const KURSOV = 3;
    const STATIA = 4;
    const DISERT = 5;
    const SOCHIN = 6;
    const LAB = 7;
    const ETC = 8;
    
    public static function tableName()
    {
        return 'work';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'id_menu', 'id_subject', 'id_user', 'id_type', 'count_page', 'views'], 'integer'],
            [['description', 'crypte_views'], 'string'],
            [['price'], 'number'],
            [['time_public'], 'safe'],
            [['theme','file','description','content'], 'required'],
            [['name_file', 'theme'], 'string', 'max' => 255],
            [['description', 'content'], 'string', 'min' => 20],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'theme' => 'Тема',
            'time_public' => 'Год сдачи',
            'count_page' => 'Количество страниц',
            'description' => 'Комментарий к работе',
            'price' => 'Цена',
            'file' => 'Загрузка',
            'id' => 'ID',
            'id_menu' => 'Направление',
            'id_subject' => 'Предмет',
            'id_user' => 'Пользователь',
            'id_type' => 'Вид работы',
            'name_file' => 'Имя файла',
            'views' => 'Просмотр',
            'crypte_views' => 'Окраниченый просмотр',
            'bibliography' => 'Список литературы',
            'content' => 'Содержание',
        ];
    }
    public static function getType($type = false){
        $list = [
            self::DIPLOM => 'Дипломная робота',
            self::REFERAT => 'Реферат',
            self::KURSOV => 'Курсовая работа',
            self::STATIA => 'Сьтья',
            self::DISERT => 'Димертация',
            self::SOCHIN => 'Сочининие',
            self::LAB => 'Лабараторная робота',
            self::ETC => 'Другое'
        ];
        return $type ? ArrayHelper::getValue($list, $type) : $list;
    }
    public function upload()
    {
        // get the uploaded file instance. for multiple file uploads
        // the following data will return an array (you may need to use
        // getInstances method)
        $file = UploadedFile::getInstance($this, 'file');

        // if no image was uploaded abort the upload
        if (empty($file)) {
            return false;
        }

        $this->file = '/'.time().'.'.$file->extension;

        // the uploaded image instance
        return $file;
    }

    /**
     * fetch stored image file name with complete path
     * @return string
     */
    public function getAvatarFile()
    {

        $fileDir = Yii::getAlias('@webroot') . $this->fileDir . '/' . Yii::$app->user->identity->id ;
        return isset($this->file) ? $fileDir . $this->file: null;
    }
}
