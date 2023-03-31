<?php

namespace app\controllers;

use app\models\ArtigoModel;
use app\models\ArtigoSearch;
use app\models\Lote;
use yii\helpers\Url;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * ArtigoController implements the CRUD actions for ArtigoModel model.
 */
class ArtigoController extends Controller
{
    /**
     * @inheritDoc
     */
    public function behaviors()
    {
        return array_merge(
            parent::behaviors(),
            [
                'verbs' => [
                    'class' => VerbFilter::className(),
                    'actions' => [
                        'delete' => ['POST'],
                    ],
                ],
            ]
        );
    }

    /**
     * Lists all ArtigoModel models.
     *
     * @return string
     */
    public function actionIndex($lote = null)
{
    $searchModel = new ArtigoSearch();
    $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        
    if ($lote !== null) {
        $dataProvider->query->joinWith('Lote')->andWhere(['Lote.idLote' => $lote]);
    }
        
    return $this->render('index', [
        'searchModel' => $searchModel,
        'dataProvider' => $dataProvider,
    ]);
}

    

    /**
     * Displays a single ArtigoModel model.
     * @param int $idArtigo Id Artigo
     * @return string
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($idArtigo)
    {
        return $this->render('view', [
            'model' => $this->findModel($idArtigo),
        ]);
    }

    /**
     * Creates a new ArtigoModel model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return string|\yii\web\Response
     */
    public function actionCreate()
    {
        $model = new ArtigoModel();

        if ($this->request->isPost) {
            if ($model->load($this->request->post()) && $model->save()) {
                return $this->redirect(['lote/artigos', 'idLote' => $model->Lote_idLote]);
            }
        } else {
            $model->loadDefaultValues();
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing ArtigoModel model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param int $idArtigo Id Artigo
     * @return string|\yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($idArtigo)
    {
        $model = $this->findModel($idArtigo);

        if ($this->request->isPost && $model->load($this->request->post()) && $model->save()) {
            return $this->redirect(['lote/artigos', 'idLote' => $model->Lote_idLote]);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing ArtigoModel model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param int $idArtigo Id Artigo
     * @return \yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($idArtigo)
    {
        $this->findModel($idArtigo)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the ArtigoModel model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param int $idArtigo Id Artigo
     * @return ArtigoModel the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($idArtigo)
    {
        if (($model = ArtigoModel::findOne(['idArtigo' => $idArtigo])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }

    


   
}
