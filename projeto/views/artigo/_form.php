<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/** @var yii\web\View $this */
/** @var app\models\Artigo $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="artigo-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'idArtigo')->textInput() ?>

    <?= $form->field($model, 'ReferenciaBase')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Referencia')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Nome')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Cor')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Tamanho')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Descricao')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Categoria')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Genero')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'PrecoCusto')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'PrecoVenda')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Marca')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Fornecedor')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'CódigoDeBarras')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Data')->textInput() ?>

    <?= $form->field($model, 'Lote_idLote')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
