<?php

namespace app\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Artigo;

/**
 * ArtigoSearch represents the model behind the search form of `app\models\Artigo`.
 */
class ArtigoSearch extends Artigo
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['idArtigo', 'Lote_idLote'], 'integer'],
            [['ReferenciaBase', 'Referencia', 'Nome', 'Cor', 'Tamanho', 'Descricao', 'Categoria', 'Genero', 'Marca', 'Fornecedor', 'CódigoDeBarras', 'Data'], 'safe'],
            [['PrecoCusto', 'PrecoVenda'], 'number'],
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
        $query = Artigo::find();

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
            'idArtigo' => $this->idArtigo,
            'PrecoCusto' => $this->PrecoCusto,
            'PrecoVenda' => $this->PrecoVenda,
            'Data' => $this->Data,
            'Lote_idLote' => $this->Lote_idLote,
        ]);

        $query->andFilterWhere(['like', 'ReferenciaBase', $this->ReferenciaBase])
            ->andFilterWhere(['like', 'Referencia', $this->Referencia])
            ->andFilterWhere(['like', 'Nome', $this->Nome])
            ->andFilterWhere(['like', 'Cor', $this->Cor])
            ->andFilterWhere(['like', 'Tamanho', $this->Tamanho])
            ->andFilterWhere(['like', 'Descricao', $this->Descricao])
            ->andFilterWhere(['like', 'Categoria', $this->Categoria])
            ->andFilterWhere(['like', 'Genero', $this->Genero])
            ->andFilterWhere(['like', 'Marca', $this->Marca])
            ->andFilterWhere(['like', 'Fornecedor', $this->Fornecedor])
            ->andFilterWhere(['like', 'CódigoDeBarras', $this->CódigoDeBarras]);

        return $dataProvider;
    }
}
