<?php

namespace app\models;

use Yii;
use yii\db\ActiveRecord;
/**
 * This is the model class for table "trade".
 *
 * @property integer $id
 * @property integer $id_user_seller
 * @property integer $id_user_buyer
 * @property integer $id_work
 * @property string $time
 * @property double $price
 *
 * @property User $userSeller
 * @property User $userBuyer
 * @property Work $work
 */
class Trade extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'trade';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id_user_seller', 'id_user_buyer', 'id_work'], 'integer'],
            [['time'], 'safe'],
            [['price'], 'number'],
            [['id_user_seller'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['id_user_seller' => 'id']],
            [['id_user_buyer'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['id_user_buyer' => 'id']],
            [['id_work'], 'exist', 'skipOnError' => true, 'targetClass' => Work::className(), 'targetAttribute' => ['id_work' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'Номер сделки',
            'id_user_seller' => 'Продавец',
            'id_user_buyer' => 'Покупатель',
            'id_work' => 'Работа',
            'time' => 'Время сделки',
            'price' => 'Сумма сделки',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUserSeller()
    {
        return $this->hasOne(User::className(), ['id' => 'id_user_seller']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUserBuyer()
    {
        return $this->hasOne(User::className(), ['id' => 'id_user_buyer']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getWork()
    {
        return $this->hasOne(Work::className(), ['id' => 'id_work']);
    }
}
