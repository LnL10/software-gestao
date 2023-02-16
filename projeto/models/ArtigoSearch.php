<?php

namespace app\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\ArtigoModel;

/**
 * ArtigoSearch represents the model behind the search form of `app\models\ArtigoModel`.
 */
class ArtigoSearch extends ArtigoModel
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['idArtigo', 'Lote_idLote', 'Cor_idCor', 'Tamanho_idtamanho', 'Categoria_idcategoria', 'Genero_idGenero', 'Marca_idMarca', 'Fornecedor_idFornecedor', 'ArtigoBase_ReferenciaBase'], 'integer'],
            [['Referencia', 'CódigoDeBarras', 'Data', 'Armazem'], 'safe'],
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
        $query = ArtigoModel::find();

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
            'Data' => $this->Data,
            'Lote_idLote' => $this->Lote_idLote,
            'Cor_idCor' => $this->Cor_idCor,
            'Tamanho_idtamanho' => $this->Tamanho_idtamanho,
            'Categoria_idcategoria' => $this->Categoria_idcategoria,
            'Genero_idGenero' => $this->Genero_idGenero,
            'Marca_idMarca' => $this->Marca_idMarca,
            'Fornecedor_idFornecedor' => $this->Fornecedor_idFornecedor,
            'ArtigoBase_ReferenciaBase' => $this->ArtigoBase_ReferenciaBase,
        ]);

        $query->andFilterWhere(['like', 'Referencia', $this->Referencia])
            ->andFilterWhere(['like', 'CódigoDeBarras', $this->CódigoDeBarras])
            ->andFilterWhere(['like', 'Armazem', $this->Armazem]);

        return $dataProvider;
    }
}
