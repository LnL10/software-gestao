<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/** @var yii\web\View $this */
/** @var app\models\Artigo $model */

$this->title = $model->idArtigo;
$this->params['breadcrumbs'][] = ['label' => 'Artigos', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="artigo-view">

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
            'ReferenciaBase',
            'Referencia',
            'Nome',
            'Cor',
            'Tamanho',
            'Descricao',
            'Categoria',
            'Genero',
            'PrecoCusto',
            'PrecoVenda',
            'Marca',
            'Fornecedor',
            'CódigoDeBarras',
            'Data',
            'Lote_idLote',
        ],
    ]) ?>

</div>
