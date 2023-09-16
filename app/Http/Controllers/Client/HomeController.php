<?php
namespace App\Http\Controllers\Client;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\ProductSimilarity;
use App\Models\Product;

class HomeController extends Controller
{
    public function index()
    {
        $products = session('products');
        if (!is_null($products)) {
            $search = max(array_column($products, 'click'));
            $selectedId = key(array_filter($products, function ($v) use ($search) {
                return $v['click'] == $search;
            }, ARRAY_FILTER_USE_BOTH));
            $productSimilarity = new ProductSimilarity(Product::get()->toArray());
            $similarityMatrix = $productSimilarity->calculateSimilarityMatrix();
            $recommendProducts = $productSimilarity->getProductsSortedBySimilarity($selectedId, $similarityMatrix);
        } else {
            $recommendProducts = collect();
        }

        return view('client.home', compact('recommendProducts'));
    }
}
