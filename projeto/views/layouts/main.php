<?php

/** @var yii\web\View $this */
/** @var string $content */

use app\assets\AppAsset;
use app\widgets\Alert;
use yii\bootstrap5\Breadcrumbs;
use yii\bootstrap5\Html;
use yii\bootstrap5\Nav;
use yii\bootstrap5\NavBar;
use yii\web\JqueryAsset;

use webvimark\modules\UserManagement\components\GhostMenu;
use webvimark\modules\UserManagement\UserManagementModule;
use webvimark\modules\UserManagement\models\User;

AppAsset::register($this);   

$this->registerCsrfMetaTags();
$this->registerAssetBundle(JqueryAsset::class);
$this->registerMetaTag(['charset' => Yii::$app->charset], 'charset');
$this->registerMetaTag(['name' => 'viewport', 'content' => 'width=device-width, initial-scale=1, shrink-to-fit=no']);
$this->registerMetaTag(['name' => 'description', 'content' => $this->params['meta_description'] ?? '']);
$this->registerMetaTag(['name' => 'keywords', 'content' => $this->params['meta_keywords'] ?? '']);
$this->registerLinkTag(['rel' => 'icon', 'type' => 'image/x-icon', 'href' => Yii::getAlias('@web/favicon.ico')]);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>" class="h-100">

<head>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
</head>
<body class="d-flex flex-column h-100">
<?php $this->beginBody()  ?>
<?php if (!Yii::$app->user->isGuest): ?>


<header id="header">
    <?php 
    NavBar::begin([
        'brandLabel' => "STOCK",
        'brandUrl' => Yii::$app->homeUrl,
        'options' => ['class' => 'navbar-expand-md navbar-dark bg-dark fixed-top']
    ]);
    echo Nav::widget([
        'options' => ['class' => 'navbar-nav'],
        'items' => [
            ['label' => 'Home', 'url' => ['/site/index']],
            ['label' => 'Lotes', 'url' => ['/lote/index']],
            ['label' => 'Contactos', 'url' => ['/site/contact']],


            [
                'label' => 'User',
                'items'=>[        
                    ['label'=>'Logout', 'url'=>['/user-management/auth/logout']],
                    ['label'=>'Change own password', 'url'=>['/user-management/auth/change-own-password']],      
                ],
            ],

            [
                'label' => 'Backend routes',
                'items' => UserManagementModule::menuItems(),
                'visible' => !Yii::$app->user->isGuest && User::findIdentity(Yii::$app->user->id)->hasPermission("editUsers")

            ],
            /*Yii::$app->user->isGuest
                ? ['label' => 'Login', 'url' => ['/site/login']]
                : '<li class="nav-item">'
                    . Html::beginForm(['/site/logout'])
                    . Html::submitButton(
                        'Logout (' . Yii::$app->user->identity->username . ')',
                        ['class' => 'nav-link btn btn-link logout']
                    )
                    . Html::endForm()
                    . '</li>'
                    */
        ]
    ]);
    NavBar::end();
    ?>
</header>
<?php else: ?>
    <header id="header">
        <?php 
        NavBar::begin([
            'brandLabel' => "STOCK",
            'brandUrl' => Yii::$app->homeUrl,
            'options' => ['class' => 'navbar-expand-md navbar-dark bg-dark fixed-top']
        ]);
        echo Nav::widget([
            'options' => ['class' => 'navbar-nav'],
            'items' => [
                ['label' => 'Home', 'url' => ['/site/index']],
                ['label' => 'Contactos', 'url' => ['/site/contact']],
            ]
        ]);
        NavBar::end();
        ?>
    </header>
<?php endif; ?>

<main id="main" class="flex-shrink-0" role="main">
    <div class="container">
        <?php if (!empty($this->params['breadcrumbs'])): ?>
            <?= Breadcrumbs::widget(['links' => $this->params['breadcrumbs']]) ?>
        <?php endif ?>
        <?= Alert::widget() ?>
        <?= $content ?>
    </div>
</main>

<!--<footer id="footer" class="mt-auto py-3 bg-light">
    <div class="container">
        <div class="row text-muted">
            <div class="col-md-6 text-center text-md-start">&copy; My Company <?= date('Y') ?></div>
           
        </div>
    </div>
</footer>--> 

<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
