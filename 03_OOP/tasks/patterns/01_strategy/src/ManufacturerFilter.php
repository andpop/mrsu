<?php

namespace App;

class ManufacturerFilter implements ProductFilteringStrategy
{
    private $manufacturerName;

    public function __construct($manufacturerName)
    {
        $this->manufacturerName = $manufacturerName;
    }

    public function filter(Product $product): bool
    {
        if ($product->manufacturer == $this->manufacturerName) {
            return true;
        }
        return false;
    }
}
