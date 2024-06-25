<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8" />
        <title>Novo jogo</title>
        
    </head>
    <body>
        <div class="container">
            <h1>Editar jogo</h1>
            <form action="/jogos/update" method="post">
                <input type="hidden" name="id" value="${jogo.id}" />
                <div>
                    <label class="form-label">Título:</label>
                    <input type="text" name="titulo" class="form-control" value="${jogo.titulo}" />
                </div>
                <div>
                    <label class="form-label">Gênero:</label>
                    <select name="genero" class="form-select">
                        <c:forEach var="item" items="${generos}">
                            <option ${item.id == jogo.genero.id ? "selected" : ""} value="${item.id}">${item.nome}</option>
                        </c:forEach>
                    </select>
                </div>
                <hr />
                <a href="/jogos/list" class="btn btn-secondary">Voltar</a>
                <button type="submit" class="btn btn-success">Salvar</button>
            </form>
        </div>
    </body>
</html>
