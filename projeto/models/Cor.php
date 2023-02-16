<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "cor".
 *
 * @property int $idCor
 * @property string $CorSite
 * @property string $CCor
 *
 * @property Artigo[] $artigos
 */
class Cor extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'cor';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['CorSite', 'CCor'], 'required'],
            [['CorSite', 'CCor'], 'string', 'max' => 45],
            [['CorSite'], 'unique'],
            [['CCor'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'idCor' => 'Id Cor',
            'CorSite' => 'Cor Site',
            'CCor' => 'C Cor',
        ];
    }

    /**
     * Gets query for [[Artigos]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getArtigos()
    {
        return $this->hasMany(Artigo::class, ['Cor_idCor' => 'idCor']);
    }

    public static function getAll(){
        return $cores = Cor::find()->all();
    }
}
