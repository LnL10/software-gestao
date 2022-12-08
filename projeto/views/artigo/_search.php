<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/** @var yii\web\View $this */
/** @var app\models\ArtigoSearch $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="artigo-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'idArtigo') ?>

    <?= $form->field($model, 'ReferenciaBase') ?>

    <?= $form->field($model, 'Referencia') ?>

    <?= $form->field($model, 'Nome') ?>

    <?= $form->field($model, 'Cor') ?>

    <?php // echo $form->field($model, 'Tamanho') ?>

    <?php // echo $form->field($model, 'Descricao') ?>

    <?php // echo $form->field($model, 'Categoria') ?>

    <?php // echo $form->field($model, 'Genero') ?>

    <?php // echo $form->field($model, 'PrecoCusto') ?>

    <?php // echo $form->field($model, 'PrecoVenda') ?>

    <?php // echo $form->field($model, 'Marca') ?>

    <?php // echo $form->field($model, 'Fornecedor') ?>

    <?php // echo $form->field($model, 'CódigoDeBarras') ?>

    <?php // echo $form->field($model, 'Data') ?>

    <?php // echo $form->field($model, 'Lote_idLote') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-outline-secondary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
