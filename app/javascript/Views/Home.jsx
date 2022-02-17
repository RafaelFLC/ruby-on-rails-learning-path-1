import axios from 'axios'
import React, { useContext, useEffect, useState } from 'react'
import { AppContext } from '../Context/AppContext'
import { UserContext } from '../Context/UserContext'
import Dashboard from '../Modules/Pokemon/Dashboard'
import BtnAddPokemon from '../Modules/UI/Buttons/BtnAddPokemon'

import NotFound from './NotFound'

function Home() {

  const { user } = useContext(UserContext)
  const { changeTitle } = useContext(AppContext)

  const [pokemons, setPokemons] = useState([])
  const [view, setView] = useState('dashboard')

  const getOwnedPokemons = async () => {
    if (!user) return

    const result = await axios.post( 'api/pokemons/getAllMine', {token: user.token} )

    if (result.data)
      setPokemons(result.data)
  } 

  useEffect( async () => {getOwnedPokemons(); changeTitle('Dashboards')}, [user] )


  const RenderView = () => {

    if (pokemons.length <= 0 )
      return <NotFound />

    switch (view) {
      case 'dashboard': 
        changeTitle('Dashboard')
        return <Dashboard pokemons={pokemons} />
      case 'edit':
        changeTitle('Editing')
        return <span>Editing</span>
    }
  }

  return (
    <div className='flex flex-col h-full'>
      <div className="flex flex-col flex-1 w-full items-center mt-6">
        <BtnAddPokemon/>
        <RenderView />
      </div>
    </div>
  )
}

export default Home