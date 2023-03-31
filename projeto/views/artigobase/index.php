<?php

use app\models\artigobase;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;

/** @var yii\web\View $this */
/** @var app\models\ArtigoSearch $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = 'Artigobases';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="artigobase-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Create Artigobase', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'ReferenciaBase',
            'Nome',
            'Composicao',
            'PrecoCusto',
            'PrecoVenda',
            [
                'class' => ActionColumn::className(),
                'urlCreator' => function ($action, artigobase $model, $key, $index, $column) {
                    return Url::toRoute([$action, 'ReferenciaBase' => $model->ReferenciaBase]);
                 }
            ],
        ],
    ]); ?>


</div>
