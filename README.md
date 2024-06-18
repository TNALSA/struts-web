# 📋 Struts Framework를 이용한 게시판 웹사이트
---
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
## 프로젝트 구현
### 메인 화면
사용자 접속 시 보이는 홈 화면입니다.<br/>
우측 상단 [접속하기]를 통해 로그인을 진행할 수 있으며, Language 토글을 통해 원하는 언어로 변경이 가능합니다.<br/>
[게시판]을 선택하면 게시글의 목록을 조회할 수 있습니다.
<img src = "https://github.com/TNALSA/struts-web/assets/106741517/890194c3-d510-4b39-b0d3-d83af950dedb"/>
### 게시판 화면

