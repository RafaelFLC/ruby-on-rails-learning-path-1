import React, { useContext } from 'react'
import { Link } from 'react-router-dom'

import { AppContext } from '../../Context/AppContext'
import { UserContenxt } from '../../Context/UserContext'
import { ThemeContext } from '../../Context/ThemeContext'

function UserLayout ({children}) {

  const { state } = useContext(AppContext)

  return (
    <div className='flex flex-col h-full dark:bg-gray-700 overflow-scroll'>
      <div className="h-10 m-2 flex flex-row justify-between align-middle text-md md:text-lg">
        <span className="w-1/6 md:w-1/3 font-bold text-gray-700 self-center">
          <Link to='/'> {state.icon} </Link>
        </span>
        <span className="hidden md:block md:w-1/2 text-center self-center">
            {state.title}
        </span>
        <div className="flex justify-end md:w-1/3 self-center text-right content-center items-center">
          
        </div>
      </div>
      {children}
    </div>
  )
}

export default UserLayout