    <?php

    use app\models\Lote;
    use yii\helpers\Html;
    use yii\helpers\Url;
    use yii\grid\ActionColumn;
    use yii\grid\GridView;
    use yii\grid\ButtonColumn;
    use yii\bootstrap5\Dropdown;

    /** @var yii\web\View $this */
    /** @var app\models\LoteSearch $searchModel */
    /** @var yii\data\ActiveDataProvider $dataProvider */

    $this->title = 'Lotes';
    $this->params['breadcrumbs'][] = $this->title;
    ?>
    <div class="lote-index">

        <h1 class="title"><?= Html::encode($this->title ) ?></h1>

        

        <?php  //echo $this->render('_search', ['model' => $searchModel]); ?>

        <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
        
            'NomeLote',
            'DescricaoLote',
            
            [
                'class' => 'yii\grid\ActionColumn',
                'template' => '{update} {delete} ',
                'urlCreator' => function ($action, $model, $key, $index) {
                    return Url::toRoute([$action, 'idLote' => $model->idLote]);
                },
            ],
            [
                'class' => 'yii\grid\ActionColumn',
                'template' => '{artigos} {export} ',
                'buttons' => [
                    
                    'artigos' => function ($url, $model, $key) {
                        
                        return Html::a('Ver Artigos', ['lote/artigos', 'idLote' => $model->idLote], [
                            'class' => 'btn btn-primary',
                            'title' => 'Ver Artigos',
                            'data-pjax' => '0',
                        ]);
                    },
                    'export' => function ($url, $model, $key) {
                        /*return Html::a('Exportar Excel', ['export-excel-shopify', 'idLote' => $model->idLote], [
                            'class' => 'btn btn-success',
                            'title' => 'Exportar',
                            'data-pjax' => '0',
                        ]);*/

                        $items = [
                            [
                                'label' => 'Exportar Moloni',
                                'url' => ['export-excel-moloni', 'idLote' => $model->idLote],
                                'linkOptions' => [
                                    'title' => 'export-excel-moloni',
                                    'data-pjax' => '0',
                                ],
                            ],
                            [
                                'label' => 'Exportar Shopify',
                                'url' => ['export-excel-shopify', 'idLote' => $model->idLote],
                                'linkOptions' => [
                                    'title' => 'export-excel-shopify',
                                    'data-pjax' => '0',
                                ],
                            ],
                        ];

                        $dropdown = Dropdown::widget([
                           'items' => $items,
                            'options' => [
                                'class' => 'dropdown-menu-right',
                            ],
                        ]);

                        $button = Html::a('Exportar', '#', [
                            'class' => 'btn btn-success dropdown-toggle-split',
                            'data-bs-toggle' => 'dropdown',
                            'aria-haspopup' => 'true',
                            'aria-expanded' => 'false',
                        ]);
                    
                        
                        
                        return $button . $dropdown;
                    },
                
                ],
            ],
        ],
    ]); ?>

    


<p>
        <?= Html::a('Criar Lote', ['create'], ['class' => 'btn btn-success buttonAdd']) ?>
    </p>
</div>
