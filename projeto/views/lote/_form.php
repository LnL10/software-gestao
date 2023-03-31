<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/** @var yii\web\View $this */
/** @var app\models\lote $model */
/** @var yii\widgets\ActiveForm $form */
?>


<div class="lote-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'NomeLote')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'DescricaoLote')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'user_id')->hiddenInput(['value' => Yii::$app->user->id])->label(false) ?>

    


    <div class="form-group ">
        <?= Html::submitButton('Criar', ['class' => 'btn btn-success buttonAdd']) ?>
    </div>

    <?php ActiveForm::end(); ?>
    

</div>
