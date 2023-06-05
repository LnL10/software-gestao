    <?php
    use yii\helpers\Html;
    use yii\widgets\ActiveForm;




    $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data', 'class' => 'importar'], 'action' => ['importar']]);?>

        
        <?= $form->field($model, 'excelFile')->fileInput([
            'class' => 'form-control',
            'options' => ['accept' => '.xlsx']
        ])->label('Selecione um arquivo Excel para importar') ?>

            <div class="form-group">
                <?= Html::submitButton('Importar', ['class' => 'btn btn-primary']) ?>
            </div>


    <?php ActiveForm::end() ?>


    <?= Html::a('Download ficheiro exemplo Excel', ['exemplo'], ['class' => 'btn btn-success']) ?>

