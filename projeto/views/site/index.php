<?php
use yii\bootstrap5\Html;
use yii\bootstrap5\Nav;
use yii\bootstrap5\NavBar;
use app\models\Preferencias;

/** @var yii\web\View $this */
$CEstacao = "21";

$this->title = 'STOCK';
?>
<?php
$userId = Yii::$app->user->id;
$preferencias = Preferencias::findOne(['user_id' => $userId]);
$CEstacao = $preferencias ? $preferencias->CEstacao : "31";
?>



<div class="navbar-fixed-right">
    <?php
    NavBar::begin([
        'brandLabel' => "Preferências",
        'options' => [
            'class' => 'navbar-inverse',
        ],
        'containerOptions' => [
            'class' => 'sidebar-navbar',
        ],
    ]);

    echo Nav::widget([
        'options' => ['class' => 'navbar-nav'],
    ]);
    echo '<div class="navbar-form navbar-right">';
    echo Html::beginForm(['preferencias/alterar-preferencias'], 'post'); 
    echo Html::label('Código Estação:', 'CEstacao', ['class' => 'control-label']);
    echo '<div class="input-group">';
    echo Html::textInput('CEstacao', $CEstacao, ['class' => 'form-control']); 
    echo Html::submitButton('Alterar', ['class' => 'btn btn-primary']);
    echo '</div>';
    
    echo Html::endForm();
    echo '</div>';
    

    NavBar::end();
    ?>
</div>

<div style="padding-top: 120px">
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
