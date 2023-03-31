<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\models\artigobase $model */

$this->title = 'Update Artigobase: ' . $model->ReferenciaBase;
$this->params['breadcrumbs'][] = ['label' => 'Artigobases', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->ReferenciaBase, 'url' => ['view', 'ReferenciaBase' => $model->ReferenciaBase]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="artigobase-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
