<?php

namespace App;

class PayPalAdapter implements PaymentAdapterInterface
{
    private $paypal;

    public function __construct($paypal)
    {
        $this->paypal = $paypal;
    }

    public function collectMoney($amount): bool
    {
        $result = $this->paypal->transfer('payments@myshop.com', $amount);
        return ($result === 'Paypal Success!');
    }
}
