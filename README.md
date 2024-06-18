# 📋 Struts Framework를 이용한 게시판 웹사이트
## ⏲️ 개발 기간
2023.06 ~ 2023.08 (약 2개월)
## 😄 개발 인원
1명 - (개인 프로젝트)
## 🌳 프로젝트 환경
* **Java:** 1.8v
* **Struts:** 1.3v
* **Tomcat:** 8.5.1v
* **JSP:** 2.3v
* **MySQL:** 8.0v
## 📂 프로젝트 구성
**MVC 패턴**을 이용하여 프로젝트를 구성하였습니다.
```bash
webProject
├── Model
│   ├── postDTO
├── View
│   ├── index.jsp
│   ├── join.jsp
│   ├── login.jsp
│   ├── main.jsp
│   ├── post.jsp
│   ├── update.jsp
│   ├── view.jsp
│   ├── write.jsp
├── Controller (Action)
│   ├── deleteAction.java
│   ├── joinAction.java
│   ├── loginAction.java
│   ├── logoutAction.java
│   ├── mainAction.java
│   ├── postAction.java
│   ├── updateAction.java
│   ├── updateActionFormAction.java
│   ├── ViewAction.java
│   ├── writeAction.java
│   ├── writeActionForm.java
```
## ⏯️ 프로젝트 구현

### 메인 화면
사용자 접속 시 보이는 홈 화면입니다.<br/>
우측 상단 `접속하기`를 통해 로그인을 진행할 수 있으며, `Language 토글`을 통해 원하는 언어로 변경이 가능합니다.<br/>
`게시판`을 선택하면 게시글의 목록을 조회할 수 있습니다.
<img src = "https://github.com/TNALSA/struts-web/assets/106741517/890194c3-d510-4b39-b0d3-d83af950dedb"/>

### 게시판 목록
사용자들이 작성한 게시글들을 볼 수 있습니다.<br/>
사용자가 로그인에 성공하게 되면 게시글을 `글쓰기`를 통해 게시글을 작성할 수 있습니다.<br/>
<img src = "https://github.com/prod-j/coupon-version-management/assets/106741517/4ce1a60e-6a1a-4463-a894-d0326694614b"/>

### 게시글 작성
제목과 내용을 작성합니다.
<img src = "https://github.com/prod-j/coupon-version-management/assets/106741517/f8a24f8e-f0e9-48d4-94f2-1a556cfe32c5"/>
내용 작성 후, `글쓰기`를 통해 게시글을 등록합니다.
<img src = "https://github.com/prod-j/coupon-version-management/assets/106741517/56a2444a-feba-4ff4-956a-3f53b4715908"/>

### 게시글 상세보기
작성한 게시글의 내용을 볼 수 있습니다. <br/>
게시글의 **작성자만 게시글을 수정, 삭제**할 수 있습니다. <br/>
`수정`을 통해 게시글을 원하는 내용으로 수정할 수 있습니다. <br/>
`삭제`를 통해 원하는 게시글을 삭제할 수 있습니다.
<img src = "https://github.com/prod-j/coupon-version-management/assets/106741517/fd34e696-5dad-4dde-85d2-6997b56bf5ce"/>

### 게시글 수정
원하는 내용으로 수정 후 `수정`통해 게시글을 수정합니다.
<img src = "https://github.com/prod-j/coupon-version-management/assets/106741517/10bd530f-9d87-48d9-a428-af7c16ce674a"/>

### 게시글 삭제
`삭제`시 팝업을 통해 사용자에게 삭제 여부를 확인합니다.
<img src = "https://github.com/prod-j/coupon-version-management/assets/106741517/a925e128-4115-4481-87a2-95c9f503402c"/>
`확인`을 누르게 되면 성공적으로 게시글을 삭제할 수 있습니다.
<img src = "https://github.com/prod-j/coupon-version-management/assets/106741517/004f2c8a-97bf-4310-ad15-79c1bd6efda9"/>
