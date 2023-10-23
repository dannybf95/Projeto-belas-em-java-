(function (){
  /* ---- Constants ---- */

  const URL = 'https://instagram.com/'

  /* ---- Elements ---- */

  const sectionInstagram = document.querySelector('section[name="instagram"]')
  const inputInstagram = sectionInstagram.querySelector('input[name="instagram"]')
  const buttonAcessar = sectionInstagram.querySelector('button[name="acessar"]')

  /* ---- Events ---- */

  buttonAcessar.addEventListener('click', () => {
    const Instagram = inputInstagram.value
    const url = URL + Instagram
    navegar(url)
  })

  /* ---- Aux Functions ---- */

  function navegar (url) {
    const a = document.createElement('a')
    a.href = url
    a.target = '_self'
    a.click()
  }

  inputInstagram.addEventListener('keyup', function(e){
    if (e.keyCode == 13) {
      const Instagram = inputInstagram.value
      const url = URL + Instagram
      navegar(url)
    }
  })
  
}())