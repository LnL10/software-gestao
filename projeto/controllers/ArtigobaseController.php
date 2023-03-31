<?php

namespace app\controllers;

use app\models\artigobase;
use app\models\ArtigoSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * ArtigobaseController implements the CRUD actions for artigobase model.
 */
class ArtigobaseController extends Controller
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
     * Lists all artigobase models.
     *
     * @return string
     */
    public function actionIndex()
    {
        $searchModel = new ArtigoSearch();
        $dataProvider = $searchModel->search($this->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single artigobase model.
     * @param int $ReferenciaBase Referencia Base
     * @return string
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($ReferenciaBase)
    {
        return $this->render('view', [
            'model' => $this->findModel($ReferenciaBase),
        ]);
    }

    /**
     * Creates a new artigobase model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return string|\yii\web\Response
     */
    public function actionCreate()
    {
        $model = new artigobase();

        if ($this->request->isPost) {
            if ($model->load($this->request->post()) && $model->save()) {
                return $this->redirect(['view', 'ReferenciaBase' => $model->ReferenciaBase]);
            }
        } else {
            $model->loadDefaultValues();
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing artigobase model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param int $ReferenciaBase Referencia Base
     * @return string|\yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($ReferenciaBase)
    {
        $model = $this->findModel($ReferenciaBase);

        if ($this->request->isPost && $model->load($this->request->post()) && $model->save()) {
            return $this->redirect(['view', 'ReferenciaBase' => $model->ReferenciaBase]);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing artigobase model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param int $ReferenciaBase Referencia Base
     * @return \yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($ReferenciaBase)
    {
        $this->findModel($ReferenciaBase)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the artigobase model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param int $ReferenciaBase Referencia Base
     * @return artigobase the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($ReferenciaBase)
    {
        if (($model = artigobase::findOne(['ReferenciaBase' => $ReferenciaBase])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
