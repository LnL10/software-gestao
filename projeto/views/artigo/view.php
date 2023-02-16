<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/** @var yii\web\View $this */
/** @var app\models\ArtigoModel $model */

$this->title = $model->idArtigo;
$this->params['breadcrumbs'][] = ['label' => 'Artigo Models', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="artigo-model-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'idArtigo' => $model->idArtigo], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'idArtigo' => $model->idArtigo], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'idArtigo',
            'Referencia',
            'CódigoDeBarras',
            'Data',
            'Lote_idLote',
            'Armazem',
            'Cor_idCor',
            'Tamanho_idtamanho',
            'Categoria_idcategoria',
            'Genero_idGenero',
            'Marca_idMarca',
            'Fornecedor_idFornecedor',
            'ArtigoBase_ReferenciaBase',
        ],
    ]) ?>

</div>
