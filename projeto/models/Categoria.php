<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "categoria".
 *
 * @property int $idcategoria
 * @property string $NomeCategoria
 *
 * @property Artigo[] $artigos
 */
class Categoria extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'categoria';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['NomeCategoria'], 'required'],
            [['NomeCategoria'], 'string', 'max' => 45],
            [['NomeCategoria'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'idcategoria' => 'Idcategoria',
            'NomeCategoria' => 'Nome Categoria',
        ];
    }

    /**
     * Gets query for [[Artigos]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getArtigos()
    {
        return $this->hasMany(Artigo::class, ['Categoria_idcategoria' => 'idcategoria']);
    }

    public static function getAll(){
        return $cat = Categoria::find()->all();
    }
}
