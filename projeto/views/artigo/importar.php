<div style="text-align: center;">
    <?php
    use yii\helpers\Html;
    use yii\widgets\ActiveForm;

    $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data', 'class' => 'importar'], 'action' => ['importar']]);?>

    <h3 class="title" style="margin-bottom: 30px;">
        <?= $form->field($model, 'excelFile')->fileInput([
            'class' => 'form-control',
            'options' => ['accept' => '.xlsx']
        ])->label('Selecione um arquivo Excel para importar') ?>
    </h3>

    <div class="form-group" style="margin-bottom: 20px;">
        <?= Html::submitButton('Importar', ['class' => 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end() ?>

    <?= Html::a('Download ficheiro exemplo Excel', ['exemplo'], ['class' => 'btn btn-success']) ?>

</div>
