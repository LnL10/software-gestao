<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "marca".
 *
 * @property int $idMarca
 * @property string $NomeMarca
 *
 * @property Artigo[] $artigos
 */
class Marca extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'marca';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['NomeMarca'], 'required'],
            [['NomeMarca'], 'string', 'max' => 45],
            [['NomeMarca'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'idMarca' => 'Id Marca',
            'NomeMarca' => 'Nome Marca',
        ];
    }

    /**
     * Gets query for [[Artigos]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getArtigos()
    {
        return $this->hasMany(Artigo::class, ['Marca_idMarca' => 'idMarca']);
    }
    public static function getAll(){
        return $marca = Marca::find()->all();
    }
}
