<?php

use app\models\Artigo;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;

/** @var yii\web\View $this */
/** @var app\models\ArtigoSearch $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = 'Artigos';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="artigo-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Create Artigo', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'idArtigo',
            'ReferenciaBase',
            'Referencia',
            'Nome',
            'Cor',
            //'Tamanho',
            //'Descricao',
            //'Categoria',
            //'Genero',
            //'PrecoCusto',
            //'PrecoVenda',
            //'Marca',
            //'Fornecedor',
            //'CódigoDeBarras',
            //'Data',
            //'Lote_idLote',
            [
                'class' => ActionColumn::className(),
                'urlCreator' => function ($action, Artigo $model, $key, $index, $column) {
                    return Url::toRoute([$action, 'idArtigo' => $model->idArtigo]);
                 }
            ],
        ],
    ]); ?>


</div>
