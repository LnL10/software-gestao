<?php

namespace app\models;

use Yii;


/**
 * This is the model class for table "artigo".
 *
 * @property int $idArtigo
 * @property string $Referencia
 * @property string|null $CódigoDeBarras
 * @property string|null $Data
 * @property int $Lote_idLote
 * @property string|null $Armazem
 * @property int $Cor_idCor
 * @property int $Tamanho_idtamanho
 * @property int $Categoria_idcategoria
 * @property int $Genero_idGenero
 * @property int $Marca_idMarca
 * @property int $Fornecedor_idFornecedor
 * @property int $ArtigoBase_ReferenciaBase
 *
 * @property Artigobase $artigoBaseReferenciaBase
 * @property Categoria $categoriaIdcategoria
 * @property Cor $corIdCor
 * @property Fornecedor $fornecedorIdFornecedor
 * @property Genero $generoIdGenero
 * @property Lote $loteIdLote
 * @property Marca $marcaIdMarca    
 * @property Tamanho $tamanhoIdtamanho
 * 
 * 
 */
class ArtigoModel extends \yii\db\ActiveRecord
{
    
    public $excelFile;  
    
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'artigo';
    }

    /**
     * {@inheritdoc}
     */

     
    public function rules()
    {
        return [
            [['Referencia', 'Lote_idLote', 'Cor_idCor', 'Tamanho_idtamanho', 'Categoria_idcategoria', 'Genero_idGenero', 'Marca_idMarca', 'Fornecedor_idFornecedor', 'ArtigoBase_ReferenciaBase'], 'required'],
            [['Data'], 'safe'],
            [['Lote_idLote', 'Cor_idCor', 'Tamanho_idtamanho', 'Categoria_idcategoria', 'Genero_idGenero', 'Marca_idMarca', 'Fornecedor_idFornecedor', 'ArtigoBase_ReferenciaBase'], 'integer'],
            [['Referencia', 'CódigoDeBarras', 'Armazem'], 'string', 'max' => 45],
            [['ArtigoBase_ReferenciaBase'], 'exist', 'skipOnError' => true, 'targetClass' => Artigobase::class, 'targetAttribute' => ['ArtigoBase_ReferenciaBase' => 'ReferenciaBase']],
            [['Categoria_idcategoria'], 'exist', 'skipOnError' => true, 'targetClass' => Categoria::class, 'targetAttribute' => ['Categoria_idcategoria' => 'idcategoria']],
            [['Cor_idCor'], 'exist', 'skipOnError' => true, 'targetClass' => Cor::class, 'targetAttribute' => ['Cor_idCor' => 'idCor']],
            [['Fornecedor_idFornecedor'], 'exist', 'skipOnError' => true, 'targetClass' => Fornecedor::class, 'targetAttribute' => ['Fornecedor_idFornecedor' => 'idFornecedor']],
            [['Genero_idGenero'], 'exist', 'skipOnError' => true, 'targetClass' => Genero::class, 'targetAttribute' => ['Genero_idGenero' => 'idGenero']],
            [['Lote_idLote'], 'exist', 'skipOnError' => true, 'targetClass' => Lote::class, 'targetAttribute' => ['Lote_idLote' => 'idLote']],
            [['Marca_idMarca'], 'exist', 'skipOnError' => true, 'targetClass' => Marca::class, 'targetAttribute' => ['Marca_idMarca' => 'idMarca']],
            [['Tamanho_idtamanho'], 'exist', 'skipOnError' => true, 'targetClass' => Tamanho::class, 'targetAttribute' => ['Tamanho_idtamanho' => 'idtamanho']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'idArtigo' => 'Id Artigo',
            'ArtigoBase_ReferenciaBase' => 'Artigo Base',
            'Referencia' => 'Referencia',
            'CódigoDeBarras' => 'Código De Barras',
            'Data' => 'Data',
            'Lote_idLote' => 'Lote Id Lote',
            'Armazem' => 'Armazem',
            'Cor_idCor' => 'Cor',
            'Tamanho_idtamanho' => 'Tamanho',
            'Categoria_idcategoria' => 'Categoria',
            'Genero_idGenero' => 'Genero',
            'Marca_idMarca' => 'Marca',
            'Fornecedor_idFornecedor' => 'Fornecedor',
            
        ];
    }

    /**
     * Gets query for [[ArtigoBaseReferenciaBase]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getArtigoBaseReferenciaBase()
    {
        return $this->hasOne(Artigobase::class, ['ReferenciaBase' => 'ArtigoBase_ReferenciaBase']);
    }

    /**
     * Gets query for [[CategoriaIdcategoria]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCategoriaIdcategoria()
    {
        return $this->hasOne(Categoria::class, ['idcategoria' => 'Categoria_idcategoria']);
    }

    /**
     * Gets query for [[CorIdCor]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCorIdCor()
    {
        return $this->hasOne(Cor::class, ['idCor' => 'Cor_idCor']);
    }

    /**
     * Gets query for [[FornecedorIdFornecedor]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getFornecedorIdFornecedor()
    {
        return $this->hasOne(Fornecedor::class, ['idFornecedor' => 'Fornecedor_idFornecedor']);
    }

    /**
     * Gets query for [[GeneroIdGenero]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getGeneroIdGenero()
    {
        return $this->hasOne(Genero::class, ['idGenero' => 'Genero_idGenero']);
    }

    /**
     * Gets query for [[LoteIdLote]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getLoteIdLote()
    {
        return $this->hasOne(Lote::class, ['idLote' => 'Lote_idLote']);
    }

    /**
     * Gets query for [[MarcaIdMarca]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getMarcaIdMarca()
    {
        return $this->hasOne(Marca::class, ['idMarca' => 'Marca_idMarca']);
    }

    /**
     * Gets query for [[TamanhoIdtamanho]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTamanhoIdtamanho()
    {
        return $this->hasOne(Tamanho::class, ['idtamanho' => 'Tamanho_idtamanho']);
    }

    public function getLote()
    {
        return $this->hasOne(Lote::class, ['idLote' => 'Lote_idLote']);
    }
    
}
