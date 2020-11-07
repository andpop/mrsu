let db;

let openRequest = indexedDB.open('test', 1);

openRequest.onsuccess = function (event) {
    console.log('open db --- onsuccess');
    db = event.target.result;

    addPlay(); 
    addPlay(); 
};

openRequest.onupgradeneeded = function () {
    console.log('open db --- onupgradeneeded');
    db = event.target.result;
    if (!db.objectStoreNames.contains('plays')) {
        db.createObjectStore('plays', {keyPath: 'id', autoIncrement: true});
    };
};

function addPlay() {
    let transaction = db.transaction('plays', 'readwrite');
    let plays = transaction.objectStore('plays');

    let play = {
        // id: 2,
        name: 'Sergey',
        result: 'win'
    };

    let request = plays.add(play);

    request.onsuccess = function () {
        console.log('Партия записана в БД');
    };

    request.onerror = function (event) {
        console.log('Ошибка при записи в БД', event.target.error);
    };
};
