    <?php

    use app\models\lote;
    use yii\helpers\Html;
    use yii\helpers\Url;
    use yii\grid\ActionColumn;
    use yii\grid\GridView;
    use yii\grid\ButtonColumn;

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
                        return Html::a('Exportar Excel', ['export-excel', 'idLote' => $model->idLote], [
                            'class' => 'btn btn-success',
                            'title' => 'Exportar',
                            'data-pjax' => '0',
                        ]);
                    },
                ],
            ],
        ],
    ]); ?>

    


<p>
        <?= Html::a('Criar Lote', ['create'], ['class' => 'btn btn-success buttonAdd']) ?>
    </p>
</div>
