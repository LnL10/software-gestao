<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "artigobase".
 *
 * @property int $ReferenciaBase
 * @property string|null $Nome
 * @property string|null $Composicao
 * @property string|null $PrecoCusto
 * @property string|null $PrecoVenda
 *
 * @property Artigo[] $artigos
 */
class Artigobase extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'artigobase';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['ReferenciaBase'], 'required'],
            [['ReferenciaBase'], 'integer'],
            [['Nome', 'PrecoCusto', 'PrecoVenda'], 'string', 'max' => 45],
            [['Composicao'], 'string', 'max' => 100],
            [['ReferenciaBase'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'ReferenciaBase' => 'Referencia Base',
            'Nome' => 'Nome',
            'Composicao' => 'Composicao',
            'PrecoCusto' => 'Preco Custo',
            'PrecoVenda' => 'Preco Venda',
        ];
    }

    /**
     * Gets query for [[Artigos]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getArtigos()
    {
        return $this->hasMany(Artigo::class, ['ArtigoBase_ReferenciaBase' => 'ReferenciaBase']);
    }


    public static function getAll(){
        return $artigobase = Artigobase::find()->all();
    }
}
