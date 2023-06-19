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
use app\models\Preferencias;
use yii\helpers\Url;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use Yii;
use yii\web\UploadedFile;
use yii\filters\AccessControl;


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
        return [
            'access' => [
                'class' => AccessControl::class,
                'rules' => [
                    [
                        'allow' => true,
                        'roles' => ['@'], 
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::class,
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
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
        $dataProvider->query->joinWith('lote')->andWhere(['lote.idLote' => $lote]);
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
        if ($model->load($this->request->post())) {
            $fornecedorId = $model->Fornecedor_idFornecedor;
            $corId = $model->Cor_idCor;
            $tamanhoId = $model->Tamanho_idtamanho;
            

            $fornecedor = Fornecedor::findOne($fornecedorId);
            $cor = Cor::findOne($corId);
            $tamanho = Tamanho::findOne($tamanhoId);
            $marca = Marca::findOne($model->Marca_idMarca);

            $codigoBarras = $this->generateCodigoBarras($cor, $tamanho, $fornecedor,$marca);

            $model->CódigoDeBarras = $codigoBarras;

            $referenciaBase = $model->ArtigoBase_ReferenciaBase;


            
            
            if ($marca) {
                
                $model->Referencia = $referenciaBase . '.' . strval($marca->TotalMarca);
                $marca->TotalMarca++;
                $marca->save();
            }
            

            if ($model->save()) {
                return $this->redirect(['lote/artigos', 'idLote' => $model->Lote_idLote]);
            }
        }
    } else {
        $model->loadDefaultValues();
    }

    return $this->render('create', [
        'model' => $model,
    ]);
}

    private function generateCodigoBarras($cor, $tamanho, $fornecedor,$marca)
        {
            
            $userId = Yii::$app->user->id;
            $preferencias = Preferencias::findOne(['user_id' => $userId]);
            $estacao = $preferencias ? $preferencias->CEstacao : '31';
            $estacao = str_pad($estacao, 2, '0', STR_PAD_LEFT);
            $totalMarca = str_pad(strval($marca->TotalMarca), 3, '0', STR_PAD_LEFT); 
            $corCodigo = $cor ? str_pad($cor->CCor, 3, '0', STR_PAD_LEFT) : '000'; 
            $tamanhoCodigo = $tamanho ? str_pad($tamanho->CTamanho, 3, '0', STR_PAD_LEFT) : '00'; 
            $fornecedorCodigo = $fornecedor ? str_pad($fornecedor->CFornecedor, 2, '0', STR_PAD_LEFT) : '00';


            $codigoBarras = $estacao . $fornecedorCodigo . $totalMarca . $corCodigo . $tamanhoCodigo; 

            return $codigoBarras;
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
    public function actionDelete($idArtigo,$idLote)
    {
        $this->findModel($idArtigo)->delete();

        return $this->redirect(['lote/artigos', 'idLote' => $idLote]);
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
                $errors = '';
                $importSuccess = true; 
                $userId = Yii::$app->user->id;
                
                foreach ($worksheet->getRowIterator() as $row) {
                    if ($rowIndex == 1) { 
                        $rowIndex++;
                        continue;
                    }
                    $rowData = $worksheet->toArray(null, true, true, true)[$row->getRowIndex()];
                    $artigo = new ArtigoModel();
                    $artigo->Referencia = $rowData["A"];
    
                    $loteNome = $rowData["B"];
                    $lote = Lote::findOne(['NomeLote' => $loteNome]);
                    if ($lote === null) {
                        $lote = new Lote();
                        $lote->NomeLote = $loteNome;
                        $lote->user_id = $userId;
                        $lote->save();
                    }
                    $artigo->Lote_idLote = $lote->idLote;
    
    
                    $corNome = $rowData["C"]; 
                    $cor = Cor::findOne(['CorSite' => $corNome]); 
                    if ($cor !== null) {
                        $artigo->Cor_idCor = $cor->idCor; 
                    } else {
                        $errors.= "Artigo #".($rowIndex-1).": Cor não encontrada: $corNome\n";
                        $importSuccess = false;
                    }
    
                    $TamanhoNome = $rowData["D"];
                    $tamanho = Tamanho::findOne(['SiteTamanho' => $TamanhoNome]); 
                    if ($tamanho !== null) {
                        $artigo->Tamanho_idtamanho = $tamanho->idtamanho; 
                    } else {
                        $errors.="Artigo #".($rowIndex-1).": Tamanho não encontrada: $TamanhoNome\n";  
                        $importSuccess = false;
                    }
    
                    $CategoriaNome = $rowData["E"];
                    $categoria = Categoria::findOne(['NomeCategoria' => $CategoriaNome]); 
                    if ($categoria !== null) {
                        $artigo->Categoria_idcategoria = $categoria->idcategoria; 
                    } else {
                        $errors.="Artigo #".($rowIndex-1).": Categoria não encontrada: $CategoriaNome\n";  
                        $importSuccess = false;
                    }
    
    
                    $GeneroNome = $rowData["F"];
                    $genero = Genero::findOne(['TipoGenero' => $GeneroNome]); 
                    if ($genero !== null) {
                        $artigo->Genero_idGenero = $genero->idGenero; 
                    } else {
                        $errors.="Artigo #".($rowIndex-1).": Gênero não encontrado: $GeneroNome\n"; 
                        $importSuccess = false;
                    }
    
                    $MarcaNome = $rowData["G"];
                    $marca = Marca::findOne(['NomeMarca' => $MarcaNome]); 
                    if ($marca !== null) {
                        $artigo->Marca_idMarca = $marca->idMarca; 
                    } else {
                        $errors.="Artigo #".($rowIndex-1).": Marca não encontrada: $MarcaNome\n";  
                        $importSuccess = false;
                    }
    
    
                    $FornecedorNome = $rowData["H"];
                    $fornecedor = Fornecedor::findOne(['NomeFornecedor' => $FornecedorNome]); 
                    if ($fornecedor !== null) {
                        $artigo->Fornecedor_idFornecedor = $fornecedor->idFornecedor; 
                    } else {
                        $errors.= "Artigo #".($rowIndex-1).": Fornecedor não encontrado: $FornecedorNome\n"; 
                        $importSuccess = false;
                    }
    
                    $artigo->ArtigoBase_ReferenciaBase = $rowData["I"];
    
                    $codigoBarras = $this->generateCodigoBarras($cor, $tamanho, $fornecedor, $marca);
                    $artigo->CódigoDeBarras = $codigoBarras;
    
                    $artigo->save();
                    $rowIndex++;
                }
                if (!$importSuccess) {
                    Yii::$app->session->setFlash('warning', $errors);
                }
    
                if ($importSuccess) {
                    Yii::$app->session->setFlash('success', 'Dados importados com sucesso.');
                    return $this->redirect(['lote/artigos', 'idLote' => $artigo->Lote_idLote]);
                }
            }
        }
    
        Yii::$app->session->setFlash('fail', 'Erro ao importar os dados');
        return $this->render('importar', [
            'model' => $model,
        ]);
    }
    
    


    public function actionExemplo()
{
    $filePath = '..\assets\exemplo.xlsx'; 

    return Yii::$app->response->sendFile($filePath, 'exemplo.xlsx');
}
    
   
}
