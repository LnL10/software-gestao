<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\models\Lote $model */

$this->title = 'Criar Lote';
$this->params['breadcrumbs'][] = ['label' => 'Lotes', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="lote-create">

    <h1 class="text-center"><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
