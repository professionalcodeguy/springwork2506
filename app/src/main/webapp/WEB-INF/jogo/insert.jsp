<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8" />
        <title>Novo Jogo</title>
        
    </head>
    <body>
        <%@ include file = "../_templates/navbar.jsp"%>
        <div class="container">
        <h1>Novo Jogo</h1>
            <form action="/jogos/insert" method="post">
                <div>
                    <label class="form-label"> Título: </label>
                    <input type="text" name="titulo" class="form-control">
                </div>
                <div>
                    <label class="form-label">Gênero:</label>
                    <select name="genero" class="form-control">
                        <c:forEach var="item" items="${generos}">
                            <option value="${item.id}">${item.nome}</option>
                        </c:forEach>
                    </select>
                </div>
            <a href="/jogos/list" class="btn btn-secondary">Voltar</a>
            <button type="submit" class="btn btn-success">Salvar</button>
            </form>
        </div>
    </body>
</html>
