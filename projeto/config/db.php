<?php

return [
    'class' => 'yii\db\Connection',
    'dsn' => 'mysql:host='.env('MYSQL_HOSTNAME', 'localhost').';dbname='.env('MYSQL_DATABASE', 'db'),
    'username' => env('MYSQL_USER', 'root'),
    'password' => env('MYSQL_PASSWORD', ''),
    'charset' => 'utf8',

    // Schema cache options (for production environment)
    //'enableSchemaCache' => true,
    //'schemaCacheDuration' => 60,
    //'schemaCache' => 'cache',
];
