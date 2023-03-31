<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "lote".
 *
 * @property int $idLote
 * @property string $NomeLote
 * @property string|null $DescricaoLote
 * @property int $user_id
 *
 * @property ArtigoModel[] $artigos
 * @property User $user
 */
class Lote extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'lote';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['NomeLote', 'user_id'], 'required'],
            [['user_id'], 'integer'],
            [['NomeLote', 'DescricaoLote'], 'string', 'max' => 45],
            [['user_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::class, 'targetAttribute' => ['user_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'idLote' => 'Id Lote',
            'NomeLote' => 'Nome Lote',
            'DescricaoLote' => 'Descricao Lote',
            'user_id' => 'User ID',
        ];
    }

    /**
     * Gets query for [[Artigos]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getArtigos()
    {
        return $this->hasMany(Artigo::class, ['Lote_idLote' => 'idLote']);
    }

    /**
     * Gets query for [[User]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(User::class, ['id' => 'user_id']);
    }

    public static function getAll(){
        return $lot = Lote::find()->all();
    }
}
