<?php
use yii\bootstrap5\Html;
use yii\grid\GridView;
use yii\helpers\Url;

?>

<?= yii\bootstrap5\Breadcrumbs::widget([
    'links' => [
        [
            'label' => 'Lotes',
            'url' => ['/lote/index'],
        ],
        'Tabela de Artigos',
    ],
]) ?>


<h1 class="title">ARTIGOS DO LOTE <?= $lote->NomeLote ?></h1>

<?= GridView::widget([
    'dataProvider' => $dataProvider,
    
    'columns' => [
        ['class' => 'yii\grid\SerialColumn'],
    
        'artigoBaseReferenciaBase.Nome',
        'Referencia',
        'marcaIdMarca.NomeMarca',  
        'tamanhoIdtamanho.SiteTamanho', 
        [
            'class' => 'yii\grid\ActionColumn',
            'template' => '{update} {delete}',
            'urlCreator' => function ($action, $model, $key, $index) use ($lote) {
                if ($action === 'update') {
                    return Url::to(['artigo/update', 'idArtigo' => $model->idArtigo, 'idLote' => $lote->idLote]);
                }
                if ($action === 'delete') {
                    return Url::to(['artigo/delete', 'idArtigo' => $model->idArtigo, 'idLote' => $lote->idLote]);
                }
            },
        ],  
        
    ],
    
]) ?>

<div class="panel-heading">
        
        <?= Html::a('Novo Artigo', ['artigo/create'], ['class' => 'buttonAdd1 ']) ?>
</div>

