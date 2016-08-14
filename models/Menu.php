<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "menu".
 *
 * @property integer $id
 * @property string $name
 * @property string $url
 * @property integer $count
 *
 * @property Subject[] $subjects
 * @property Work[] $works
 */
class Menu extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'menu';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['count'], 'integer'],
            [['name', 'url'], 'string', 'max' => 50],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'Name',
            'url' => 'Адрес',
            'count' => 'Count',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSubjects()
    {
        return $this->hasMany(Subject::className(), ['id_menu' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getWorks()
    {
        return $this->hasMany(Work::className(), ['id_menu' => 'id']);
    }
    /**
     * @return array
     */
    public function getMenuList()
    {
        $listMenu = self::find()->with('subjects')->asArray()->all();

        return $listMenu;
    }

}
