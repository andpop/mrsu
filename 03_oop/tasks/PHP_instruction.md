### Требования к оформлению PHP-кода
* PHP-код и структура классов должны быть оформлены в соответствии со стандартами PSR-12 и PSR-4. 
* Должна быть настроена автозагрузка классов с помощью Composer.
* Корневое пространство имен названо `App` и ему должна соответствовать директория src. Фрагмент в composer.json:
```
{
    "autoload": {
        "psr-4": {"App\\": "src/"}
    }
}
```
