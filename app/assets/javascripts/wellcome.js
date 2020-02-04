
    // Функция ymaps.ready() будет вызвана, когда
    // загрузятся все компоненты API, а также когда будет готово DOM-дерево.
    ymaps.ready(init);
    function init(){
        // Создание карты.
        var myMap = new ymaps.Map("map", {
            // Координаты центра карты.
            // Порядок по умолчанию: «широта, долгота».
            // Чтобы не определять координаты центра карты вручную,
            // воспользуйтесь инструментом Определение координат.
            center: [55.79653355, 49.10990467],
            // Уровень масштабирования. Допустимые значения:
            // от 0 (весь мир) до 19.
            zoom: 10,
            controls: ['zoomControl', 'rulerControl', 'geolocationControl']
        }),

            MyIconContentLayout = ymaps.templateLayoutFactory.createClass(
            '<div style="color: #FFFFFF; font-weight: bold;">$[properties.iconContent]</div>'
        ),

        myPlacemark = new ymaps.Placemark([55.780357, 49.1336609], {
            hintContent: 'Собственный значок метки с контентом',
            balloonContent: '<p> Адрес: Я чей то 5 <p>А эта — новогодняя была',
            iconContent: '11'
        },),

        myPlacemarkWithContent = new ymaps.Placemark([55.74298425, 49.2012826615953], {
            hintContent: 'Собственный значок метки с контентом',
            balloonContent: '<p> Адрес: Какой то дом 5 <p>А эта — новогодняя была',
            iconContent: '12'
        }, {
            // Опции.
            // Необходимо указать данный тип макета.
           
            // Макет содержимого.
            iconContentLayout: MyIconContentLayout
        });

    myMap.geoObjects
        .add(myPlacemark)
        .add(myPlacemarkWithContent);
    }
