<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "fornecedor".
 *
 * @property int $idFornecedor
 * @property string $NomeFornecedor
 * @property string $CFornecedor
 *
 * @property Artigo[] $artigos
 */
class Fornecedor extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'fornecedor';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['NomeFornecedor', 'CFornecedor'], 'required'],
            [['NomeFornecedor', 'CFornecedor'], 'string', 'max' => 45],
            [['NomeFornecedor'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'idFornecedor' => 'Id Fornecedor',
            'NomeFornecedor' => 'Nome Fornecedor',
            'CFornecedor' => 'C Fornecedor',
        ];
    }

    /**
     * Gets query for [[Artigos]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getArtigos()
    {
        return $this->hasMany(Artigo::class, ['Fornecedor_idFornecedor' => 'idFornecedor']);
    }

    public static function getAll(){
        return $for = Fornecedor::find()->all();
    }
    
}
