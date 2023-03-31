<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\models\artigobase $model */

$this->title = 'Create Artigobase';
$this->params['breadcrumbs'][] = ['label' => 'Artigobases', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="artigobase-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
