Caros, consegui realizar os testes de API e localizei um bug na API Version onde ela nem sempre apresenta todos os resultados que deveriam,
adicionei uma evidência em vídeo na pasta bug.

No teste de tela tive de colocar sleep pois as vezes o captcha era ativado, então o sleep é para realizar manualmente o captcha por tratar-se de um ambiente produtivo.


Coloquei também no teste de tela a validação mais genérica de que quando o teste acaba, dentro do modal sempre vem resultados.
Os testes de API estão bem completos, validações em lista de cada objeto que não seja nulo. Os valores de massa são armazenados no arquivo standard.yaml
Deixei um arquivo separado para métodos em comum e para testes de front utilizei siteprism.

O ideal seria que o projeto fosse separado em api e outro de ui, mas para deixar mais simples ficou tudo em um só.

Agradeço a oportunidade e espero que gostem do resultado. Qualquer coisa podem me procurar!
Bruno Nelli
https://www.linkedin.com/in/bruno-nelli/
11 999425432
