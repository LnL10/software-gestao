<?php

namespace app\controllers;

use app\models\ArtigoModel;
use app\models\ArtigoSearch;
use app\models\Lote;
use app\models\Cor;
use app\models\Tamanho;
use app\models\Categoria;
use app\models\Genero;
use app\models\Marca;
use app\models\Fornecedor;
use app\models\Artigobase;
use yii\helpers\Url;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use Yii;
use yii\web\UploadedFile;


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

    public function actionViewImportar()
    {
        $model = new ArtigoModel();
        return $this->render('importar',[
            'model' => $model,
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


    public function actionImportar()
    {
        $model = new ArtigoModel();
    
        if ($model->load(Yii::$app->request->post())) {
            $model->excelFile = UploadedFile::getInstance($model, 'excelFile');
            if ($model->excelFile) {
                $reader = \PhpOffice\PhpSpreadsheet\IOFactory::createReader('Xlsx');
                $spreadsheet = $reader->load($model->excelFile->tempName);
                $worksheet = $spreadsheet->getActiveSheet();
    
                $rowIndex = 1;
                foreach ($worksheet->getRowIterator() as $row) {
                    if ($rowIndex == 1) { // ignora a primeira linha
                        $rowIndex++;
                        continue;
                    }
                    $rowData = $worksheet->toArray(null, true, true, true)[$row->getRowIndex()];
                    $artigo = new ArtigoModel();
                    $artigo->Referencia = $rowData["A"];

                    $artigo->Lote_idLote = $rowData["B"];
                    

                    $corNome = $rowData["C"]; 
                    $cor = Cor::findOne(['CorSite' => $corNome]); 
                    if ($cor !== null) {
                        $artigo->Cor_idCor = $cor->idCor; 
                    } else {
                        Yii::warning("Cor não encontrada: $corNome"); 
                    }
                    
                    $TamanhoNome = $rowData["D"];
                    $tamanho = Tamanho::findOne(['SiteTamanho' => $TamanhoNome]); 
                    if ($tamanho !== null) {
                        $artigo->Tamanho_idtamanho = $tamanho->idtamanho; 
                    } else {
                        Yii::warning("Tamanho não encontrada: $TamanhoNome"); 
                    }

                    $CategoriaNome = $rowData["E"];
                    $categoria = Categoria::findOne(['NomeCategoria' => $CategoriaNome]); 
                    if ($categoria !== null) {
                        $artigo->Categoria_idcategoria = $categoria->idcategoria; 
                    } else {
                        Yii::warning("Categoria não encontrada: $CategoriaNome"); 
                    }


                    $GeneroNome = $rowData["F"];
                    $genero = Genero::findOne(['TipoGenero' => $GeneroNome]); 
                    if ($genero !== null) {
                        $artigo->Genero_idGenero = $genero->idGenero; 
                    } else {
                        Yii::warning("Genero não encontrada: $GeneroNome"); 
                    }

                    $MarcaNome = $rowData["G"];
                    $marca = Marca::findOne(['NomeMarca' => $MarcaNome]); 
                    if ($marca !== null) {
                        $artigo->Marca_idMarca = $marca->idMarca; 
                    } else {
                        Yii::warning("Marca não encontrada: $MarcaNome"); 
                    }


                    $FornecedorNome = $rowData["H"];
                    $fornecedor = Fornecedor::findOne(['NomeFornecedor' => $FornecedorNome]); 
                    if ($fornecedor !== null) {
                        $artigo->Fornecedor_idFornecedor = $fornecedor->idFornecedor; 
                    } else {
                        Yii::warning("Fornecedor não encontrada: $FornecedorNome"); 
                    }

                    $artigo->ArtigoBase_ReferenciaBase = $rowData["I"];

                    $artigo->save();
                    $rowIndex++;
                }
    
                Yii::$app->session->setFlash('success', 'Dados importados com sucesso.');
                return $this->redirect(['lote/artigos', 'idLote' => $artigo->Lote_idLote]);
            }
        }
    
        Yii::$app->session->setFlash('fail', 'Erro ao importar os dados');
        return $this->render('create', [
            'model' => $model,
        ]);
    }
    
   
}
