<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/** @var yii\web\View $this */
/** @var app\models\ArtigoSearch $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="artigo-model-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'idArtigo') ?>

    <?= $form->field($model, 'Referencia') ?>

    <?= $form->field($model, 'CódigoDeBarras') ?>

    <?= $form->field($model, 'Data') ?>

    <?= $form->field($model, 'Lote_idLote') ?>

    <?php // echo $form->field($model, 'Armazem') ?>

    <?php // echo $form->field($model, 'Cor_idCor') ?>

    <?php // echo $form->field($model, 'Tamanho_idtamanho') ?>

    <?php // echo $form->field($model, 'Categoria_idcategoria') ?>

    <?php // echo $form->field($model, 'Genero_idGenero') ?>

    <?php // echo $form->field($model, 'Marca_idMarca') ?>

    <?php // echo $form->field($model, 'Fornecedor_idFornecedor') ?>

    <?php // echo $form->field($model, 'ArtigoBase_ReferenciaBase') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-outline-secondary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
