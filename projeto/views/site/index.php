<?php
use yii\bootstrap5\Html;

/** @var yii\web\View $this */

$this->title = 'STOCK';
?>

<div style="padding-top:120px">

<div class="row">

    <div class="col-6" style="display: flex; justify-content: center; align-items: center;">    
    <?= Html::a('Criar Novo Lote', ['lote/create'], ['class' => 'but']) ?>
    </div>

    <div class="col-6" style="display: flex; justify-content: center; align-items: center;">
    <?= Html::a('Importar', ['artigo/view-importar'], ['class' => 'but']) ?>
    </div>

</div>


<div style="display: flex; justify-content: center; align-items: center;">
    <?= Html::a('Gerir Artigos/Lotes', ['lote/index'], ['class' => 'but']) ?>
</div>


</div>

