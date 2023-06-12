<?php

use yii\grid\GridView;


echo GridView::widget([
    'dataProvider' => $dataProvider,
    'columns' => [
        
        'artigoBaseReferenciaBase.Nome',
        'Referencia',
        'marcaIdMarca.NomeMarca',  
        'tamanhoIdtamanho.SiteTamanho', 
        'corIdCor.CorSite',
        'CódigoDeBarras',
       
        
        
        [
            'label' => 'Lote',
            'value' => function ($model) {
                return $model->lote->NomeLote; 
            },
        ],
    ],
]);
?>
