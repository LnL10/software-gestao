<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "tamanho".
 *
 * @property int $idtamanho
 * @property string $SiteTamanho
 * @property string $CTamanho
 *
 * @property Artigo[] $artigos
 */
class Tamanho extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tamanho';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['SiteTamanho', 'CTamanho'], 'required'],
            [['SiteTamanho', 'CTamanho'], 'string', 'max' => 45],
            [['SiteTamanho'], 'unique'],
            [['CTamanho'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'idtamanho' => 'Idtamanho',
            'SiteTamanho' => 'Site Tamanho',
            'CTamanho' => 'C Tamanho',
        ];
    }

    /**
     * Gets query for [[Artigos]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getArtigos()
    {
        return $this->hasMany(Artigo::class, ['Tamanho_idtamanho' => 'idtamanho']);
    }
    
    public static function getAll(){
        return $tamanhos = Tamanho::find()->all();
    }
}
