<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "preferencias".
 *
 * @property int $idpreferencias
 * @property string|null $CEstacao
 * @property int $user_id
 *
 * @property User $user
 */
class Preferencias extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'preferencias';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
        {
            return [
                [['user_id'], 'required'],
                [['idpreferencias', 'user_id'], 'integer'],
                [['CEstacao'], 'string', 'max' => 10],
                [['idpreferencias'], 'unique'],
                [['user_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::class, 'targetAttribute' => ['user_id' => 'id']],
            ];
        }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'idpreferencias' => 'Idpreferencias',
            'CEstacao' => 'C Estacao',
            'user_id' => 'User ID',
        ];
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
}
