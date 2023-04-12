<?php

namespace app\controllers;


use app\models\ArtigoModel;
use app\models\ArtigoSearch;
use app\models\lote;
use app\models\LoteSearch;
use yii\data\ActiveDataProvider;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;


/**
 * LoteController implements the CRUD actions for lote model.
 */
class LoteController extends Controller
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
     * Lists all lote models.
     *
     * @return string
     */
    public function actionIndex()
    {
        $searchModel = new LoteSearch();
        $dataProvider = $searchModel->search($this->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single lote model.
     * @param int $idLote Id Lote
     * @return string
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($idLote)
    {
        return $this->render('view', [
            'model' => $this->findModel($idLote),
        ]);
    }

    /**
     * Creates a new lote model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return string|\yii\web\Response
     */
    public function actionCreate()
    {
        $model = new lote();

        if ($this->request->isPost) {
            if ($model->load($this->request->post()) && $model->save()) {
                return $this->redirect(['index', 'idLote' => $model->idLote]);
            }
        } else {
            $model->loadDefaultValues();
        }

        return $this->render('create', [
            'model' => $model,
        ]);
        
    }

    /**
     * Updates an existing lote model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param int $idLote Id Lote
     * @return string|\yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($idLote)
    {
        $model = $this->findModel($idLote);

        if ($this->request->isPost && $model->load($this->request->post()) && $model->save()) {
            return $this->redirect(['view', 'idLote' => $model->idLote]);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing lote model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param int $idLote Id Lote
     * @return \yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($idLote)
    {
        $this->findModel($idLote)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the lote model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param int $idLote Id Lote
     * @return lote the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($idLote)
    {
        if (($model = lote::findOne(['idLote' => $idLote])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }

    public function actionArtigos($idLote)
{
    $lote = $this->findModel($idLote);
    $searchModel = new ArtigoSearch();
    $searchModel->Lote_idLote = $idLote;
    $dataProvider = $searchModel->search($this->request->queryParams);

    return $this->render('artigos', [
        'lote' => $lote,
        'searchModel' => $searchModel,
        'dataProvider' => $dataProvider,
    ]);
    
}



public function actionExportExcelMoloni($idLote)
{
    $dataProvider = new ActiveDataProvider([
        'query' => ArtigoModel::find()->where(['Lote_idLote' => $idLote]),
        'pagination' => [
            'pageSize' => 20,
        ],
    ]);

    // create a new spreadsheet object
    $spreadsheet = new Spreadsheet();

    // set the active sheet
    $sheet = $spreadsheet->getActiveSheet();

    // set the column headers
    $sheet->setCellValue('A1', 'Artigo');
    $sheet->setCellValue('B1', 'Referencia');
    $sheet->setCellValue('C1', 'Marca');
    $sheet->setCellValue('D1', 'Tamanho');

    // loop through the data provider and add the rows to the worksheet
    $row = 2;
    foreach ($dataProvider->getModels() as $model) {
        $sheet->setCellValue('A' . $row, $model->artigoBaseReferenciaBase->Nome);
        $sheet->setCellValue('B' . $row, $model->Referencia);
        $sheet->setCellValue('C' . $row, $model->marcaIdMarca->NomeMarca);
        $sheet->setCellValue('D' . $row, $model->tamanhoIdtamanho->SiteTamanho);
        $row++;
    }

    // set the filename and headers for the download
    $filename = 'moloni-artigos-lote-' . $idLote . '.xlsx';
    header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
    header('Content-Disposition: attachment;filename="' . $filename . '"');
    header('Cache-Control: max-age=0');

    // create the writer
    $writer = new Xlsx($spreadsheet);

    // output the file to the browser
    $writer->save('php://output');
    exit();
}

public function actionExportExcelShopify($idLote)
{
    $dataProvider = new ActiveDataProvider([
        'query' => ArtigoModel::find()->where(['Lote_idLote' => $idLote]),
        'pagination' => [
            'pageSize' => 20,
        ],
    ]);

    // create a new spreadsheet object
    $spreadsheet = new Spreadsheet();

    // set the active sheet
    $sheet = $spreadsheet->getActiveSheet();

    // set the column headers
    $sheet->setCellValue('A1', 'Artigo');
    $sheet->setCellValue('B1', 'Referencia');
    

    // loop through the data provider and add the rows to the worksheet
    $row = 2;
    foreach ($dataProvider->getModels() as $model) {
        $sheet->setCellValue('A' . $row, $model->artigoBaseReferenciaBase->Nome);
        $sheet->setCellValue('B' . $row, $model->Referencia);
       
        $row++;
    }

    // set the filename and headers for the download
    $filename = 'shopify-artigos-lote-' . $idLote . '.xlsx';
    header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
    header('Content-Disposition: attachment;filename="' . $filename . '"');
    header('Cache-Control: max-age=0');

    // create the writer
    $writer = new Xlsx($spreadsheet);

    // output the file to the browser
    $writer->save('php://output');
    exit();
}


}
