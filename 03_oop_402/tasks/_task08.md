Реализовать класс `Url`, который описывает переданный в конструктор URL-адрес (допустимые протоколы HTTP и HTTPS) и позволяет извлекать из него части (https://developer.mozilla.org/ru/docs/Learn/Understanding_URLs):
* `getProtocol()`
* `getDomainName()`
* `getPort()` - если порт явно не указано, то используются порты по умолчанию для протоколов HTTP и HTTPS.
* `getPath()`
* `getQueryParams()` - возвращается query string без преобразования.
* `getParamArray()` - возвращается массив с параметрами запроса (ключ-значение).
