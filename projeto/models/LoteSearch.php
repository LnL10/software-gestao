<?php

namespace app\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\lote;

/**
 * LoteSearch represents the model behind the search form of `app\models\lote`.
 */
class LoteSearch extends lote
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['idLote', 'user_id'], 'integer'],
            [['NomeLote', 'DescricaoLote'], 'safe'],
        ];
    }

    /**
     * {@inheritdoc}
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
        $query = lote::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'idLote' => $this->idLote,
            'user_id' => $this->user_id,
        ]);

        $query->andFilterWhere(['like', 'NomeLote', $this->NomeLote])
            ->andFilterWhere(['like', 'DescricaoLote', $this->DescricaoLote]);

        return $dataProvider;
    }
}
