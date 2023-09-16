<?php

declare(strict_types=1);

namespace App;

use App\Models\Category;
use App\Models\Product;

class ProductSimilarity
{
    protected $products;
    protected $priceHighRange;

    public function __construct($products)
    {
        $this->products       = $products;
        $this->priceHighRange = max(array_column($products, 'price'));
    }

    public function calculateSimilarityMatrix()
    {
        $matrix = [];

        foreach ($this->products as $product) {

            $similarityScores = [];

            foreach ($this->products as $_product) {
                if ($product['id'] === $_product['id']) {
                    continue;
                }
                $similarityScores['product_id_' . $_product['id']] = $this->calculateSimilarityScore($product, $_product);
            }
            $matrix['product_id_' . $product['id']] = $similarityScores;
        }
        return $matrix;
    }

    public function getProductsSortedBySimilarity($productId, $matrix)
    {
        $similarities = $matrix['product_id_' . $productId];
        $sortedProducts = collect();
        foreach ($similarities as $k => $v) {
            if ($v > 0.5) {
                $sortedProducts->add(Product::find(intval(str_replace('product_id_', '', $k))));
            }
        }

        return $sortedProducts;
    }

    protected function calculateSimilarityScore($productA, $productB)
    {
        return array_sum([
            (Similarity::hamming($productA, $productB)),
            (Similarity::euclidean(
                Similarity::minMaxNorm([$productA['price']], 0, $this->priceHighRange),
                Similarity::minMaxNorm([$productB['price']], 0, $this->priceHighRange)
            )),
            (Similarity::jaccard(Category::find($productA['category_id'])->name, Category::find($productB['category_id'])->name))
        ]) / 3;
    }
}
