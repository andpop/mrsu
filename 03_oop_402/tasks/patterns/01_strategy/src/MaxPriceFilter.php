<?php

namespace App;

class MaxPriceFilter implements ProductFilteringStrategy
{
    private $maxPrice;

    public function __construct($maxPrice)
    {
        $this->maxPrice = $maxPrice;
    }

    public function filter(Product $product): bool
    {
        if ($product->listPrice && $product->sellingPrice) {
            return ($product->listPrice - $product->sellingPrice) <= $this->maxPrice;
        } elseif ($product->listPrice) {
            return ($product->listPrice <= $this->maxPrice);
        }
        return false;
    }
}
