<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\models\ArtigoModel $model */

$this->title = 'Adicionar Artigos';
$this->params['breadcrumbs'][] = ['label' => 'Artigo', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="artigo-model-create">

    <h1 class="title"><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>

