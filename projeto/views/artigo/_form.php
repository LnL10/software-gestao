<?php

use app\models\Artigobase;
use app\models\Categoria;
use app\models\Fornecedor;
use app\models\Lote;
use app\models\Marca;
use yii\helpers\Html;
use yii\helpers\CHtml;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use app\models\Cor;
use app\models\Tamanho;
use app\models\Genero;
use kartik\datecontrol\DateControl;









/** @var yii\web\View $this */
/** @var app\models\ArtigoModel $model */
/** @var yii\widgets\ActiveForm $form */


?>


<body>


    <div class="artigo-model-form" >
    

        <?php $form = ActiveForm::begin(); ?>

        <div class="row">
            <div  class="col-10">
            <?= $form->field($model, 'ArtigoBase_ReferenciaBase')->dropDownList(
            ArrayHelper::map(Artigobase::getAll(),'ReferenciaBase','Nome'),
            ['prompt'=> 'Selecionar Artigo Base']
        ) 
        ?>
            </div>
            <div  class="col-2" style="padding-top: 20px" >
            <?= Html::a('Adicionar Artigo Base', ['artigobase/create'], ['class' => 'add']) ?>
            </div>
        </div>
        



        <?= $form->field($model, 'Referencia')->textInput(['maxlength' => true]) ?>

     
        <?= $form->field($model, 'Data')->widget(DateControl::classname(), [
                'type'=>DateControl::FORMAT_DATE,
                'ajaxConversion'=>false,
                'widgetOptions' => [
                    'pluginOptions' => [
                        'autoclose' => true
                    ]
                ]
            ]);
            ?>

        <?= $form->field($model, 'Lote_idLote')->dropDownList(
                ArrayHelper::map(Lote::getAll(),'idLote','NomeLote'),
                ['prompt'=> 'Selecionar Lote']
            ) ->label('Lote')
        ?>

        <?= $form->field($model, 'Armazem')->textInput(['maxlength' => true]) ?>

        

        <?= $form->field($model, 'Cor_idCor')->dropDownList(
            ArrayHelper::map(Cor::getAll(),'idCor','CorSite'),
            ['prompt'=> 'Selecionar Cor']
        ) 
        ?>

        <?= $form->field($model, 'Tamanho_idtamanho')->dropDownList(
                ArrayHelper::map(Tamanho::getAll(),'idtamanho','SiteTamanho'),
                ['prompt'=> 'Selecionar Tamanho']
            ) 
        ?>



<?= $form->field($model, 'Categoria_idcategoria')->dropDownList(
                ArrayHelper::map(Categoria::getAll(),'idcategoria','NomeCategoria'),
                ['prompt'=> 'Selecionar Categoria']
            ) 
        ?>


        <?= $form->field($model, 'Genero_idGenero')->dropDownList(
                ArrayHelper::map(Genero::getAll(),'idGenero','TipoGenero'),
                ['prompt'=> 'Selecionar Genero']
            ) 
        ?>

<?= $form->field($model, 'Marca_idMarca')->dropDownList(
                ArrayHelper::map(Marca::getAll(),'idMarca','NomeMarca'),
                ['prompt'=> 'Selecionar Marca']
            ) 
        ?>

<?= $form->field($model, 'Fornecedor_idFornecedor')->dropDownList(
                ArrayHelper::map(Fornecedor::getAll(),'idFornecedor','NomeFornecedor'),
                ['prompt'=> 'Selecionar Fornecedor']
            ) 
        ?>

        

        

        <div class="form-group buttonAdd">
            <?= Html::submitButton('Adicionar', ['class' => 'buttonAdd']) ?>
        </div>

        <?php ActiveForm::end(); ?>

    </div>

</body>
