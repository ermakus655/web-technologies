<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html class="" lang="ru" dir="ltr">
<jsp:include page="include/head.jsp"/>
<body>
<div class="main-container">
    <div class="page-background"></div>
    <div class="page-container">
        <jsp:include page="include/header.jsp"/>
        <div class="page">
            <main class="page-main">
                <form>
                    <fieldset class="main-fieldset">
                        <legend id="lang-translate">Перакласці</legend>
                        <label>
                            <input type="radio" name="lang" value="be" id="lang-be"/>Беларуская </label>
                        <label>
                            <input type="radio" name="lang" value="en" id="lang-en"/> English </label>
                    </fieldset>
                </form>
                <h2>
                    <span id="lang-author-of-day">Рэжысёр дня</span>
                </h2>
                <div class="featured-1" id="featured-1">
                    <img src="<c:url value="/assets/Orlov.jpg"/>" width="40%" height="auto" alt=""/>
                    <p>Владимир Александрович Орлов
                    Владимир Орлов родился 6 января 1938 в Баку в сотрудника ЦААВИАХИМа Александра Викторовича и типографа Валентины Маркьяновны, переехавших в Баку, спасаясь от Голодомора в УССР. После развода жил с отцом и бабушкой в ​​Азербайджане.

                    В 1946 году отца перевели в Гродно на должность председателя ЦААВИАХИМа, куда он взял свою новую жену и сына. Здесь Владимир окончил школу с медалью ( 1956 ), решил стать режиссером. Он стал ассистентом на киностудии « Беларусьфильм », где работал помощником режиссера и режиссером-стажером до 1959 года. В 1958-1963 годах учился на режиссерском факультете Белорусского государственного театрально-художественного института.

                    В 1965-2000 годах работал на Государственном телевидении БССР (впоследствии Белоруссии) кинорежиссёром-постановщиком творческого объединения «Телефильм»).</p>
                </div>
                <div class="featured-2" id="featured-2">
                    <img src="<c:url value="/assets/Lukyanov.jpg"/>" width="20%" height="auto" alt=""/>
                    <p>Николай Валентинович Лукьянов (5 сентября 1949, Волковыск, Гродненская область — 21 сентября 2008, Минск) — советский, российский, белорусский актёр театра и кино, кинорежиссёр и кинокомпозитор.Родился 5 сентября 1949 года в Волковыске, Гродненской области, Белорусская ССР.

                        Учился в Волгоградском училище искусств на актёрском отделении; в Волгоградском педагогическом институте.

                        Работал актёром в Волгоградском театре драмы, в Рязанском ТЮЗе.

                        В 1976 году закончил режиссёрский факультет ВГИКа (мастерская А. Б. Столпера).

                        С 1976 по 1994 годы работал режиссёром-постановщиком киностудии «Беларусьфильм», работал Главным редактором киностудии.</p>
                </div>
                <h2>
                    <span id="lang-other">Іншыя рэжысеры</span>
                </h2>
                <div class="row">
                    <c:forEach items="${requestScope.authors}" var="item">
                        <div class="card card-text card-button">
                            <div>
                                <img src="<c:url value="/${item.getImagePath()}"/>" class="card-img-top">
                            </div>
                            <div class="card-body">
                                <div><span class="card-text">${item.getName()}</span></div>
                                <div><a href="<c:url value="/authors/${item.getName()}"/>"
                                        class="wds-button" id="lang-goto">Перайсці</a></div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <nav class="pagination-nav">
                    <ul class="pagination">
                        <li class="page-item"><a class="wds-button"
                                                 href="<c:url value="/index/paging?pageNumber=${sessionScope.authorPagingParams.getPageNumber() - 1}"/>"><<</a>
                        </li>
                        <li class="page-item"><a class="wds-button"
                                                 href="<c:url value="/index/paging?pageNumber=0"/>">1</a>
                        </li>
                        <li class="page-item"><a class="wds-button"
                                                 href="<c:url value="/index/paging?pageNumber=1"/>">2</a>
                        </li>
                        <li class="page-item"><a class="wds-button"
                                                 href="<c:url value="/index/paging?pageNumber=2"/>">3</a>
                        </li>
                        <li class="page-item"><a class="wds-button"
                                                 href="<c:url value="/index/paging?pageNumber=${sessionScope.authorPagingParams.getPageNumber() + 1}"/>">>></a>
                        </li>
                    </ul>
                </nav>
            </main>
        </div>
    </div>
</div>
<jsp:include page="include/script.jsp"/>
</body>
</html>