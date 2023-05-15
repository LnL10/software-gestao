<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/** @var yii\web\View $this */
/** @var app\models\Lote $model */

$this->title = $model->idLote;
$this->params['breadcrumbs'][] = ['label' => 'Lotes', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="lote-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'idLote' => $model->idLote], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'idLote' => $model->idLote], [
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
            'idLote',
            'NomeLote',
            'DescricaoLote',
            'user_id',
        ],
    ]) ?>

</div>
