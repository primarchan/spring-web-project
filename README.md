# :pushpin: SpringProject02
>Spring Framework 기반 웹 서비스
>
>[코드로 배우는 스프링 웹 프로젝트]을 통해 학습된 내용을 기반으로 제작된 프로젝트

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
>이 서비스는 총 7단계로 구성되어있습니다.
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

- **servlet-context.xml** :pushpin: [코드 확인](https://github.com/PrimarchAn/SpringProject02/blob/master/ex00/src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml)
  - 웹과 관련된 스프링 설정파일

- **root-context.xml** :pushpin: [코드 확인](https://github.com/PrimarchAn/SpringProject02/blob/master/ex00/src/main/webapp/WEB-INF/spring/root-context.xml)
  - 스프링 설정파일

- **의존성 주입 테스트** :pushpin: [코드 확인](https://github.com/PrimarchAn/SpringProject02/tree/master/ex00/src/main/java/org/taesan/sample)
  - Restaurant 객체 생성 후 그곳에서 근무하는 Chef 객체를 주입하는 예제
  - Spring에서는 생성자를 이용한 주입과 Setter 메서드를 이용한 주입으로 의존성 구현
  - 의존성 주입 설정 방식은 주로 XML이나 Annotation을 이용해 처리

- **커넥션 풀 설정** :pushpin: [코드 확인](https://github.com/PrimarchAn/SpringProject02/blob/master/ex00/src/main/webapp/WEB-INF/spring/root-context.xml#L23)
  - Java에서는 DataSource라는 인터페이스를 통해 커넥션 풀을 사용
  - DataSource를 통해 매번 데이터베이스와 연결하는 방식이 아닌, 미리 연결을 맺어주고 반환하는 구조를 이요하여 성능 향상을 꾀함
  - 커넥션 풀에는 여러 종류가 있고, spring-jdbc를 이요하는 방식도 있지만 본 프로젝트에서는 HikariCP 이용

- **MyBatis와 Spring 연동** :pushpin: [코드 확인](https://github.com/PrimarchAn/SpringProject02/blob/master/ex00/src/main/webapp/WEB-INF/spring/root-context.xml#L27)
  - MyBatis는 'SQL 매핑(mapping) 프레임워크'로 분류
  - MyBatis와 Spring 연동을 통해 SQL 처리 속도 향상
  - 개발 편의성 증대를 위해 [Mapper](https://github.com/PrimarchAn/SpringProject02/blob/master/ex00/src/main/resources/org/taesan/mapper/TimeMapper.xml)를 XML과 인터페이스 + Annotation 형태로 작성 
</div>
</details>

### 4.2. 스프링 MVC 설정
<details>
<summary><b>세부 설명 펼치기</b></summary>
<div markdown="1">

</div>
</details>

### 4.3. 기본적인 웹 게시물 관리
<details>
<summary><b>세부 설명 펼치기</b></summary>
<div markdown="1">

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

### 4.7. Spring Web Security를 이용한 로그린 처리
<details>
<summary><b>세부 설명 펼치기</b></summary>
<div markdown="1">

</div>
</details>

</div>
</details>

</br>

## 5. 회고 / 느낀점
>프로젝트 개발 회고 글: https://taesancoding.tistory.com/
