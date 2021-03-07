<?php

namespace App;

class CreditCardAdapter implements PaymentAdapterInterface
{
    private $creditCard;

    public function __construct($creditCard)
    {
        $this->creditCard = $creditCard;
    }

    public function collectMoney($amount): bool
    {
        $result = $this->creditCard->authorizeTransaction($amount);
        return strpos($result, 'Authorization') === 0;
    }
}
