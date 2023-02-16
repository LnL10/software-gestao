<?php

use app\models\ArtigoModel;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;

/** @var yii\web\View $this */
/** @var app\models\ArtigoSearch $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = 'Artigo Models';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="artigo-model-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Create Artigo Model', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'idArtigo',
            'Referencia',
            'CódigoDeBarras',
            'Data',
            'Lote_idLote',
            //'Armazem',
            //'Cor_idCor',
            //'Tamanho_idtamanho',
            //'Categoria_idcategoria',
            //'Genero_idGenero',
            //'Marca_idMarca',
            //'Fornecedor_idFornecedor',
            //'ArtigoBase_ReferenciaBase',
            [
                'class' => ActionColumn::className(),
                'urlCreator' => function ($action, ArtigoModel $model, $key, $index, $column) {
                    return Url::toRoute([$action, 'idArtigo' => $model->idArtigo]);
                 }
            ],
        ],
    ]); ?>


</div>
