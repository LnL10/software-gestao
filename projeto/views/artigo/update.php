<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\models\ArtigoModel $model */

$this->title = 'Update Artigo Model: ' . $model->idArtigo;
$this->params['breadcrumbs'][] = ['label' => 'Artigo Models', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->idArtigo, 'url' => ['view', 'idArtigo' => $model->idArtigo]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="artigo-model-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
