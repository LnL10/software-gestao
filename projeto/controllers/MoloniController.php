<?php

namespace app\controllers;

use yii\web\Controller;
use GuzzleHttp\Client;

class MoloniController extends Controller
{
    
    public function actionInserirArtigosLote($loteId)
    {
        
        $artigosDoLote = ArtigoModel::find()->where(['lote_id' => $loteId])->all();

        
        $client = new Client([
            'base_uri' => 'https://api.moloni.com/v1/',
            'timeout' => 10.0,
            'headers' => [
                'Content-Type' => 'application/json',
                'Authorization' => 'a35a4449e4a010bf50d332e53780b0fa626899e5',
            ],
        ]);

        
        foreach ($artigosDoLote as $artigo) {
            
            $body = [
                'name' => $artigo->nome,
                'reference' => $artigo->referencia,
                'price' => $artigo->preco,
                'unit' => $artigo->unidade,
                'stock' => $artigo->quantidade,
                
            ];

            
            $response = $client->post('products/insert', [
                'body' => json_encode($body),
            ]);

           
            
        }

        
        return 'Artigos do lote ' . $loteId . ' enviados para a Moloni com sucesso!';
    }
}
