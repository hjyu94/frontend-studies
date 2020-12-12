// https://opentutorials.org/module/532/6544

// ### 클로저
// 클로저(closure)는 내부함수가 외부함수의 맥락(context)에 접근할 수 있는 것을 가르킨다. 
// 클로저는 자바스크립트를 이용한 고난이도의 테크닉을 구사하는데 필수적인 개념으로 활용된다.  

// ### 내부함수
// 자바스크립트는 함수 안에서 또 다른 함수를 선언할 수 있다. 
// 아래의 예제를 보자. 결과는 경고창에 coding everybody가 출력될 것이다.

function outter(){

    // 특정 함수 안에서만 사용되는 함수의 경우 바깥 함수 안에 함수를 만들면
    // 응집성이 높아지기 때문에 좋다.

    function inner(){
        var title = 'coding everybody'; 
        alert(title);
    }
    inner();
}
outter();

// 위의 예제에서 함수 outter의 내부에는 함수 inner가 정의 되어 있다. 
// 함수 inner를 내부 함수라고 한다.

// 내부함수는 외부함수의 지역변수에 접근할 수 있다. 
// 아래의 예제를 보자. 결과는 coding everybody이다.

function outter(){
    var title = 'coding everybody'; // 외부 함수의 지역변수
    function inner(){        
        alert(title); 
    }
    inner();
}
outter();

// 위의 예제는 내부함수 inner에서 title을 호출(4행)했을 때 
// 외부함수인 outter의 지역변수에 접근할 수 있음을 보여준다.

// inner 라는 함수에 지역변수 title 이 존재하지 않는다면 
// 자바 스크립트는 inner 를 포함하고 있는 바깥 쪽 함수에서 title 이라는 변수를 찾는다. 
// title이라는 변수가 외부함수에 존재하기 때문에 외부함수의 지역변수를 내부 함수에서 사용하게 된다.

// ### 클로저
// 클로저(closure)는 내부함수와 밀접한 관계를 가지고 있는 주제다. 
// 내부함수는 외부함수의 지역변수에 접근 할 수 있는데 외부함수의 실행이 끝나서 외부함수가 소멸된 이후에도 
// 내부함수가 외부함수의 변수에 접근 할 수 있다. 이러한 메커니즘을 클로저라고 한다. 

// 아래 예제는 이전의 예제를 조금 변형한 것이다. 
// 결과는 경고창으로 coding everybody를 출력할 것이다.

function outter(){ // 외부 함수
    var title = 'coding everybody';  
    return function(){ // 내부 함수 (익명 함수)
        alert(title);
    }
}
var inner = outter(); // 리턴된 내부 함수를 inner 라는 변수에 담는다.
inner(); // outter 함수는 실행이 끝났는데, 외부 함수의 변수에 여전히 접근이 가능하다.

// 예제의 실행순서를 주의깊게 살펴보자. 

// 7행에서 함수 outter를 호출하고 있다. 그 결과가 변수 inner에 담긴다. 
// 그 결과는 이름이 없는 함수다.

// 실행이 8행으로 넘어오면 outter 함수는 실행이 끝났기 때문에 
// 이 함수의 지역변수는 소멸되는 것이 자연스럽다.

// 하지만 8행에서 함수 inner를 실행했을 때 coding everybody가 출력된 것은 
// 외부함수의 지역변수 title이 소멸되지 않았다는 것을 의미한다.

// 클로저란 내부함수가 외부함수의 지역변수에 접근 할 수 있고, 
// 외부함수는 외부함수의 지역변수를 사용하는 내부함수가 소멸될 때까지 
// 소멸되지 않는 특성을 의미한다.

// 조금 더 복잡한 아래 예제를 살펴보자. 
// 아래 예제는 클로저를 이용해서 영화의 제목을 저장하고 있는 객체를 정의하고 있다. 
// 실행결과는 Ghost in the shell -> Matrix -> 공각기동대 -> Matrix 이다.

function factory_movie(title){ // 매개변수는 함수 안에서 지역변수로 사용된다.
    // 객체를 리턴한다. 객체의 value 로 내부함수가 사용되고 있다.
    return { 
        get_title : function (){
            return title;
        },
        set_title : function(_title){
            title = _title
        }
    }
}

ghost = factory_movie('Ghost in the shell');
matrix = factory_movie('Matrix');
 
alert(ghost.get_title()); // Ghost in the shell
alert(matrix.get_title()); // Matrix
 
ghost.set_title('공각기동대');
 
alert(ghost.get_title()); // 공각기동대
alert(matrix.get_title()); // matrix

// factory_movie 를 통해 두 개의 객체(ghost, matrix) 를 만들었다.
// 두 개의 객체는 각각 자신들이 실행된 그 시점에서의 맥략(context)에서의
// 외부 함수의 지역변수인 title 에 접근할 수 있었고 그 지역변수의 값은 유지가 되고 있기 때문에 
// ghost.set_title 을 통해서 ghost 의 title을 공각기동대로 바꾼다는 것은 
// ghost 객체가 접근할 수 있는 title 값만 바꿀 뿐이지 
// matrix라는 객체가 접근할 수 있는 title 의 값에는 어떠한 영향도 미치지 않는다든 것!
// --> private 변수!, get_title(), set_title() 은 public function.

/**************************************************************************************
위의 예제를 통해서 알 수 있는 것들을 정리해보면 아래와 같다.

1. 클로저는 객체의 메소드에서도 사용할 수 있다. 위의 예제는 함수의 리턴값으로 객체를 반환하고 있다. 이 객체는 메소드 get_title과 set_title을 가지고 있다. 이 메소드들은 외부함수인 factory_movie의 인자값으로 전달된 지역변수 title을 사용하고 있다.
2. 동일한 외부함수 안에서 만들어진 내부함수나 메소드는 외부함수의 지역변수를 공유한다. 17행에서 실행된 set_title은 외부함수 factory_movie의 지역변수 title의 값을 '공각기동대'로 변경했다. 19행에서 ghost.get_title();의 값이 '공각기동대'인 것은 set_title와 get_title 함수가 title의 값을 공유하고 있다는 의미다.
3. 그런데 똑같은 외부함수 factory_movie를 공유하고 있는 ghost와 matrix의 get_title의 결과는 서로 각각 다르다. 그것은 외부함수가 실행될 때마다 새로운 지역변수를 포함하는 클로저가 생성되기 때문에 ghost와 matrix는 서로 완전히 독립된 객체가 된다.
4. factory_movie의 지역변수 title은 2행에서 정의된 객체의 메소드에서만 접근 할 수 있는 값이다. 이 말은 title의 값을 읽고 수정 할 수 있는 것은 factory_movie 메소드를 통해서 만들어진 객체 뿐이라는 의미다. JavaScript는 기본적으로 Private한 속성을 지원하지 않는데, 클로저의 이러한 특성을 이용해서 Private한 속성을 사용할 수 있게된다.
**************************************************************************************/

// 참고 Private 속성은 객체의 외부에서는 접근 할 수 없는 외부에 감춰진 속성이나 메소드를 의미한다. 
// 이를 통해서 객체의 내부에서만 사용해야 하는 값이 노출됨으로서 생길 수 있는 오류를 줄일 수 있다.
// 자바와 같은 언어에서는 이러한 특성을 언어 문법 차원에서 지원하고 있다.

// 아래의 예제는 클로저와 관련해서 자주 언급되는 예제다. 

var arr = []
for(var i = 0; i < 5; i++){
    arr[i] = function(){
        return i;
    }
}
for(var index in arr) {
    console.log(arr[index]());
}

// 함수가 함수 외부의 컨텍스트에 접근할 수 있을 것으로 기대하겠지만 
// 위의 결과는 아래와 같다. 
// 5, 5, 5, 5, 5

// return i; 에서의 i 는 우리가 정의한 익명함수의 외부변수의 값이 아니기 때문.
// 익명함수를 내부함수로 하는 외부함수를 정의하고 외부함수의 지역변수의 값을 내부함수가 사용하도록 하면 된다!

// 위의 코드는 아래와 같이 변경해야 한다.

var arr = []
for(var i = 0; i < 5; i++){
    arr[i] = function(id) {
        return function(){
            return id;
        }
    }(i);
    // 익명함수를 만들고 function(){...};
    // 만든 익명함수를 바로 사용하고 function(){...}();
    // 만든 익명함수에 파라매터 i를 전달하여 id 라는 이름으로 사용한다. function(id){...}(i);
}
for(var index in arr) {
    console.log(arr[index]());
}

// 결과는 아래와 같다.
// 0, 1, 2, 3, 4
// 익명함수를 내부함수로 하는 외부함수를 정의하고 외부함수의 지역변수의 값을 내부함수가 사용하도록 하면 된다!


// 클로저 참고
// https://developer.mozilla.org/ko/docs/JavaScript/Guide/Closures
// http://ejohn.org/apps/learn/#48
// http://blog.javarouka.me/2012/01/javascripts-closure.html