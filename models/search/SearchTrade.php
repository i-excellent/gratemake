<?php

namespace app\models\search;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Trade as TradeModel;

/**
 * Trade represents the model behind the search form about `app\models\Trade`.
 */
class SearchTrade extends TradeModel
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'id_user_seller', 'id_user_buyer', 'id_work'], 'integer'],
            [['time'], 'safe'],
            [['price'], 'number'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = TradeModel::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            'id_user_seller' => $this->id_user_seller,
            'id_user_buyer' => $this->id_user_buyer,
            'id_work' => $this->id_work,
            'time' => $this->time,
            'price' => $this->price,
        ]);

        return $dataProvider;
    }
}
