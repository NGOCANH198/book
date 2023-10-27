<?php
namespace App\Http\Controllers\Client;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\ProductSimilarity;
use App\Models\Product;
use App\Models\UserClickProduct;

class HomeController extends Controller
{
    public function index()
    {
        $products = UserClickProduct::get()->toArray();
        if (count($products) > 0) {
            $search = max(array_column($products, 'click'));
            $products = array_filter($products, function ($v) use ($search) {
                return $v['click'] == $search;
            }, ARRAY_FILTER_USE_BOTH);
            $selectedId = reset($products)['product_id']; // trả về id sản phẩm click cao nhất
            $productSimilarity = new ProductSimilarity(Product::get()->toArray());
            $similarityMatrix = $productSimilarity->calculateSimilarityMatrix();
            $recommendProducts = $productSimilarity->getProductsSortedBySimilarity($selectedId, $similarityMatrix);
        } else {
            $recommendProducts = collect();
        }

        return view('client.home', compact('recommendProducts'));
    }
}
