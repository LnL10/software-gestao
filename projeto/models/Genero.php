<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "genero".
 *
 * @property int $idGenero
 * @property string $TipoGenero
 *
 * @property Artigo[] $artigos
 */
class Genero extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'genero';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['TipoGenero'], 'required'],
            [['TipoGenero'], 'string', 'max' => 45],
            [['TipoGenero'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'idGenero' => 'Id Genero',
            'TipoGenero' => 'Tipo Genero',
        ];
    }

    /**
     * Gets query for [[Artigos]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getArtigos()
    {
        return $this->hasMany(Artigo::class, ['Genero_idGenero' => 'idGenero']);
    }

    public static function getAll(){
        return $generos = Genero::find()->all();
    }
}
