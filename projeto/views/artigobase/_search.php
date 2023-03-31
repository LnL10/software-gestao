<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/** @var yii\web\View $this */
/** @var app\models\ArtigoSearch $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="artigobase-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'ReferenciaBase') ?>

    <?= $form->field($model, 'Nome') ?>

    <?= $form->field($model, 'Composicao') ?>

    <?= $form->field($model, 'PrecoCusto') ?>

    <?= $form->field($model, 'PrecoVenda') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-outline-secondary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
