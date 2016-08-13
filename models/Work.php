<?php

namespace app\models;
use yii\web\UploadedFile;
use yii\helpers\ArrayHelper;
use yii\db\ActiveRecord;
use Yii;
use app\components\MainTrait;
use yii\helpers\BaseFileHelper;

/**
 * This is the model class for table "{{%work}}".
 *
 * @property integer $id
 * @property integer $id_menu
 * @property integer $id_subject
 * @property integer $id_user
 * @property integer $id_type
 * @property string $theme
 * @property string $name_file
 * @property integer $count_page
 * @property string $description
 * @property double $price
 * @property string $time_public
 * @property string $save_name
 * @property string $year
 * @property string $bibliography
 * @property string $content
 * @property integer $views
 * @property string $crypte_views
 *
 * @property Trade[] $trades
 * @property Menu $menu
 * @property Subject $subject
 * @property User $user
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
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%work}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id_menu', 'id_subject', 'id_user', 'id_type', 'count_page', 'views'], 'integer'],
            [['theme'], 'required'],
            [['description', 'bibliography', 'content', 'crypte_views'], 'string'],
            [['price'], 'number'],
            [['time_public', 'year'], 'safe'],
            [['theme', 'name_file'], 'string', 'max' => 255],
            [['save_name'], 'string', 'max' => 50],
            [['id_menu'], 'exist', 'skipOnError' => true, 'targetClass' => Menu::className(), 'targetAttribute' => ['id_menu' => 'id']],
            [['id_subject'], 'exist', 'skipOnError' => true, 'targetClass' => Subject::className(), 'targetAttribute' => ['id_subject' => 'id']],
            [['id_user'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['id_user' => 'id']],
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTrades()
    {
        return $this->hasMany(SearchTrade::className(), ['id_work' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMenu()
    {
        return $this->hasOne(Menu::className(), ['id' => 'id_menu']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public  function getSubject()
    {
        return $this->hasOne(Subject::className(), ['id' => 'id_subject']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(User::className(), ['id' => 'id_user']);
    }
    public function attributeLabels()
    {
        return [
            'year' => 'Год сдачи',
            'theme' => 'Тема',
            'time_public' => 'Дата публикации',
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
            'views' => 'Просмотры',
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

        $file = UploadedFile::getInstance($this, 'file');
        if (empty($file)) {
            return false;
        }
        $this->save_name = Yii::$app->user->identity->getId().'_'.time().'.'.$file->extension;
        $this->file = '/'.$this->save_name;

        iconv("UTF-8", "ISO-8859-1//TRANSLIT", $file->name);
        $this->name_file=MainTrait::getTranslit($file->name);
        $this->id_user=Yii::$app->user->identity->id;
                $path = $this->getAvatarFile();
                $distDir = dirname($path);
                BaseFileHelper::createDirectory($distDir);

      return $file->saveAs($path);

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
