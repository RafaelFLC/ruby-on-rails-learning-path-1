import React, { useEffect, useState } from 'react'
import axios from 'axios'

import SignIn from './SignIn'
import Login from './Login'

function Welcome() {

  const [pokemon, setPokemon] = useState()
  const [showLogin, setShowLogin] = useState(true)
  const [user, setUser] = useState()

  useEffect( async () => { getRandomPokemon() }, [] )

  async function getRandomPokemon () {
    const result = await axios.get('api/pokemons/random')
    setPokemon(result.data)
  }


  const Btn = ({type}) => {
    const isLoginBtn = type == 'login'
    const textColor = isLoginBtn && showLogin ? 'text-blue-400' : (!isLoginBtn && !showLogin ? 'text-blue-400' : '')
    return (
      <button className={`m-2 p-2 text-center rounded-lg shadow-lg ${textColor}`}
        onClick={() => setShowLogin(isLoginBtn)}
      >
        { isLoginBtn ? 'Log In' : 'Sign In' }
      </button>
    )
  }

  return (
    <div className="flex md:flex-row flex-col-reverse w-full items-center justify-around">
      <div className="flex flex-col md:w-1/3 w-full h-2/3 py-4 m-2 text-center rounded-lg shadow-lg">
        <div className="flex flex-row justify-center">
          <Btn type='login'/>
          <Btn type='signin'/>
        </div>
        <div className="flex flex-1 align-middle p-4" >
          { showLogin ? <Login/> : <SignIn onSubmit={() => setShowLogin(false)} /> }
        </div>
      </div>
    </div>
  )
}

export default Welcome
