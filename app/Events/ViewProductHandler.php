<?php

namespace App\Events;

use Cookie;
use App\Models\UserClickProduct;
class ViewProductHandler
{
	public function handle($product)
	{
		if (is_null(Cookie::get('user_token'))) {
			$token = hash("sha256", time() . rand(0, 100));
			$expired = time() + 60 * 60 * 24 * 365; // one year
            Cookie::queue('user_token', $token, $expired);
			UserClickProduct::create([
				'user_token' => $token,
				'product_id' => $product->id,
				'click' => 1
			]);
		} else {
			$userClickProduct = UserClickProduct::where([['user_token', Cookie::get('user_token')], ['product_id', $product->id]]);
			if ($userClickProduct->exists()) {
				$currentDate = date('Y-m-d H:i:s');
				$startDate = new \DateTime($userClickProduct->first()->created_at);
				$sinceStart = $startDate->diff(new \DateTime($currentDate));
				if ($sinceStart->i >= 0.05) { // after 5 seconds, click increase
					$userClickProduct->increment('click', 1);
				}
			} else {
				UserClickProduct::create([
					'user_token' => Cookie::get('user_token'),
					'product_id' => $product->id,
					'click' => 1
				]);
			}
		}
	}
}
