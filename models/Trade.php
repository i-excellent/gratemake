<?php

namespace app\models;

use Yii;

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
class Trade extends \yii\db\ActiveRecord
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
            'id' => 'ID',
            'id_user_seller' => 'Id User Seller',
            'id_user_buyer' => 'Id User Buyer',
            'id_work' => 'Id Work',
            'time' => 'Time',
            'price' => 'Price',
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
