<?php

use yii\helpers\Html;
use yii\helpers\CHtml;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use app\models\Cor;
use app\models\Tamanho;

/** @var yii\web\View $this */
/** @var app\models\ArtigoModel $model */
/** @var yii\widgets\ActiveForm $form */


?>

<div class="artigo-model-form">

    <?php $form = ActiveForm::begin(); ?>
    <?= $form->field($model, 'ArtigoBase_ReferenciaBase')->textInput() ?>

    <?= $form->field($model, 'Referencia')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Data')->textInput() ?>

    <?= $form->field($model, 'Lote_idLote')->textInput() ?>

    <?= $form->field($model, 'Armazem')->textInput(['maxlength' => true]) ?>

    

    <?= $form->field($model, 'Cor_idCor')->dropDownList(
        ArrayHelper::map(Cor::getAll(),'idCor','CorSite'),
        ['prompt'=> 'Selecionar Cor']
    ) 
    ?>

    <?= $form->field($model, 'Tamanho_idtamanho')->dropDownList(
            ArrayHelper::map(Tamanho::getAll(),'idtamanho','TamanhoSite'),
            ['prompt'=> 'Selecionar Tamanho']
        ) 
    ?>



    

    <?= $form->field($model, 'Categoria_idcategoria')->textInput() ?>

    <?= $form->field($model, 'Genero_idGenero')->textInput() ?>

    <?= $form->field($model, 'Marca_idMarca')->textInput() ?>

    <?= $form->field($model, 'Fornecedor_idFornecedor')->textInput() ?>

    <?= $form->field($model, 'CódigoDeBarras')->textInput(['maxlength' => true]) ?>

    

    <div class="form-group">
        <?= Html::submitButton('Adicionar', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
