<?php

namespace app\models\search;

use app\models\Menu;
use app\models\Subject;
use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Work;

/**
 * SearchWork represents the model behind the search form about `app\models\Work`.
 */
class SearchWork extends Work
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'id_menu', 'id_subject', 'id_user', 'id_type', 'count_page', 'views'], 'integer'],
            [['theme', 'name_file', 'description', 'time_public', 'save_name', 'year', 'bibliography', 'content', 'crypte_views'], 'safe'],
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

        $query = Work::find()->where([ 'id_user'=> Yii::$app->user->getId()]);

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
            'id_menu' => $this->id_menu,
            'id_subject' => $this->id_subject,
            'id_user' => $this->id_user,
            'id_type' => $this->id_type,
            'count_page' => $this->count_page,
            'price' => $this->price,
            'time_public' => $this->time_public,
            'year' => $this->year,
            'views' => $this->views,
        ]);

        $query->andFilterWhere(['like', 'theme', $this->theme])
            ->andFilterWhere(['like', 'name_file', $this->name_file])
            ->andFilterWhere(['like', 'description', $this->description])
            ->andFilterWhere(['like', 'save_name', $this->save_name])
            ->andFilterWhere(['like', 'bibliography', $this->bibliography])
            ->andFilterWhere(['like', 'content', $this->content])
            ->andFilterWhere(['like', 'crypte_views', $this->crypte_views]);

        return $dataProvider;
    }
    public function     searchMenu($params)
    {
        $query = Work::find();


        $this->load($params);

        if ($this->validate()) {
            $this->year=$params['year'];
            $this->count_page=$params['page'];
            $this->price=$params['free'];
            $this->id_type=$params['type'];
            $this->id_menu=$params['menu'];

            if($params['url_subject'] !== null)
            {

                $subject=Subject::findOne(['url' => $params['url_subject']])->toArray();
                $this->id_subject=$subject['id'];

            }
            if($params['url_menu'] !== null)
            {

            $menu=Menu::findOne(['url' => $params['url_menu']])->toArray();
                $this->id_menu=$menu['id'];

            }
            else
            {
                $this->id_menu=$params['menu'];
            }
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');

        }

        $query->andFilterWhere(['>=','year' , $this->year])
              ->andFilterWhere(['>=','count_page' , $this->count_page])
              ->andFilterWhere(['>=','price' , $this->price])
              ->andFilterWhere([
                  'id_type' => $this->id_type,
                  'id_menu' => $this->id_menu,
                  'id_subject' => $this->id_subject])
              ->andFilterWhere(['>=','count_page' , $this->count_page]);

        $query->andFilterWhere(['like', 'theme', $params['search']])
            ->andFilterWhere(['like', 'description', $params['search']])
            ->andFilterWhere(['like', 'bibliography', $params['search']]);


        return $query;
    }
}
