<?php

namespace App\Events;

class ViewProductHandler
{
	public function handle($product)
	{
		if (!is_null(session('products'))) {
			$products = session('products');
			if (!in_array($product->id, array_keys($products))) {
				$products[$product->id] = [
					'click' => 1,
					'date' => date('Y-m-d H:i:s'),
				];
			} else {
				$currentDate = date('Y-m-d H:i:s');
				$startDate = new \DateTime($products[$product->id]['date']);
				$sinceStart = $startDate->diff(new \DateTime($currentDate));
				if ($sinceStart->i >= 15) { // after 15 minutes, click increase
					$products[$product->id]['click'] += 1;
					$products[$product->id]['date'] = $currentDate;
				}
			}
			session(['products' => $products]);
		} else {
			session(['products' => [
				$product->id => [
					'click' => 1,
					'date' => date('Y-m-d H:i:s'),
				]
			]]);
		}
	}
}
