
<!DOCTYPE html>
<html>
<head>
	<title>Espaço Belas</title>
	<link rel="stylesheet" type="text/css" href="slide navbar style.css">
	<link href="https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap" rel="stylesheet">
</head>
<style>
  body {
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    font-family: 'Jost', sans-serif;
    background: linear-gradient(to bottom, #ed9d8c, #b84c65, #76232d);
  }

  .main {
    width: 350px;
    height: 500px;
    background: #b84c65;
    overflow: hidden;
    background: url("https://sua-imagem.jpg") no-repeat center/cover; /* Substitua com o URL da sua imagem */
    border-radius: 10px;
    box-shadow: 5px 20px 50px #000;
  }

  #chk {
    display: none;
  }

  .signup {
    position: relative;
    width: 100%;
    height: 100%;
  }

  label {
    color: #fff;
    font-size: 2.3em;
    justify-content: center;
    display: flex;
    margin: 60px;
    font-weight: bold;
    cursor: pointer;
    transition: .5s ease-in-out;
  }

  input {
    width: 60%;
    height: 20px;
    background: #e0dede;
    justify-content: center;
    display: flex;
    margin: 20px auto;
    padding: 10px;
    border: none;
    outline: none;
    border-radius: 5px;
  }

  button {
    width: 60%;
    height: 40px;
    margin: 10px auto;
    justify-content: center;
    display: block;
    color: #fff;
    background: #b84c65;
    font-size: 1em;
    font-weight: bold;
    margin-top: 20px;
    outline: none;
    border: none;
    border-radius: 5px;
    transition: .2s ease-in;
    cursor: pointer;
  }

  button:hover {
    background: #76232d;
  }

  .login {
    height: 460px;
    background: #eee;
    border-radius: 60% / 10%;
    transform: translateY(-180px);
    transition: .8s ease-in-out;
  }

  .login label {
    color: #76232d;
    transform: scale(.6);
  }

  #chk:checked ~ .login {
    transform: translateY(-500px);
  }

  #chk:checked ~ .login label {
    transform: scale(1);
  }

  #chk:checked ~ .signup label {
    transform: scale(.6);
  }

  #cor {
    color: black;
  }
</style>
<body>
	<div class="main"> 
		<input type="checkbox" id="chk" aria-hidden="true">
		<div class="signup">
			<form method="POST" action="/../EspacoBelas/belasphp/login/login.jsp"> <!-- Altere o caminho para o JSP de login -->
				<label for="chk" aria-hidden="true">Entrar</label>
				<input type="email" name="Email" id="Email" placeholder="Email" required="">
				<input type="password" name="Senha" id="Senha" placeholder="Password" required="">
				<button> Entrar</button>
			</form>
		</div>
		<div class="login">
			<form method="POST" action="/../EspacoBelas/belasphp/login/actionCadastrar.jsp"> <!-- Altere o caminho para o JSP de cadastro -->
				<label for="chk" aria-hidden="true">Cadastrar</label>
				<input type="text" name="Usuario" id="Usuario" placeholder="Nome" required>
				<input type="email" name="Email" id="Email" placeholder="Email" required>
				<input type="password" name="Senha" id="Senha" placeholder="Senha" required>
				<button>Cadastrar</button>
			</form>
		</div>
	</div>
</body>
</html>
