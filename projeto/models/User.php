<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "user".
 *
 * @property int $idUser
 * @property string $Username
 * @property string $Email
 * @property string $Password
 *
 * @property Lote[] $lotes
 */
class User extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'user';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['idUser', 'Username', 'Email', 'Password'], 'required'],
            [['idUser'], 'integer'],
            [['Username', 'Email', 'Password'], 'string', 'max' => 45],
            [['idUser'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'idUser' => 'Id User',
            'Username' => 'Username',
            'Email' => 'Email',
            'Password' => 'Password',
        ];
    }

    /**
     * Gets query for [[Lotes]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getLotes()
    {
        return $this->hasMany(Lote::class, ['User_idUser' => 'idUser']);
    }
}
