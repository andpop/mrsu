<?php

namespace App;

class ProductCollection
{
    private $products = array();

    public function __construct(array $products)
    {
        $this->products = $products;
    }

    // Фильтрация списка товаров $this->products в соответствии с фильтром-экземпляром стратегии ProductFilteringStrategy
    public function filter(ProductFilteringStrategy $filterStrategy): ProductCollection
    {
        $filteredProducts = array();
        // ===================================
        //@TODO Добавить код для фильтрации товара из $this->products в $filteredProducts,
        //@TODO используя вызов $filterStrategy->filter()

        // foreach ($this->products as $product) {
        //   if ($filterStrategy->filter($product)) {
        //     $filteredProducts[] = $product;
        //   }
        // }

        return new ProductCollection($filteredProducts);
    }

    public function getProductsArray()
    {
        return $this->products;
    }
}
