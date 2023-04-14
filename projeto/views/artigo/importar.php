<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;

$form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data'],'action' => ['importar']]) ?>
    
<?= $form->field($model, 'excelFile')->fileInput() ?>

<div class="form-group">
    <?= Html::submitButton('Importar', ['class' => 'btn btn-primary']) ?>
</div>

<?php ActiveForm::end() ?>