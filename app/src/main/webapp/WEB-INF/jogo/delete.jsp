<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8" />
        <title>Remover Jogo</title>
    </head>
    <body>
        <div class="container">
            <h1>Remover Jogo</h1>
            <form action="/jogos/delete" method="post">
                <input type="hidden" name="id" value="${jogo.id}" />
                <p>Tem certeza que deseja remover o jogo ${jogo.titulo}? </p>
                <hr />
                <a href="/jogos/list" class="btn btn-secondary">Voltar</a>
                <button type="submit" class="btn btn-danger">Excluir</button>
            </form>
        </div>
    </body>
</html>
