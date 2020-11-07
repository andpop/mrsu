let db;

let openRequest = indexedDB.open('test', 2);

openRequest.onsuccess = function (event) {
    console.log('open db --- onsuccess');
    db = event.target.result;

    addPlay(db); 
    addPlay(db); 
    addName(db);
    addName(db);
};

openRequest.onupgradeneeded = function () {
    console.log('open db --- onupgradeneeded');
    db = event.target.result;
    if (!db.objectStoreNames.contains('plays')) {
        db.createObjectStore('plays', {keyPath: 'id', autoIncrement: true});
    };
    if (!db.objectStoreNames.contains('names')) {
        db.createObjectStore('names', {autoIncrement: true});
    };
};

function addPlay(db) {
    let transaction = db.transaction('plays', 'readwrite');
    let plays = transaction.objectStore('plays');

    let play = {
        // id: 2,
        name: 'Andrey',
        result: 'lose'
    };

    let request = plays.add(play);

    request.onsuccess = function () {
        console.log('Партия записана в БД');
    };

    request.onerror = function (event) {
        console.log('Ошибка при записи в БД', event.target.error);
    };
};

function addName(db) {
    let transaction = db.transaction('names', 'readwrite');
    let names = transaction.objectStore('names');

    let name = {
        name: 'Andrey',
        lastname: 'Popov'
    };

    let request = names.add(name);

    request.onsuccess = function () {
        console.log('Имя записано в БД');
    };

    request.onerror = function (event) {
        console.log('Ошибка при записи в БД', event.target.error);
    };
};


console.log(db);
