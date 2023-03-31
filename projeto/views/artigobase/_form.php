<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/** @var yii\web\View $this */
/** @var app\models\artigobase $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="artigobase-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'ReferenciaBase')->textInput() ?>

    <?= $form->field($model, 'Nome')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Composicao')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'PrecoCusto')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'PrecoVenda')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
