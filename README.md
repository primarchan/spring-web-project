# :pushpin: Spring-Web-Project
>Spring Framework 기반 웹 프로젝트
>
>코드로 배우는 스프링 웹 프로젝트[개정판]을 통해 학습된 내용 및 실습 기반으로 제작된 프로젝트

</br>

## 1. 제작 기간 & 참여 인원
- 2021년 8월 1일 ~ 진행 중
- 개인 프로젝트

</br>

## 2. 사용 기술
#### `Back-end`
  - Java 8
  - Spring Framework 5.0.7
  - Maven
  - Oracle Database
  - Spring Security
  - Mybatis
#### `Front-end`
  - HTML5
  - CSS3
  - BootStrap
  - JavaScript
  - JQuery


</br>

## 3. ERD 설계
![]()


## 4. 핵심 기능
>웹 프로젝트는 총 7단계로 구성되어있습니다.
>
>[Spring 개발 환경 구축 단계] 부터 [Spring Web Security를 이용한 로그인 처리]까지 각 단계별로 기능들을 구현했습니다.

<details>
<summary><b>핵심 기능 설명 펼치기</b></summary>
<div markdown="1">

### 4.1. [스프링 개발 환경 구축](https://github.com/PrimarchAn/SpringProject02/tree/master/ex00)
<details>
<summary><b>세부 설명 펼치기</b></summary>
<div markdown="1">

- **Maven이 사용하는 pom.xml** :pushpin: [코드 확인](https://github.com/PrimarchAn/SpringProject02/blob/master/ex00/pom.xml)
  - 생성된 프로젝트의 라이브러리는 pom.xml 파일을 통해서 관리

<br>

- **servlet-context.xml** :pushpin: [코드 확인](https://github.com/PrimarchAn/SpringProject02/blob/master/ex00/src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml)
  - 웹과 관련된 스프링 설정파일

<br>

- **root-context.xml** :pushpin: [코드 확인](https://github.com/PrimarchAn/SpringProject02/blob/master/ex00/src/main/webapp/WEB-INF/spring/root-context.xml)
  - 스프링 설정파일

<br>

- **의존성 주입 테스트** :pushpin: [코드 확인](https://github.com/PrimarchAn/SpringProject02/tree/master/ex00/src/main/java/org/taesan/sample)
  - Restaurant 객체 생성 후 그곳에서 근무하는 Chef 객체를 주입하는 예제
  - Spring에서는 생성자를 이용한 주입과 Setter 메서드를 이용한 주입으로 의존성 구현
  - 의존성 주입 설정 방식은 주로 XML이나 Annotation을 이용해 처리

<br>

- **커넥션 풀 설정** :pushpin: [코드 확인](https://github.com/PrimarchAn/SpringProject02/blob/master/ex00/src/main/webapp/WEB-INF/spring/root-context.xml#L23)
  - Java에서는 DataSource라는 인터페이스를 통해 커넥션 풀을 사용
  - DataSource를 통해 매번 데이터베이스와 연결하는 방식이 아닌, 미리 연결을 맺어주고 반환하는 구조를 이요하여 성능 향상을 꾀함
  - 커넥션 풀에는 여러 종류가 있고, spring-jdbc를 이요하는 방식도 있지만 본 프로젝트에서는 HikariCP 이용

<br>

- **MyBatis와 Spring 연동** :pushpin: [코드 확인](https://github.com/PrimarchAn/SpringProject02/blob/master/ex00/src/main/webapp/WEB-INF/spring/root-context.xml#L27)
  - MyBatis는 'SQL 매핑(mapping) 프레임워크'로 분류
  - MyBatis와 Spring 연동을 통해 SQL 처리 속도 향상
  - 개발 편의성 증대를 위해 [Mapper](https://github.com/PrimarchAn/SpringProject02/blob/master/ex00/src/main/resources/org/taesan/mapper/TimeMapper.xml)를 XML과 인터페이스 + Annotation 형태로 작성 

</div>
</details>

### 4.2. [스프링 MVC 설정](https://github.com/PrimarchAn/SpringProject02/tree/master/ex01)
<details>
<summary><b>세부 설명 펼치기</b></summary>
<div markdown="1">

- **스프링MVC의 기본 구조**
  - 스프링MVC 프로젝트를 구성해서 사용한다는 의미는 내부적으로는 root-context.xml로 사용하는 일반 Java 영역(POJO, Plain Old Java Object)과 servlet-context.xml로 설정하는 Web 관련 영역을 같이 연동해서 구동

<br>

- **스프링MVC의 Controller**
  - 스프링MVC를 이용하는 경우 작성되는 `Controller`의 특징
    - `HttpServletRequest`, `HttpServletResponse`를 거의 사용할 필요없이 필요한 기능 구현
    - 다양한 타입의 파라미터 처리, 다양한 타입의 리턴 타입 사용 가능
    - GET방식, POST방식 등 전송 방식에 대한 처리를 어노테이션으로 처리 가능
    - 상속/인터페이스 방식 대신에 어노테이션만으로도 필요한 설정 가능
  - `Controller`의 리턴타입
    - String : jsp를 이용하는 경우에는 jsp 파일의 경로와 파일이름을 나타내기 위해서 사용 :pushpin: [코드 확인](https://github.com/PrimarchAn/SpringProject02/blob/master/ex01/src/main/java/org/taesan/controller/SampleController.java#L111)
    - void : 호출하는 URL과 동일한 이름의 jsp를 의미 :pushpin: [코드 확인](https://github.com/PrimarchAn/SpringProject02/blob/master/ex01/src/main/java/org/taesan/controller/SampleController.java#L131)
    - VO, DTO 타입 : 주로 JSON 타입의 데이터를 만들어서 반환하는 용도로 사용(추가적인 라이브러리 필요) :pushpin: [코드 확인](https://github.com/PrimarchAn/SpringProject02/blob/master/ex01/src/main/java/org/taesan/controller/SampleController.java#L137)
    - ResponseEntity 타입: response할 때 Http 헤더 정보와 내용을 가공하는 용도로 사용(추가적인 라이브러리 필요) :pushpin: [코드 확인](https://github.com/PrimarchAn/SpringProject02/blob/master/ex01/src/main/java/org/taesan/controller/SampleController.java#L150)
    - Model, ModelAndView: Model로 데이터를 반환하거나 화면까지 같이 지정하는 경우에 사용(최근에는 많이 사용 안함)
    - HttpHeaders : 응답에 내용 없이 Http 헤더 메시지만 전달하는 용도로 사용
  - @Controller :pushpin: [코드 확인](https://github.com/PrimarchAn/SpringProject02/blob/master/ex01/src/main/java/org/taesan/controller/SampleController.java#L24)
    - 해당 클래스의 인스턴스를 스프링의 빈으로 등록하고 `Controller`로 사용
    - `<component-scan>`과 같이 활용 :pushpin: [코드 확인](https://github.com/PrimarchAn/SpringProject02/blob/master/ex01/src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml#L41)
    - 스프링MVC의 `Controller`는 메서드의 파라미터를 자동으로 수집, 변환하는 편리한 기능을 제공
    - Java Beans 규칙에 맞게 작성되어야 함 :pushpin: [코드 확인](https://github.com/PrimarchAn/SpringProject02/blob/master/ex01/src/main/java/org/taesan/domain/SampleDTO.java)
      - 생성자가 없거나 빈 생성자 
      - 올바른 규칙으로 만들어진 `Getter/Setter 메서드`
  - @RequestMapping :pushpin: [코드 확인](https://github.com/PrimarchAn/SpringProject02/blob/master/ex01/src/main/java/org/taesan/controller/SampleController.java#L25)
    - 특정한 URI에 대한 처리를 해당 `Controller`나 메서드에서 처리
    - 스프링 4.3 전까지는 `@RequestMapping( method =‘get’)` 방식으로 사용
    - 스프링 4.3이후에는 `@GetMapping`, `@PostMapping`등으로 간단히 표현 가능
  - `RedirectAttribute`
    - 화면에 한번만 전달되는 파라미터를 처리하는 용도 
    - 내부적으로 `HttpSession 객체`에 담아서 한번만 사용되고, 폐기 


<br>

- **데이터 전달자 역할을 하는 Model**
  - `Controller`의 메서드를 작성할 때는 특별하게 Model이라는 타입을 파라미터로 지정
    - Model 객체는 JSP에 `Controller`에서 생성된 데이터를 담아서 전달하는 역할을 하는 존재
    - JSP와 같은 뷰(View)로 전달해야 하는 데이터를 담아서 보냄
    - 메서드의 파라미터에 Model 타입이 지정된 경우 스프링은 특별하게 Model 타입의 객체를 만들어서 메서드에 주입
    - 모델2 방식에서 사용하는 `request.setAttribute( )`와 유사한 역할
  - `@ModelAttribute`
    - `Controller`에서 메서드의 파라미터는 기본자료형을 제외한 객체형 타입은 다시 화면으로 전달
    - `@ModelAttribute`는 명시적으로 화면에 전달되도록 지정 

</div>
</details>

### 4.3. [기본적인 웹 게시물 관리](https://github.com/PrimarchAn/SpringProject02/tree/master/ex02)
<details>
<summary><b>세부 설명 펼치기</b></summary>
<div markdown="1">

- **웹 프로젝트의 기본 구성**
  - 일반적으로 웹 프로젝트는 3-tier 방식으로 구성(Presentaiton, Business, Persistence)
  - Presentation Tier(화면 계층) : 화면에 보여주는 기술을 사용하는 영역
  - Business Tier(비즈니스 계층) : 순순한 비즈니스 로직을 담고 있는 영역, 고객들이 사용하는 용어를 그대로 메서드에 사용(설계와 고객의 요구 사항이 정확히 일치)
  - Persistence Tier(영속 or 데이터 계층) : 데이터를 어떤 방식으로 보관하고, 사용하는가에 대한 설계가 들어가는 계층
  - Spring MVC 영역은 Presentation Tier를 구성

<br>

- **Create(Insert) 처리**
  - insert만 처리되고 생성된 PK 값을 알 필요가 없는 경우 :pushpin: [코드 확인](https://github.com/PrimarchAn/SpringProject02/blob/master/ex02/src/main/resources/org/taesan/mapper/BoardMapper.xml#L13)
  - insert문이 실행되고 생성된 PK 값을 알아야 하는 경우 :pushpin: [코드 확인](https://github.com/PrimarchAn/SpringProject02/blob/master/ex02/src/main/resources/org/taesan/mapper/BoardMapper.xml#L18)

<br>

- **Read(Select) 처리**
  - insert가 된 데이터를 조회하는 작업은 PK를 이용해서 처리하므로 BoardMapper의 파라미터 역시 BoardVO 클래스의 bno 타입 정보를 이용해서 처리 :pushpin: [코드 확인](https://github.com/PrimarchAn/SpringProject02/blob/master/ex02/src/main/java/org/taesan/mapper/BoardMapper.java#L21)
  - MyBatis는 bno라는 칼럼이 존재하면 인스턴스의 `setBno()`를 호출
  - MyBatis의 모든 파라미터와 리턴 타입의 처리는 `get 파라미터명()`, `set 칼럼명()`의 규칙으로 호출
  - `#{속성}`이 1개만 존재하는 경우에는 별도의 `get 파라미터명()`을 사용하지 않고 처리

<br>

 - **Update 처리**
  - `update()`의 메서드 리턴 타입은 `int`로 지정해서 만일 정상적으로 데이터가 수정되면 1 이상의 값을 가지도록 설계 :pushpin: [코드 확인](https://github.com/PrimarchAn/SpringProject02/blob/master/ex02/src/main/java/org/taesan/mapper/BoardMapper.java#L24)
  - `#{title}`과 같은 부분은 파라미털로 전달된 BoardVO 객체의 `getTitle()`과 같은 메서드들을 호출해서 파라미터들이 처리 :pushpin: [코드 확인](https://github.com/PrimarchAn/SpringProject02/blob/master/ex02/src/main/resources/org/taesan/mapper/BoardMapper.xml#L37)

<br>

- **Delete 처리**
  - 특정한 데이터를 삭제하는 작업은 PK값을 이용해서 처리(조회 작업과 유사) :pushpin: [코드 확인](https://github.com/PrimarchAn/SpringProject02/blob/master/ex02/src/main/java/org/taesan/mapper/BoardMapper.java#L27)
  - 등록, 삭제, 수정과 같은 DML 작업은 '몇건의 데이터가 삭제(혹은 수정)되었는지'를 반환
  - `delete()`의 메서드 리턴 타입은 `int`로 지정해서 만일 정상적으로 데이터가 삭제되면 1 이상의 값을 가지도록 설계 :pushpin: [코드 확인](https://github.com/PrimarchAn/SpringProject02/blob/master/ex02/src/main/java/org/taesan/mapper/BoardMapper.java#L27)

<br>

- **비즈니스 계층 구현과 테스트** :pushpin: [코드 확인](https://github.com/PrimarchAn/SpringProject02/tree/master/ex02/src/main/java/org/taesan/service)
 - 등록 작업의 구현과 테스트 :pushpin: [코드 확인](https://github.com/PrimarchAn/SpringProject02/blob/master/ex02/src/test/java/org/taesan/service/BoardServiceTests.java#L32)
 - 목록(리스트) 작업의 구현과 테스트 :pushpin: [코드 확인](https://github.com/PrimarchAn/SpringProject02/blob/master/ex02/src/test/java/org/taesan/service/BoardServiceTests.java#L45)
 - 조회 작업의 구현과 테스트 :pushpin: [코드 확인](https://github.com/PrimarchAn/SpringProject02/blob/master/ex02/src/test/java/org/taesan/service/BoardServiceTests.java#L52)
 - 삭제/수정 구현과 테스트 :pushpin: [코드 확인](https://github.com/PrimarchAn/SpringProject02/blob/master/ex02/src/test/java/org/taesan/service/BoardServiceTests.java#L58)

<br>

- **프레젠테이션(웹) 계층의 CRUD 구현** :pushpin: [코드 확인](https://github.com/PrimarchAn/SpringProject02/blob/master/ex02/src/main/java/org/taesan/controller/BoardController.java)
  - 목록에 대한 처리와 테스트 :pushpin: [코드 확인](https://github.com/PrimarchAn/SpringProject02/blob/master/ex02/src/test/java/org/taesan/controller/BoardControllerTests.java#L40)
  - 등록 처리와 테스트 :pushpin: [코드 확인](https://github.com/PrimarchAn/SpringProject02/blob/master/ex02/src/test/java/org/taesan/controller/BoardControllerTests.java#L47)
  - 조회 처리와 테스트 :pushpin: [코드 확인](https://github.com/PrimarchAn/SpringProject02/blob/master/ex02/src/test/java/org/taesan/controller/BoardControllerTests.java#L59)
  - 수정 처리와 테스트 :pushpin: [코드 확인](https://github.com/PrimarchAn/SpringProject02/blob/master/ex02/src/test/java/org/taesan/controller/BoardControllerTests.java#L70)
  - 삭제 처리와 테스트 :pushpin: [코드 확인](https://github.com/PrimarchAn/SpringProject02/blob/master/ex02/src/test/java/org/taesan/controller/BoardControllerTests.java#L84)

<br>

- **페이징 처리**
  - XML에서 사용할 수 없는 부등호 사용을 위해 CDATA 섹션 처리 :pushpin: [코드 확인](https://github.com/PrimarchAn/SpringProject02/blob/master/ex02/src/main/resources/org/taesan/mapper/BoardMapper.xml#L45)
  - MyBatis 처리와 테스트 :pushpin: [코드 확인](https://github.com/PrimarchAn/SpringProject02/blob/master/ex02/src/test/java/org/taesan/mapper/BoardMapperTests.java#L88)


</div>
</details>

### 4.4. REST 방식과 Ajax를 이용하는 댓글 처리
<details>
<summary><b>세부 설명 펼치기</b></summary>
<div markdown="1">

</div>
</details>

### 4.5. AOP와 트랜잭션
<details>
<summary><b>세부 설명 펼치기</b></summary>
<div markdown="1">

</div>
</details>

### 4.6. 파일 업로드 처리
<details>
<summary><b>세부 설명 펼치기</b></summary>
<div markdown="1">

</div>
</details>

### 4.7. Spring Web Security를 이용한 로그인 처리
<details>
<summary><b>세부 설명 펼치기</b></summary>
<div markdown="1">

</div>
</details>

</div>
</details>

</br>

## 5. 회고 / 느낀점
><a href="https://taesancoding.tistory.com"><img src="https://img.shields.io/badge/Velog-1DA1F2?style=plastic&logo=Velog&logoColor=white"/></a></a> / 프로젝트 개발 회고 글
