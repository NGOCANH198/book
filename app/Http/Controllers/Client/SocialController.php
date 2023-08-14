<?php

namespace App\Http\Controllers\Client;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Socialite;
use Exception;
use App\Models\User;
use Alert;

class SocialController extends Controller
{
    public function __construct()
    {
        $this->middleware('guest');
    }

    protected $providers = [
        'google'
    ];

    public function redirectToProvider($driver)
    {
        if(!$this->isProviderAllowed($driver) ) {
            return $this->sendFailedResponse("{$driver} is not currently supported");
        }

        try {
            return Socialite::driver($driver)->redirect();
        } catch (Exception $e) {
            // You should show something simple fail message
            return $this->sendFailedResponse($e->getMessage());
        }
    }

    public function handleProviderCallback($driver)
    {
        try {
            $user = Socialite::driver($driver)->user();
        } catch (Exception $e) {
            return $this->sendFailedResponse($e->getMessage());
        }

        // check for email in returned user
        return empty($user->email)
            ? $this->sendFailedResponse("No email will be returned from {$driver} provider.")
            : $this->loginOrCreateAccount($user, $driver);
    }

    protected function sendFailedResponse($msg = null)
    {
        Alert::error('Error', $msg);

        return redirect()->route('client.home');
    }

    protected function loginOrCreateAccount($providerUser, $driver)
    {
        try {
            // check for already has account
            $user = User::where('email', $providerUser->getEmail())->first();

            // if user already found
            if($user) {
                if ($user->status == 1) {
                    // update the avatar and provider that might have changed
                    $user->update([
                        'provider' => $driver,
                        'provider_id' => $providerUser->id,
                        'access_token' => $providerUser->token,
                        'avatar' => $providerUser->getAvatar(),
                    ]);
                } else {
                    Alert::error('Error', 'Hiện tài khoản của bạn đã bị khoá, vui lòng liên hệ quản trị viên để được hỗ trợ');

                    return redirect()->route('client.home');
                }
            } else {
                // create a new user
                $user = User::create([
                    'name' => $providerUser->getName(),
                    'email' => $providerUser->getEmail(),
                    'provider' => $driver,
                    'provider_id' => $providerUser->getId(),
                    'access_token' => $providerUser->token,
                    'password' => '',
                    'avatar' => $providerUser->getAvatar(),
                ]);
            }

            // login the user
            Auth::login($user, true);

            Alert::success('Success', 'Đăng nhập thành công');

            return redirect('/');
        } catch (Exception $e) {
            return $this->sendFailedResponse($e->getMessage());
        }
    }

    private function isProviderAllowed($driver)
    {
        return in_array($driver, $this->providers) && config()->has("services.{$driver}");
    }
}
