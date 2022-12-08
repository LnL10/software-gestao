<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\models\Artigo $model */

$this->title = 'Update Artigo: ' . $model->idArtigo;
$this->params['breadcrumbs'][] = ['label' => 'Artigos', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->idArtigo, 'url' => ['view', 'idArtigo' => $model->idArtigo]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="artigo-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
