<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "lote".
 *
 * @property int $idLote
 * @property string $NomeLote
 * @property string|null $DescricaoLote
 * @property int $User_idUser
 *
 * @property Artigo[] $artigos
 * @property User $userIdUser
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
            [['idLote', 'NomeLote', 'User_idUser'], 'required'],
            [['idLote', 'User_idUser'], 'integer'],
            [['NomeLote', 'DescricaoLote'], 'string', 'max' => 45],
            [['idLote'], 'unique'],
            [['User_idUser'], 'exist', 'skipOnError' => true, 'targetClass' => User::class, 'targetAttribute' => ['User_idUser' => 'idUser']],
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
            'User_idUser' => 'User Id User',
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
     * Gets query for [[UserIdUser]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getUserIdUser()
    {
        return $this->hasOne(User::class, ['idUser' => 'User_idUser']);
    }
}
