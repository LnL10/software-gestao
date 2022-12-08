<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "artigo".
 *
 * @property int $idArtigo
 * @property string $ReferenciaBase
 * @property string $Referencia
 * @property string|null $Nome
 * @property string|null $Cor
 * @property string|null $Tamanho
 * @property string|null $Descricao
 * @property string|null $Categoria
 * @property string|null $Genero
 * @property float|null $PrecoCusto
 * @property float|null $PrecoVenda
 * @property string|null $Marca
 * @property string|null $Fornecedor
 * @property string|null $CódigoDeBarras
 * @property string|null $Data
 * @property int $Lote_idLote
 *
 * @property Lote $loteIdLote
 */
class Artigo extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'artigo';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['idArtigo', 'ReferenciaBase', 'Referencia', 'Lote_idLote'], 'required'],
            [['idArtigo', 'Lote_idLote'], 'integer'],
            [['PrecoCusto', 'PrecoVenda'], 'number'],
            [['Data'], 'safe'],
            [['ReferenciaBase', 'Referencia', 'Nome', 'Cor', 'Tamanho', 'Categoria', 'Genero', 'Marca', 'Fornecedor', 'CódigoDeBarras'], 'string', 'max' => 45],
            [['Descricao'], 'string', 'max' => 60],
            [['idArtigo'], 'unique'],
            [['Lote_idLote'], 'exist', 'skipOnError' => true, 'targetClass' => Lote::class, 'targetAttribute' => ['Lote_idLote' => 'idLote']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'idArtigo' => 'Id Artigo',
            'ReferenciaBase' => 'Referencia Base',
            'Referencia' => 'Referencia',
            'Nome' => 'Nome',
            'Cor' => 'Cor',
            'Tamanho' => 'Tamanho',
            'Descricao' => 'Descricao',
            'Categoria' => 'Categoria',
            'Genero' => 'Genero',
            'PrecoCusto' => 'Preco Custo',
            'PrecoVenda' => 'Preco Venda',
            'Marca' => 'Marca',
            'Fornecedor' => 'Fornecedor',
            'CódigoDeBarras' => 'Código De Barras',
            'Data' => 'Data',
            'Lote_idLote' => 'Lote Id Lote',
        ];
    }

    /**
     * Gets query for [[LoteIdLote]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getLoteIdLote()
    {
        return $this->hasOne(Lote::class, ['idLote' => 'Lote_idLote']);
    }
}
