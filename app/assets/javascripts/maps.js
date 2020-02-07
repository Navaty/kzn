//Вытаскиваем все get запрсы на стороне клиента

function getJsonFromUrl(url) {
  if(!url) url = location.href;
  var question = url.indexOf("?");
  var hash = url.indexOf("#");
  if(hash==-1 && question==-1) return {};
  if(hash==-1) hash = url.length;
  var query = question==-1 || hash==question+1 ? url.substring(hash) : 
  url.substring(question+1,hash);
  var result = {};
  query.split("&").forEach(function(part) {
    if(!part) return;
    part = part.split("+").join(" "); // replace every + with space, regexp-free version
    var eq = part.indexOf("=");
    var key = eq>-1 ? part.substr(0,eq) : part;
    var val = eq>-1 ? decodeURIComponent(part.substr(eq+1)) : "";
    var from = key.indexOf("[");
    if(from==-1) result[decodeURIComponent(key)] = val;
    else {
      var to = key.indexOf("]",from);
      var index = decodeURIComponent(key.substring(from+1,to));
      key = decodeURIComponent(key.substring(0,from));
      if(!result[key]) result[key] = [];
      if(!index) result[key].push(val);
      else result[key][index] = val;
    }
  });
  return result;
}

var params = getJsonFromUrl();


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
            zoom: 11,
            controls: ['zoomControl', 'rulerControl', 'geolocationControl']
        }),

           objectManager = new ymaps.ObjectManager({
            // Чтобы метки начали кластеризоваться, выставляем опцию.
            clusterize: true,
            // ObjectManager принимает те же опции, что и кластеризатор.
            gridSize: 32,
        });

          	objectManager.objects.options.set('preset', 'islands#darkOrangeIcon');
		    objectManager.clusters.options.set('preset', 'islands#greenClusterIcons');
		    myMap.geoObjects.add(objectManager);


		    $.ajax({
		        url: "/daddresses.json",
                type: "get",
                data: {
                    map: {
                    type: params['type'],
                    id: params['id']
                    }
                }
		    }).done(function(data) {
		        objectManager.add(data);
		    });
    }