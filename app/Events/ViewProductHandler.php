<?php

namespace App\Events;

use Cookie;
use App\Models\UserClickProduct;
class ViewProductHandler
{
	public function handle($product)
	{
		if (is_null(Cookie::get('user_token'))) {
			// Tạo user token, 1 trình duyệt sẽ là 1 token để phân biệt các user vãng lai
			$token = hash("sha256", time() . rand(0, 100));
			$expired = time() + 60 * 60 * 24 * 365; // one year
            Cookie::queue('user_token', $token, $expired);
			// Lưu user token với click vào database bằng model
			UserClickProduct::create([
				'user_token' => $token,
				'product_id' => $product->id,
				'click' => 1
			]);
		} else {
			$userClickProduct = UserClickProduct::where([['user_token', Cookie::get('user_token')], ['product_id', $product->id]]);
			// Check xem trong bảng mới có user token và product trc đó chưa, có rồi thì k cần thêm mới mà chỉ việc tăng click
			if ($userClickProduct->exists()) {
				$currentDate = date('Y-m-d H:i:s');
				$startDate = new \DateTime($userClickProduct->first()->created_at);
				$sinceStart = $startDate->diff(new \DateTime($currentDate));
				if ($sinceStart->i >= 0.05) { // after 5 seconds, click increase
					$userClickProduct->increment('click', 1);
				}
			// Chưa có thì thêm mới
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
