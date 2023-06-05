<?php

namespace app\controllers;

use Yii;

use app\models\Preferencias;
use \yii\web\Controller;


class PreferenciasController extends Controller
{
    public function actionIndex()
    {
        return $this->render('index');
    }

   
    public function actionAlterarPreferencias()
    {
        $userId = Yii::$app->user->id; 
        $preferencias = Preferencias::findOne(['user_id' => $userId]);

        if (!$preferencias) {
            $preferencias = new Preferencias();
            $preferencias->user_id = $userId;
        }

        
        $preferencias->CEstacao = Yii::$app->request->post('CEstacao');

        if ($preferencias->save()) {
            Yii::$app->session->setFlash('success', 'Preferências alteradas com sucesso.');
        } else {
            Yii::$app->session->setFlash('error', 'Erro ao alterar as preferências.');
        }

        return $this->redirect(['site/index']);
    }

}
