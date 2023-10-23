(function (){

  // Variables

  const body = document.querySelector('body')
  const nav = document.querySelector('nav')
  const abrirMais = nav.querySelector('button[name="abrirMais"]')
  const quadroMais = nav.querySelector('div[name="quadroMais"]')
  const abrirMenuMobile = nav.querySelector('button[name="abrirMenuMobile"]')
  const menuMobile = nav.querySelector('div[name="menuMobile"]')

  // ADICIONAR CLASSE AO SCROLLAR

  function adicionarClasse () {
    window.addEventListener('scroll', () => {
      const alturaPagina = window.scrollY
      if (alturaPagina < 10) nav.classList.remove('scroll')
      else nav.classList.add('scroll')
    })
  }

  // ABRIR HOSPEDAGEM
  function cliqueAbrirMais () {
    abrirMais.addEventListener('click', () => {
      if (quadroMais.classList.contains('mostrar')) quadroMais.classList.remove('mostrar')
      else quadroMais.classList.add('mostrar')
    })
  }


  // ABRIR MENU
  function abrirFecharMenuMobile () {
    abrirMenuMobile.addEventListener('click', () => {
      if (body.classList.contains('bloqueado')) body.classList.remove('bloqueado')
      else body.classList.add('bloqueado')
      if (abrirMenuMobile.classList.contains('ativo')) abrirMenuMobile.classList.remove('ativo')
      else abrirMenuMobile.classList.add('ativo')
      if (menuMobile.classList.contains('mostrar')) menuMobile.classList.remove('mostrar')
      else menuMobile.classList.add('mostrar')
    })
  }

  // Start
  adicionarClasse()
  cliqueAbrirMais()
  abrirFecharMenuMobile()

}())

